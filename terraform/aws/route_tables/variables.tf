variable "vpc_id" {}
variable "igw_id" {}
variable "nat_ids" { type = list(string) }
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
