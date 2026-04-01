resource "aws_security_group" "main" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc-id

##Mandating all outbound traffic from the security group to allow internet access to the instances for downloading packages and updates.
  egress { 
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge (
    var.sg_tags,
    local.common_tags,  
        {
      
            Name = "${var.project}-${var.environment}-${var.sg_name}"
        }

    )
}