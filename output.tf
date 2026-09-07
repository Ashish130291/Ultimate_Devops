output "vpc_id" {
  value       = "aws_vpc_main.id"
  description = "The ID of the created VPC"
}

output "public_subnet" {
  value = [for s in aws_subnet.public_subnet : s.id]

}

output "private_subnet" {
  value = [for s in aws_subnet.private_subnet : s.id]

}