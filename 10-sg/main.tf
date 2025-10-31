# using open source module

/* module "catalogue" {
    source = "terraform-aws-modules/security-group/aws"

    name = "${local.common_name_suffix}-catalogue"
    use_name_prefix = false
    description = "Security group for catalogue with custom-parts open wihin VPC, egress all traffic"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
} */

# using custom module ok. 
module "sg" {
    count = length(var.sg_names)
    source ="git::https://github.com/venkat-veer/terrform-aws-sg-custom.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = var.sg_names[count.index]
    sg_description = "created for ${var.sg_names[count.index]}"
    vpc_id =  local.vpc_id                                        # get from aws ssm parameters 
}

# # frontend accepting traffic from frontend accepting load balance
# resource "aws_security_group_rule" "frontend_frontend_alb" {
#     type = "ingress"                                           # inbound rule
#     security_group_id =  module.sg[9].sg_id                    # frontend               from variables.tf
#     source_security_group_id = module.sg[11].sg_id             # frontend ALB SG ID     from variables.tf
#     from_port = 80
#     protocol = "tcp"
#     to_port = 80
# }

