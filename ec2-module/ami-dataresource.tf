#al2023-ami-*-x86_64  # here we want terraform to search for any ami that has the verious numbers in it

#al2023-ami-2023.0.20230322.0-kernel-6.1-x86_64  # here is the original ami name but since the number keeps changing, we have to replace them with " * " in order to 
# to search and bring us the later version of the numbers in between.
# below is the customize data source of aws_ami
data "aws_ami" "amazonlinux" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}  