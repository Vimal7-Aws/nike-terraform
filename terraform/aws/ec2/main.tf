resource "aws_instance" "public_ec2" {
  count = length(var.public_subnets)
  ami   = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  subnet_id = var.public_subnets[count.index]
  vpc_security_group_ids = [var.public_sg_id]
  associate_public_ip_address = true
  tags = { Name = "public-${count.index}" }
}

resource "aws_instance" "private_ec2" {
  count = length(var.private_subnets)
  ami   = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  subnet_id = var.private_subnets[count.index]
  vpc_security_group_ids = [var.private_sg_id]
  associate_public_ip_address = false
  tags = { Name = "private-${count.index}" }
}

output "public_ec2_ips" { value = aws_instance.public_ec2[*].public_ip }
output "private_ec2_ips" { value = aws_instance.private_ec2[*].private_ip }
