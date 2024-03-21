
##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  token      = var.aws_session_token
  region     = var.aws_region_name
}

##################################################################################
# OUTPUT
##################################################################################

output "aws_eiei" {
  value = data.aws_availability_zones.available
}