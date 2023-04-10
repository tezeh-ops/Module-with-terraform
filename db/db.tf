resource "aws_instance" "db"{
    ami = data.aws_ami.amazonlinux.id
    instance_type =  "t2.micro"
     
     tags = {
       "Name" = "Db Server"
     }
}

output  "privateIP" {
    value = aws_instance.db.private_ip

}