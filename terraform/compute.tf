# Compute Engine VM using local module
module "blog_monitoring_vm" {
  source = "../terraform_modules/compute_vm"

  instance_name = "blog-monitoring-vm"
  machine_type  = "e2-micro" 
  zone          = var.zone
  project_id    = var.project_id

  boot_disk_image = "ubuntu-os-cloud/ubuntu-2204-lts"
  boot_disk_labels = {
    environment = "monitoring"
    purpose     = "blog-app"
  }

  tags = ["blog-monitoring", "http-server"]
  service_account_id = "blog-monitoring-sa"


  # Startup script to install Docker and Docker Compose
  startup_script = file("${path.module}/scripts/startup.sh")
}
