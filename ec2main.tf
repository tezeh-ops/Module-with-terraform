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

module "ec2module" {
    source = "./ec2-module"
    ec2name = "Demo-ec2"
  
}
output "module_output" {
    value = module.ec2module.instance_id

   
 }