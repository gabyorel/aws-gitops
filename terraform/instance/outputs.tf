output "website_address" {
  value = aws_instance.web.public_ip
}