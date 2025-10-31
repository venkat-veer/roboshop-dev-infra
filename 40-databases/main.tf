resource "aws_instance" "mongodb" {
    ami = local.ami_id      
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.mongodb_sg_id]
    subnet_id = local.database_subnet_id
    tags = merge (
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-mongodb"        # roboshop-dev-mongodb  
        }
    )
}
resource "terraform_data" "mongodb" {
    triggers_replace = [aws_instance.mongodb.id]

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.mongodb.private_ip 
    }

    # terrform copies this file to mongodb server   
    provisioner "file" {
        source = "bootstrap.sh"
        destination = "/tmp/bootstrap.sh"
    }

    provisioner "remote-exec" {
        inline = [ 
            "chmod +x /tmp/bootstrap.sh",
            # "sudo sh /tmp/bootstrap.sh"       
            "sudo sh /tmp/bootstrap.sh mongodb"
            ]
      
    }
}

# redis database configure
resource "aws_instance" "redis" {
    ami = local.ami_id      
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.redis_sg_id]
    subnet_id = local.database_subnet_id
    tags = merge (
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-redis"        # roboshop-dev-mongodb  
        }
    )
}
resource "terraform_data" "redis" {
    triggers_replace = [aws_instance.redis.id]

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.redis.private_ip 
    }

    # terrform copies this file to mongodb server   
    provisioner "file" {
        source = "bootstrap.sh"
        destination = "/tmp/bootstrap.sh"
    }

    provisioner "remote-exec" {
        inline = [ 
            "chmod +x /tmp/bootstrap.sh",
            "sudo sh /tmp/bootstrap.sh redis"
            ]
      
    }
}


# rabbitmq database configure
resource "aws_instance" "rabbitmq" {
    ami = local.ami_id      
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.rabbitmq_sg_id]
    subnet_id = local.database_subnet_id
    tags = merge (
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-rabbitmq"        # roboshop-dev-mongodb  
        }
    )
}
resource "terraform_data" "rabbitmq" {
    triggers_replace = [aws_instance.rabbitmq.id]

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.rabbitmq.private_ip 
    }

    # terrform copies this file to mongodb server   
    provisioner "file" {
        source = "bootstrap.sh"
        destination = "/tmp/bootstrap.sh"
    }

    provisioner "remote-exec" {
        inline = [ 
            "chmod +x /tmp/bootstrap.sh",
            "sudo sh /tmp/bootstrap.sh rabbitmq"
            ]
      
    }
}


