
variable "aws_access_key_id" {
    type = string
    sensitive = true
}
variable "aws_secret_access_key" {
    type = string
    sensitive = true
}
variable "aws_session_token" {
    type = string
    sensitive = true
}
variable "aws_region_name" {
    type = string
    sensitive = false
}
variable "key_name" {
    type = string
    sensitive = false
}
variable "default_name" {
  default = "itkmitl"
}
variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "availability_zone" {
  type = map
  default = {
    1:"us-east-1b"
    2:"us-east-1c"}
}
variable "availability_zone_count"{
  type = number
  default = 2
}