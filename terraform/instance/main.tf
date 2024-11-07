resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  user_data              = <<EOF
sudo apt-get update
sudo apt-get install nginx git -y
sudo rm -rf /var/www/html/*
sudo git clone ${var.repo_url} /var/www/html/
sudo mv /var/www/html/${var.html_folder}/* /var/www/html/
EOF

  tags = {
    Name : "${var.instance_name}-${var.environment}"
  }
}