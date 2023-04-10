resource "aws_instance" "web" {
    ami = data.aws_ami.amazonlinux.id 
    instance_type =  "t2.micro"
    security_groups =  [module.sg.sg_name]
    user_data = file("./web/server-script.sh")
    key_name = var.key_pair
    tags = {
      "Name" = "Web Severe"
    }

  
}

output "pub_ip" {
    value = module.eip.publicIP
  
}

module "eip" {
    source = "../eip"
    instance_id = aws_instance.web.id

  
}

module "sg" {
    source = "../sg"
}