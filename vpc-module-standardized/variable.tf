variable "region" {
    description = "The aws region"
    type = string
    default = "us-west-1"
  
}

# Enviroment Variable
variable "environment" {
    description = "Environment Variable used as a prefix"
    type = string
    default = "dev"
  
}

# Business Division
variable "business_division" {
    description = "Business Division in the organization this intrastructure belongs"
    type = string
    default = "samueltech"
  
}