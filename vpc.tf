# # VPC
# resource "aws_vpc" "main" {
#   cidr_block = var.cidr-block
#   tags = merge(var.tags, {
#     Name = "UltimateDevopsVPC"
#     }
#   )
# }
# # Internet Gateway
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.main.id

#   tags = merge(var.tags, {
#     Name = "UltimateDevopsIGW"
#     }
#   )
# }
# # Public Subnet
# resource "aws_subnet" "public_subnet" {
#   for_each                = { for i, az in local.azs : az => local.public_subnet[i] }
#   vpc_id                  = aws_vpc.main.id
#   availability_zone       = each.key
#   map_public_ip_on_launch = "true"
#   cidr_block              = each.value
#   tags = merge(var.tags, {
#     Name = "UltimateDevops_public_subnet"
#     }
#   )
# }
# # Private Subnet
# resource "aws_subnet" "private_subnet" {
#   for_each                = { for i, az in local.azs : az => local.private_subnet[i] }
#   vpc_id                  = aws_vpc.main.id
#   availability_zone       = each.key
#   map_public_ip_on_launch = "true"
#   cidr_block              = each.value
#   tags = merge(var.tags, {
#     Name = "UltimateDevops_private_subnet"
#     }
#   )
# }
# # Elastic Ip for NAT
# resource "aws_eip" "eip" {
#   tags = merge(var.tags, {
#     Name = "UltimateDevops_public_subnet"
#     }
#   )
# }
# # NAT Gateway
# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.eip.id
#   subnet_id     = values(aws_subnet.public_subnet)[0].id

#   tags = merge(var.tags, {
#     Name = "UltimateDevops_nat_gateway"
#     }
#   )

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.igw]
# }
# # Public Route table 
# resource "aws_route_table" "public_rt" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = merge(var.tags, {
#     Name = "UltimateDevops_public_Route_table"
#     }
#   )
# }
# # Public Route table Associate to public Subnet
# resource "aws_route_table_association" "public" {
#   for_each       = aws_subnet.public_subnet
#   subnet_id      = each.value.id
#   route_table_id = aws_route_table.public_rt.id
# }
# # Private Route table 
# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat.id
#   }

#   tags = merge(var.tags, {
#     Name = "UltimateDevops_private_Route_table"
#     }
#   )
# }
# # Private Route table Associate to Private Subnet
# resource "aws_route_table_association" "private" {
#   for_each       = aws_subnet.private_subnet
#   subnet_id      = each.value.id
#   route_table_id = aws_route_table.private_rt.id
# }
