resource "aws_instance" "ec2" {
    ami = data.aws_ami.amazonlinux.id
    instance_type = var.my_instance_type

    tags = {
      "Name" = "Prod_ec2"
    }
}