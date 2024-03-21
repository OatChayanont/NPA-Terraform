
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

output "aws_instance_public_ip" {
  value = aws_instance.testweb[0].public_ip
}