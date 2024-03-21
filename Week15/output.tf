##################################################################################
# OUTPUT
##################################################################################

output "aws_lb_public_dns" {
  value = aws_lb.webLB.dns_name
}

output "aws_s3_bucket_id"{
  value = module.s3_bucket.id
}