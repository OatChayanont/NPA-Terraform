
## Create a new instance
# resource "aws_instance" "testweb" {
#   count = 2
#   ami                    = data.aws_ami.aws-linux.id
#   instance_type          = "t2.micro"
#   key_name               = "vockey"
#   subnet_id = aws_subnet.Public[count.index+1].id
#   vpc_security_group_ids = [aws_security_group.AllowSSHandWeb.id]
#   root_block_device {
#     volume_size = 8
#     volume_type = "gp2"
#   }
#   tags = merge(local.default_tags,{
#     Name = "${var.default_name}-Server${count.index+1}"
#   })
# }

## Create a new instance
resource "aws_instance" "testweb" {
  for_each = var.availability_zone
  ami                    = data.aws_ami.aws-linux.id
  instance_type          = "t2.micro"
  key_name               = "vockey"
  subnet_id = aws_subnet.Public[each.key].id
  vpc_security_group_ids = [aws_security_group.AllowSSHandWeb.id]
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }
  tags = merge(local.default_tags,{
    Name = "${var.default_name}-Server${each.key}"
  })
}
