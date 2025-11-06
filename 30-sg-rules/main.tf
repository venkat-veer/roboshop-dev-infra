
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

resource "aws_security_group_rule" "redis_bastion" {
    type = "ingress"                                           # inbound rule
    security_group_id =  local.redis_sg_id
    source_security_group_id = local.bastion_sg_id 
    from_port = 22
    protocol = "tcp"
    to_port = 22
}


resource "aws_security_group_rule" "rabbitmq_bastion" {
    type = "ingress"                                           # inbound rule
    security_group_id =  local.rabbitmq_sg_id
    source_security_group_id = local.bastion_sg_id 
    from_port = 22
    protocol = "tcp"
    to_port = 22
}

resource "aws_security_group_rule" "mysql_bastion" {
    type = "ingress"                                           # inbound rule
    security_group_id =  local.mysql_sg_id
    source_security_group_id = local.bastion_sg_id 
    from_port = 22
    protocol = "tcp"
    to_port = 22
}

# catalogue instance accept traffic from bastion 
resource "aws_security_group_rule" "catalogue_bastion" {
    type = "ingress"                                           # inbound rule
    security_group_id =  local.catalogue_sg_id
    source_security_group_id = local.bastion_sg_id 
    from_port = 22
    protocol = "tcp"
    to_port = 22
}

# mongodb instance accept traffic from catalogue 
resource "aws_security_group_rule" "mongodb_catalogue" {
    type = "ingress"                                           # inbound rule
    security_group_id =  local.mangodb_sg_id
    source_security_group_id = local.catalogue_sg_id 
    from_port = 27017
    protocol = "tcp"
    to_port = 27017
}

# catalogue instance accept traffic from backend load balancer
resource "aws_security_group_rule" "catalogue_backend_alb" {
    type = "ingress"                                           # inbound rule
    security_group_id =  local.catalogue_sg_id
    source_security_group_id = local.backend_alb_sg_id 
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
}