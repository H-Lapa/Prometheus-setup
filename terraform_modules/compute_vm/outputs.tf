output "instance_id" {
    description = "The ID of the compute instance"
    value       = google_compute_instance.default.id
}

output "instance_name" {
    description = "The name of the compute instance"
    value       = google_compute_instance.default.name
}

output "instance_self_link" {
    description = "The self link of the compute instance"
    value       = google_compute_instance.default.self_link
}

output "instance_internal_ip" {
    description = "The internal IP address of the compute instance"
    value       = google_compute_instance.default.network_interface[0].network_ip
}

output "instance_external_ip" {
    description = "The external IP address of the compute instance"
    value       = try(google_compute_instance.default.network_interface[0].access_config[0].nat_ip, "")
}

output "service_account_email" {
    description = "The email of the service account"
    value       = google_service_account.default.email
}

output "service_account_id" {
    description = "The ID of the service account"
    value       = google_service_account.default.id
}

output "attached_disks" {
    description = "List of attached disks with their details"
    value       = google_compute_instance.default.attached_disk
}

output "boot_disk_self_link" {
    description = "The self link of the boot disk"
    value       = google_compute_instance.default.boot_disk[0].source
}
