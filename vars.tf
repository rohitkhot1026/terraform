variable "vpc_name" {
  description = "provide VPC name"
  type 	      = string
} 

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets."
  type        = string
}

variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets."
  type        = string
}

variable "public_subnet_name" {
  description = "Provide public subnet name"
  type       = string
}

variable "private_subnet_name" {
  description = "Provide private subnet name"
  type       = string
}

variable "igw_name" {
  description = "Provide IGW name"
  type       = string
}

variable "routeTable_name" {
  description = "Provide RT name"
  type       = string
}

variable "routeTable_name_1" {
  description = "Provide RT name"
  type       = string
}

variable "elasticIP_name" {
  description = "Provide EIP name"
  type       = string
}

variable "nat_gateway_name" {
  description = "Provide NAT name"
  type       = string
}

variable "security_group_name" {
  description = "provide Security group name"
  type        = string
}

variable "az_pub" {
  description = "provide AZ for public subnet"
  type = string
}

variable "az_prv" {
  description = "provide AZ for private subnet"
  type = string
}
