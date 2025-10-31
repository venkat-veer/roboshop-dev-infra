# data source ssm parameter   google it

data "aws_ssm_parameter" "backend_alb_sg_id" {
    name = "/${var.project_name}/${var.environment}/backend_alb_sg_id"
}

data "aws_ssm_parameter" "bastion_sg_id" {
    name = "/${var.project_name}/${var.environment}/bastion_sg_id"
}


data "aws_ssm_parameter" "mongodb_sg_id" {
    name = "/${var.project_name}/${var.environment}/mongodb_sg_id"
}
