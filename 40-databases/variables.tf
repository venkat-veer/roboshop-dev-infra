variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
  
}

variable "sg_names"{
    default = [
        # database instances
        "mongodb","redis","mysql","rabbitmq",
        # backend instances
        "catalogue","user","cart","shipping","payment",
        # fronend
        "frontend",
        # bastion
        "bastion",
        # front end load balancer
        "frontend_alb",    
        # front end load balancer
        "backend_alb"                
        ]
}

variable "zone_id" {
    default = "Z05359301W668SBI8XW8V"
}

variable "domain_name" {
    default = "devaws.store"
  
}