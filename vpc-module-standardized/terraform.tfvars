# The terraform.tfvar file are variable we can use it to direct our creation of the resources in different Rigion and enviroment as well
# and whatever is pass in this file it will overried the our resource file as well well. So with the usued of this file we acctually creat our risources in different ENV

# Generic Variables
aws_region = "us-west-1"  # "us-west-2"
environment = "stag"        # " prod"
business_division = "HR1"   #"Finance department"