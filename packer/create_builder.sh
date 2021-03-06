#!/bin/bash

AMI_NAME=$1
SCRIPT=$2
FILE_SOURCE=$3
FILE_DESTINATION=$4

echo '
{
  "'builders'": [
    {
      "'type'": "'amazon-ebs'",
      "'access_key'": "'{{user \`aws_access_key\`}}'",
      "'secret_key'": "'{{user \`aws_secret_key\`}}'", 
      "'region'": "'eu-central-1'",
      "'ami_name'": "'${AMI_NAME}'",
      "'source_ami'": "'ami-065deacbcaac64cf2'",
      "'instance_type'": "'t2.micro'",
      "'ssh_username'": "'ubuntu'"
    }
  ],

  "'provisioners'": [
    {
      "'type'": "'file'",
      "'source'": "'${FILE_SOURCE}'",
      "'destination'": "'${FILE_DESTINATION}'"
    },
    {
      "'type'": "'shell'",
      "'script'": "'${SCRIPT}'"
    }
  ]
}
' > builders/${AMI_NAME}-builder.json