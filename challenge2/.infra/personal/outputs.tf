#VPC Outputs
output "vpc_id" {
  description = "ID of project VPC"
  value       = resource.aws_vpc.jantae_vpc.id
}

output "vpc_ip_block" {
  description = "IPv6 address block of project VPC"
  value       = resource.aws_vpc.jantae_vpc.cidr_block
}


#Public Subnet Outputs
output "public_subnet_id" {
  description = "ID of project VPC Public Subnet"
  value       = resource.aws_subnet.public.id
}

output "public_subnet_ip_block" {
  description = "IPv6 address block available of project VPC Public Subnet"
  value       = resource.aws_vpc.jantae_vpc.cidr_block
}

#Public Internet Gateway Outputs
output "internet_gateway_id" {
  description = "ID of project VPC Public Subnet"
  value       = resource.aws_internet_gateway.jantae_vpc_igw.id
}

output "internet_gateway_ip_block" {
  description = "IPv6 address block available of project VPC Internet Gateway"
  value       = resource.aws_vpc.jantae_vpc.cidr_block
}

#Route Table Outputs
output "route_table_id" {
  description = "ID of project VPC Route Table"
  value       = resource.aws_route_table.jantae_vpc_us_east_1_public.id
}

output "route_table_vailable_routes" {
  description = "IPv6 address in project VPC Route Table"
  value       = resource.aws_route_table.jantae_vpc_us_east_1_public.route
}
