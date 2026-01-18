resource "google_compute_instance" "default" {
    name = var.instance_name
    machine_type = var.machine_type
    zone = var.zone
    allow_stopping_for_update = var.allow_stopping_for_update

    tags = var.tags

    boot_disk {
        initialize_params {
            image  = var.boot_disk_image
            labels = var.boot_disk_labels
        }
    }

    network_interface {
        network = var.network
        access_config {

        }
    }

    dynamic "attached_disk" {
        for_each = var.attached_disks
        content {
            source      = attached_disk.value.source
            device_name = attached_disk.value.device_name
            mode        = attached_disk.value.mode
        }
    }

    metadata_startup_script = var.startup_script

    service_account {
        email = google_service_account.default.email
        scopes = ["cloud-platform"]
    }
}