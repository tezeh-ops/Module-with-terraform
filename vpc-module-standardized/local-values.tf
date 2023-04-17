# Define local Values in Terraform
# Local block is the block we use to pass in names which areclong and we don't want to pass them in our code, so we pass them here then call them in our code.

locals {
  owners = var.business_division
  name = "${var.business_division}-${var.environment}"
  #name = "${local.owners}-${local.environment}"

  common_tags = {
    owners = local.owners
    #environment = local.environment
  }
}