terraform {
  required_version = ">= 0.14.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source = "./modules/vpc"
}

module "rds" {
  source       = "./modules/rds"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.subnet_ids
  DB_USER      = var.DB_USER
  DB_PASSWORD  = var.DB_PASSWORD
}

module "ecs" {
  source       = "./modules/ecs"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.subnet_ids
}

