variable "instance_name" {
    description = "The name of the compute instance"
    type        = string
}

variable "machine_type" {
    description = "The machine type of the compute instance e.g. n1-standard-1"
    type        = string
}

variable "zone" {
    description = "The zone where the compute instance will be created e.g. us-central1-a"
    type        = string
}

variable "allow_stopping_for_update" {
    description = "Whether to allow stopping the instance for updates"
    type        = bool
    default     = true
}

variable "tags" {
    description = "A list of tags to attach to the instance"
    type        = list(string)
    default     = []
}

variable "boot_disk_image" {
    description = "The boot disk image for the instance"
    type        = string
}

variable "boot_disk_labels" {
    description = "Labels to attach to the boot disk"
    type        = map(string)
    default     = {}
}

variable "network" {
    description = "The network to attach the instance to"
    type        = string
    default     = "default"
}

variable "startup_script" {
    description = "Startup script to run when the instance boots"
    type        = string
    default     = ""
}

variable "service_account_id" {
    description = "The account ID for the service account"
    type        = string
}

variable "project_id" {
    description = "The GCP project ID"
    type        = string
}

variable "attached_disks" {
    description = "List of additional disks to attach to the instance"
    type = list(object({
        source      = string
        device_name = optional(string)
        mode        = optional(string, "READ_WRITE")
    }))
    default     = []
}
