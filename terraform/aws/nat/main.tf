resource "aws_eip" "nat" {
  count = length(var.public_subnets)
  vpc   = true
}

resource "aws_nat_gateway" "nat" {
  count         = length(var.public_subnets)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.public_subnets[count.index]
  tags          = { Name = "nat-${count.index}" }
}

output "nat_ids" { value = aws_nat_gateway.nat[*].id }
