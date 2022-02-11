output "external_ip" {
  description = "Instance main interface external IP addresses."
  value = (
    var.network_interfaces[0].nat
    ? try(google_compute_instance.default.0.network_interface.0.access_config.0.nat_ip, null)
    : null
  )
}

output "group" {
  description = "Instance group resource."
  value       = try(google_compute_instance_group.unmanaged.0, null)
}

output "instance" {
  description = "Instance resource."
  value       = try(google_compute_instance.default.0, null)
}

output "internal_ip" {
  description = "Instance main interface internal IP address."
  value = try(
    google_compute_instance.default.0.network_interface.0.network_ip,
    null
  )
}

output "self_link" {
  description = "Instance self links."
  value       = try(google_compute_instance.default.0.self_link, null)
}

output "service_account" {
  description = "Service account resource."
  value = (
    var.service_account_create ? google_service_account.service_account.0 : null
  )
}

output "service_account_email" {
  description = "Service account email."
  value       = local.service_account_email
}

output "service_account_iam_email" {
  description = "Service account email."
  value = join("", [
    "serviceAccount:",
    local.service_account_email == null ? "" : local.service_account_email
  ])
}

output "template" {
  description = "Template resource."
  value       = try(google_compute_instance_template.default.0, null)
}

output "template_name" {
  description = "Template name."
  value       = try(google_compute_instance_template.default.0.name, null)
}