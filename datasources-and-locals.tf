# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
  public_subnet = [for k,az in local.azs : cidrsubnet(var.cidr-block, 8, k)]
  private_subnet = [for k,az in local.azs : cidrsubnet(var.cidr-block, 8, k+10)]
} 
