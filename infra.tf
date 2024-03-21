## Create a new VPC
resource "aws_vpc" "testVPC" {
  cidr_block = var.cidr_block
  tags = {
    Name = "testVPC"
  }
  enable_dns_hostnames = true
  enable_dns_support = true
}


# Create a new subnet2
resource "aws_subnet" "Public"{
  for_each = slice(data.aws_availability_zones.available.names, 0, var.availability_zone_count)
  vpc_id = aws_vpc.testVPC.id
  # cidr_block = cidrsubnet(var.cidr_block,8,2)
  availability_zone = each.key
  tags = merge(local.default_tags,{
    Name = "${var.default_name}-Public2"
  })
}

## Create a new subnet
# resource "aws_subnet" "Public" {
#   for_each = var.availability_zone
#   vpc_id = aws_vpc.testVPC.id
#   cidr_block = cidrsubnet(var.cidr_block,8,tonumber(each.key))
#   availability_zone = each.value
#   map_public_ip_on_launch = true
#   tags = merge(local.default_tags,{
#     Name = "${var.default_name}-Public${each.key}"
#   })
# } 

## Create a new Internet gateway
# resource "aws_internet_gateway" "testIgw" {
#   vpc_id = aws_vpc.testVPC.id
#   tags = merge(local.default_tags,{
#     Name = "${var.default_name}-testIgw"
#   })
# }


# ## Create a new Route Table
# resource "aws_route_table" "publicRouteTable" {
#   vpc_id = aws_vpc.testVPC.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id  = aws_internet_gateway.testIgw.id
#   }
#   tags = merge(local.default_tags,{
#     Name = "${var.default_name}-publicRouteTable"
#   })
# }

# ## Create a new Route Table Association
# resource "aws_route_table_association" "publicRouteTableAssociation1" {
#   route_table_id = aws_route_table.publicRouteTable.id
#   subnet_id = aws_subnet.Public["1"].id
# }

# resource "aws_route_table_association" "publicRouteTableAssociation2" {
#   route_table_id = aws_route_table.publicRouteTable.id
#   subnet_id = aws_subnet.Public["2"].id
# }