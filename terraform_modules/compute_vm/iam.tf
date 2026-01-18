resource "google_service_account" "default" {
    account_id   = var.service_account_id
    display_name = "Service Account for ${var.instance_name}"
    project      = var.project_id
}

