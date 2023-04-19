terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


# i will be usind an exiting bucket to for my backend. the reason is if i creat the bucket below and use it it work as a back end but when i will run
terraform{           # the terraform destroy command it will destroy the bucket below as well and my stata-file will have no place to be store it will give me an error of which it can't proceed with the destroy
  backend "s3" {      # NB but if i creat the bucket below and used it as my backend and declear it not tobe destroy it will be able to save the state-file as well. because the file must have a home to stay.
    bucket =  "bootcamp-30-7-tez"      #"my-terraformstate-sam-buc" 
    key = "terraform/terraform.tfstate"  # terraform/ here is just a directory that we want to use and save in our state-file
    dynamodb_table = "terraform-lock"  # this is to lock down our state-file and we can't destroy it with the lock still active. So for us to be able
    region = "us-east-1"                   # to destroy it with the lock we have to pass > "terraform destroy -auto-approve  --lock=false"  command

  }
}  

/*
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-terraformstate-sam-buc"
  acl    = "private"       # making the bucket private
  versioning {
    enabled = true           # enabeling versioning
   
  }
  force_destroy = true
  tags = {
    Name        = "My terraform-bucket"
    Environment = "Dev"
  }
}
*/
resource "aws_dynamodb_table" "tf_lock" {
  name = "terraform-lock"
  hash_key = "LockID"
  read_capacity = 3
  write_capacity = 3
  attribute {
     name = "LockID"
     type = "S"
   }
  tags = {
    Name = "Terraform Lock Table"
   }
   lifecycle {
   prevent_destroy = false    # true   # when we pass a lifecycle = true we can't destroy our resource accidentaly and terrform destroy commad won't work
  }                         # unless we change prevent_destroy = false. NB we can pass this lifecycle on any resource we don't want to destroy.
 }



 # Provider Block
provider "aws" {
   region  = "us-east-1"
   profile = "default"
 }