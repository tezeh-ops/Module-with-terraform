# here we are passing our vpc-out.tfvars file which mean what we pass here willbe automatically be uploaded when we run "terraform init"
# What ever we pass in this file it will override our resouce file. EX if we have in our resouce file Vpc_name = "dev"
# and in our out.tfvars we say vpc_name = "myvpc or samuel" when cfreating the resources it will use what it has been decleared in the auto.tfvars file

# VPC Variables
vpc_name = "myvpc"
vpc_cidr_block = "10.0.0.0/16"
vpc_availability_zones = ["us-west-1b", "us-west-1c"]
vpc_public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_database_subnets= ["10.0.151.0/24", "10.0.152.0/24"]
vpc_create_database_subnet_group = true
vpc_create_database_subnet_route_table = true
vpc_enable_nat_gateway = true
vpc_single_nat_gateway = true