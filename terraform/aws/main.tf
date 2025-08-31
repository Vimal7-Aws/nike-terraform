provider "aws" {
  region = var.region
}

module "vpc" {
  source     = "./vpc"
  cidr_block = var.vpc_cidr
}

module "subnets" {
  source = "./subnets"
  vpc_id = module.vpc.vpc_id
  azs    = var.azs
}

module "nat" {
  source         = "./nat"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.subnets.public_subnets
}

module "route_tables" {
  source          = "./route_tables"
  vpc_id          = module.vpc.vpc_id
  igw_id          = module.vpc.igw_id
  nat_ids         = module.nat.nat_ids
  public_subnets  = module.subnets.public_subnets
  private_subnets = module.subnets.private_subnets
}

module "sg" {
  source = "./sg"
  vpc_id = module.vpc.vpc_id
}

module "nacl" {
  source          = "./nacl"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.subnets.public_subnets
  private_subnets = module.subnets.private_subnets
}

module "ec2" {
  source          = "./ec2"
  public_subnets  = module.subnets.public_subnets
  private_subnets = module.subnets.private_subnets
  public_sg_id    = module.sg.public_sg_id
  private_sg_id   = module.sg.private_sg_id
}

module "ecs" {
  source          = "./ecs"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.subnets.private_subnets
  public_subnets  = module.subnets.public_subnets
  ecs_sg_id       = module.sg.ecs_sg_id
  alb_sg_id       = module.sg.alb_sg_id

  ecs_cluster_name = "ecs-cluster"
  ecs_service_name = "ecs-service"
  ecs_task_name    = "ecs-task"
  container_image  = "nginx:latest"
  container_port   = 80
}
