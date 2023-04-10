terraform {
    required_version = "~> 1.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version =  "~> 3.0"
        }
      
    }
  
}

provider "aws"  {
    region = "us-east-1"
    #default = "default"
}

module "db" {
    source = "./db"

}

module "web" {
    source = "./web"
}

output "privateIP" {
    value = module.db.privateIP

}

output "publicIP" {
    value = module.web.pub_ip

}

