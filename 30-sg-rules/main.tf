
resource "aws_security_group_rule" "backend_alb_bastion" {
    type = "ingress"                                           # inbound rule
    security_group_id =  local.backend_alb_sg_id
    source_security_group_id = local.bastion_sg_id             # traffic coming from
    from_port = 80
    protocol = "tcp"
    to_port = 80
}

resource "aws_security_group_rule" "bastion_laptop" {
    type = "ingress"                                           # inbound rule
    security_group_id =  local.bastion_sg_id
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    protocol = "tcp"
    to_port = 22
}

resource "aws_security_group_rule" "monogdb_bastion" {
    type = "ingress"                                           # inbound rule
    security_group_id =  local.mangodb_sg_id
    source_security_group_id = local.bastion_sg_id 
    from_port = 22
    protocol = "tcp"
    to_port = 22
}