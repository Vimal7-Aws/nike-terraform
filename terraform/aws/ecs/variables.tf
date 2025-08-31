variable "vpc_id" {}
variable "private_subnets" { type = list(string) }
variable "public_subnets" { type = list(string) }
variable "ecs_sg_id" {}
variable "alb_sg_id" {}
variable "ecs_cluster_name" { default = "ecs-cluster" }
variable "ecs_service_name" { default = "ecs-service" }
variable "ecs_task_name" { default = "ecs-task" }
variable "container_image" { default = "nginx:latest" }
variable "container_port" { default = 80 }
