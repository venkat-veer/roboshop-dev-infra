locals {
    backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
    mangodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
    redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
    rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
    mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
}