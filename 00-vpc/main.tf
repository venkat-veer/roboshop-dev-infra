module "vpc" {
    # source = "../11-terraform-aws-vpc"
    source = "git::https://github.com/venkat-veer/terraform-aws-vpc.git"        # get data from git repo ok
    # vpc_cidr = "10.0.0.0/16"
    # project_name = "roboshop"
    # environment = "dev"

    vpc_cidr = var.vpc_cidr
    project_name = var.project_name
    environment = var.environment
    vpc_tags = var.vpc_tags
    
    # public subnets 
    public_subnet_cidrs = var.public_subnet_cidrs

    # private subnets 
    private_subnet_cidrs = var.private_subnet_cidrs

    # database subnets 
    database_subnet_cidrs = var.database_subnet_cidrs

    is_peering_required = true
    # is_peering_required = false                             # user dont want peering connection case 
}

# data "aws_availability_zones" "available"{
#     state = "available"
# }