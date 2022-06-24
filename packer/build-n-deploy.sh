#!/bin/bash

AMI_TF_FILE="../modules/instances/AMIs.tf"
INSTANCES=("Frontend")
TIMESTAMP=$(date +%H%M%m%d)

for instance in ${INSTANCES[@]};do
  FILE_SOURCE=""
  FILE_DESTINATION=""
  echo "Creating instance ${instance}..."
  LOG_FILE="/tmp/builder-${instance}.txt"
  SCRIPT="scripts/${instance}_setup.sh"
  if [[ $(grep "${instance}" "${AMI_TF_FILE}") ]];then
    read -n1 -rp "Old AMI for ${instance} found! Do you want to renew the AMI ? [Y/n] : " response; echo -e "\n"
    if [[ "$response" =~ ^(y|Y)$ ]]; then
      echo "Removing AMI-ID for ${instance}..."
      OLD_AMI=$(grep "${instance}" ../modules/instances/AMIs.tf | awk '{print $6}' | sed s/\"//g)
      awk '!/'${instance}'/{print $0}' ${AMI_TF_FILE} > /tmp/new_amis.txt && mv /tmp/new_amis.txt ../modules/instances/AMIs.tf
      aws ec2 deregister-image --image-id ${OLD_AMI}
      echo "Removed."
    else
      break
    fi
  fi
  read -n1 -rp "Do you want to upload a file to ${instance} ? [Y/n] : " response; echo -e "\n"
  if [[ "$response" =~ ^(y|Y)$ ]]; then
    while [ true ];do
			echo "Which file do you want to upload?"
      FILES=$(find uploads -type f | sed 's/uploads\///g')
			echo "${FILES}"
      read -p "Source file path: " source;
      if [[ ! $(echo "${FILES}" | grep $source) ]]; then
        echo "$source not found."
      else
				break
			fi
    done
    FILE_SOURCE="uploads/$source"
    FILE_DESTINATION="/tmp/uploads/$source"
  fi
  echo "Creating builder for ${instance}..."
  ./create_builder.sh ${instance} ${SCRIPT} ${FILE_SOURCE} ${FILE_DESTINATION}
  echo "Creating AMI for ${instance}..."
  packer build -machine-readable builders/${instance}-builder.json > "$LOG_FILE"
  AMI_ID=$(cat "$LOG_FILE" | grep "amazon-ebs: AMI:" | awk '{print $4}')
  echo "${instance}-AMI: ${AMI_ID}"
  echo "Export new AMI to ../modules/instances/AMIs.tf..."
  echo -e "\nvariable ${instance}_AMI-ID { default = ${AMI_ID} }" >> "${AMI_TF_FILE}"
done
echo "Complete !"