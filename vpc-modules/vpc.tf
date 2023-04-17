# we are making use of aws module to call this resource and create our VPc
# But this is in the hardcodin structure, becausechave specified everthing here
# to have this search for "teraform vpc module" and here we are using the simple module
# so, behind (in the backgroung) what ever we specified here it will go to the module online and create what we have specified
 


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name = "vpc-dev"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-1c", "us-west-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets = ["10.0.151.0/24", "10.0.152.0/24"]
  enable_dns_hostnames = true
  enable_dns_support = true 

  public_subnet_tags = {
    type = "public-subnets"
  }

  private_subnet_tags = {
    type = "private-subnets"
  }

  database_subnet_tags = {
    type = "database-subnets"
  }


  tags = {
    owner = "samueltech"
    Environment = "dev"
  }
  vpc_tags = {
    Name = "vpc-dev"
  }
}