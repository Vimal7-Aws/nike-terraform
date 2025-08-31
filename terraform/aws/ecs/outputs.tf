output "ecs_cluster_id" { value = aws_ecs_cluster.cluster.id }
output "ecs_service_name" { value = aws_ecs_service.service.name }
output "alb_dns_name" { value = aws_lb.alb.dns_name }
