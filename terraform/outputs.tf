output "website_address" {
  value = "http://${aws_instance.web.public_ip}"
}