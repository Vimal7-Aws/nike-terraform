resource "aws_security_group" "public_sg" {
  vpc_id = var.vpc_id
  name   = "public-sg"
  ingress { protocol="tcp" from_port=22 to_port=22 cidr_blocks=["0.0.0.0/0"] }
  ingress { protocol="tcp" from_port=80 to_port=80 cidr_blocks=["0.0.0.0/0"] }
  egress  { protocol="-1" from_port=0 to_port=0 cidr_blocks=["0.0.0.0/0"] }
}

resource "aws_security_group" "private_sg" {
  vpc_id = var.vpc_id
  name   = "private-sg"
  egress  { protocol="-1" from_port=0 to_port=0 cidr_blocks=["0.0.0.0/0"] }
}

resource "aws_security_group" "ecs_sg" {
  vpc_id = var.vpc_id
  name   = "ecs-sg"
  ingress { from_port=80 to_port=80 protocol="tcp" security_groups=[aws_security_group.alb_sg.id] }
  egress  { from_port=0 to_port=0 protocol="-1" cidr_blocks=["0.0.0.0/0"] }
}

resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id
  name   = "alb-sg"
  ingress { from_port=80 to_port=80 protocol="tcp" cidr_blocks=["0.0.0.0/0"] }
  egress  { from_port=0 to_port=0 protocol="-1" cidr_blocks=["0.0.0.0/0"] }
}

output "public_sg_id" { value = aws_security_group.public_sg.id }
output "private_sg_id" { value = aws_security_group.private_sg.id }
output "ecs_sg_id" { value = aws_security_group.ecs_sg.id }
output "alb_sg_id" { value = aws_security_group.alb_sg.id }
