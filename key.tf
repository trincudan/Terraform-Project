resource "aws_key_pair" "key_pair"{
  key_name = "PrivKey"
  public_key = file("./id_rsa.pub")
}