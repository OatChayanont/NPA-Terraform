##################################################################################
# RESOURCES
##################################################################################

# module "s3_bucket" {
#   source = "./S3_Module"
#   s3_bucket_name = "oat"
# }

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.1"
  bucket = "s3-bucket-asdwef293"
  acl = "private"
}

# resource "aws_s3_object" "image1" {
#   bucket        = module.s3_bucket.id
#   key = "image1.jpg"
#   source = "./images/image1.jpg"
#   tags = merge(local.common_tags,{
#     university = local.cName
#     })
# }

module "s3-bucket_object" {
  source  = "terraform-aws-modules/s3-bucket/aws//modules/object"
  version = "4.1.1"
  bucket = module.s3-bucket.s3_bucket_id  
  key = "image1.jpg"
  file_source = "./images/image1.jpg"
}