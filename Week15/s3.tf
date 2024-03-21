##################################################################################
# RESOURCES
##################################################################################

module "s3_bucket" {
  source = "./S3_Module"
  s3_bucket_name = "oat"
}

resource "aws_s3_object" "image1" {
  bucket        = module.s3_bucket.id
  key = "image1.jpg"
  source = "./images/image1.jpg"
  tags = merge(local.common_tags,{
    university = local.cName
    })
}