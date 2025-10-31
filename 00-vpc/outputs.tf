output "vpc_id" {
    value = module.vpc.vpc_id
}

output "public_subnet_ids" {
    value = module.vpc.public_subnet_ids                            # receive from terraform-aws-vpc instance
}

output "private_subnet_ids" {
    value = module.vpc.public_subnet_ids                            # receive from terraform-aws-vpc instance
}

output "database_subnet_ids" {
    value = module.vpc.public_subnet_ids                          # receive from terraform-aws-vpc instance
}