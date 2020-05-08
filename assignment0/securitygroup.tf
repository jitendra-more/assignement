### Network Port Configuration ###

resource "aws_security_group" "web-node" {
  name        = "WebSrv"
  description = "Web Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

##resource "aws_security_group_rule" "MySql" {
#  type              = "ingress"
#  from_port         = "3306"
#  to_port           = "3306"
#  protocol          = "tcp"
#  cidr_blocks       = ["0.0.0.0/0"]
#  security_group_id = aws_security_group.web-node.id
#
#}

#resource "aws_security_group_rule" "Https" {
#  type              = "ingress"
#  from_port         = "443"
#  to_port           = "443"
#  protocol          = "tcp"
#  cidr_blocks       = ["0.0.0.0/0"]
#  security_group_id = aws_security_group.web-node.id
##
#
#}

