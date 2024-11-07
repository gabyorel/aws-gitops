output "website_address" {
  value = "http://${module.webserver1.website_address}"
}

output "ecr_repository_url" {
  value = var.global ? aws_ecr_repository.main[0].repository_url : ""
}