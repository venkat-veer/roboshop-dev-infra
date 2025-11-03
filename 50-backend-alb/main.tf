# terraform aws alb google it ok.
resource "aws_lb" "backend_alb" {
    name = "${local.common_name_suffix}-backend-alb"    # roboshop-dev-backend-alb
    internal = true
    load_balancer_type = "application"
    security_groups = [local.backend_alb_sg_id]
    # it should be private subnet ids
    subnets = local.private_subnet_ids

    # enable_deletion_protection = true                    # prevents accidental deletion from UI
    enable_deletion_protection = false
    tags = merge (
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-backend-alb"
        }
    )  
}

# aws alb listener terraform googgle it 
# backend alb listening on port number 80
resource "aws_lb_listener" "front_end" {
    load_balancer_arn = aws_lb.backend_alb.arn              # amazon resource name
    port = "80"
    protocol = "HTTP"
    default_action {
      type = "fixed-response"

      fixed_response {
        content_type = "text/plain"
        message_body = "Hi, Iam from backend ALB HTTP"
        status_code = "200"
      } 
    }



}