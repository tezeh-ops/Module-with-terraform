variable "instance_id" {
    type = string
  
}

resource "aws_eip" "web_ip" {     # we are going to attach this to are web server
    instance = var.instance_id
  
}

output "publicIP" {
    value = aws_eip.web_ip.public_ip
  
}