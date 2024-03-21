
# ## Create a new security group
# resource "aws_security_group" "AllowSSHandWeb" {
#   name = "AllowSSHandWeb"
#   vpc_id = aws_vpc.testVPC.id
#   description = "Allow incoming SSH and HTTP traffic to EC2 instances"

#   ingress {
#     from_port   = 21
#     to_port     = 21
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = -1
#     cidr_blocks = ["0.0.0.0/0"]
# }
# }
