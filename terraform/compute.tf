resource "aws_security_group" "web" {
  name        = "Web Security Group"
  description = "Allow HTTP/HTTPS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "web-sg-${var.environment}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

module "webserver1" {
  source            = "./instance"
  ami               = data.aws_ami.ubuntu.id
  instance_name     = "webserver1"
  instance_type     = var.instance_type
  subnet_id         = aws_subnet.public.id
  security_group_id = aws_security_group.web.id
  repo_url          = "https://fhoubart@bitbucket.org/fhoubart/testphaser_aws.git"
  html_folder       = "public_html"
  environment       = var.environment
}