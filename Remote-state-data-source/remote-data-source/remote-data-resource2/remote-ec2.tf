terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
  # Provider Block
provider "aws" {
    region  = "us-east-1"
    profile = "default"
  }


# Nb we are making use of an existing state file but when we run this it will create it own statefile here in the local ENV, But we can still configure it another baackend here as well. 
# OR we can still use the same buck of the exiting state file but give it anothe path: instaesd of < key = terraform/terraform.tfstate>  it can do <Dev/terraform.tfstate> OR prod/terraform.tfstate> etc
# In this way it will create a "dev" " prod" directory and save the state-file in it as well.
# here we are trying to access an existing state-file in an S3 bucket and is existinf=g as well to create provision the EC2 resource below
# SO, we are making use of a state-file to put inmore resource
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket =  "bootcamp-30-7-tez"                      # "my-terraformstate-landmark-buc"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

# if the state-file was in our local storage this how we will refference it to privision more resource in it


/*data "terraform_remote_state" "network" {
  backend = "local"
  config = {
      path    = "../remote-data-source/terraform.tfstate"   # here we are passing the path where the file is found
  }
}*/

resource "aws_instance" "my-ec2"{
  ami = data.aws_ami.amazonlinux.id
  instance_type = "t2.micro"
  subnet_id = data.terraform_remote_state.network.outputs.public_subnets[1] # here what we are sying is that we want to create this ec2
                              # instance so go the the data block above ie for our remote bucket <data.terraform_remote_state.network.outputs.pubblic_subnets[1]
                           # the <output.public_subnets> we are making use of the the vpc that we have created in the existing state-file and using the output block of the vpc we are passing the public_subnent to create our Ec2 in it
  tags = {                 # and since the ID (1a & 1c) if the subnets are in the form of a list we are making use of the second[1]    
    "Name" = "My_ec2"
  }
}