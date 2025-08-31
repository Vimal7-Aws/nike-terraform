resource "aws_network_acl" "public_nacl" {
  vpc_id = var.vpc_id
  tags   = { Name = "public-nacl" }
  ingress { protocol="-1" rule_no=100 action="allow" cidr_block="0.0.0.0/0" }
  egress  { protocol="-1" rule_no=100 action="allow" cidr_block="0.0.0.0/0" }
}

resource "aws_network_acl_association" "public_assoc" {
  count          = length(var.public_subnets)
  subnet_id      = var.public_subnets[count.index]
  network_acl_id = aws_network_acl.public_nacl.id
}

resource "aws_network_acl" "private_nacl" {
  vpc_id = var.vpc_id
  tags   = { Name = "private-nacl" }
  ingress { protocol="-1" rule_no=100 action="allow" cidr_block="10.0.0.0/16" }
  egress  { protocol="-1" rule_no=100 action="allow" cidr_block="0.0.0.0/0" }
}

resource "aws_network_acl_association" "private_assoc" {
  count          = length(var.private_subnets)
  subnet_id      = var.private_subnets[count.index]
  network_acl_id = aws_network_acl.private_nacl.id
}
