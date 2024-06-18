module "frontend" {
  source = "./frontend"
}

module "bff-backend" {
  source = "./bff-backend"
}

module "rds" {
  source = "./rds"
}
