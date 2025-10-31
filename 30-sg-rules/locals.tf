locals {
    backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
    mangodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
}