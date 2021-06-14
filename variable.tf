variable "profile" {
  description = "AWS Profile"
  type        = string
  default     = "default"
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-1"
}

variable "vmr_keypair" {
  description = "VMR Key Pair"
  type        = string
}

variable "vmr_secgrp" {
  description = "Security Group for VMR"
  type        = string
}

variable "vmr_ha" {
  description = "VMR with HA"
  type        = bool
  default     = false
}

variable "vmr_name" {
  description = "VMR Name"
  type        = string
  default     = "solace1"
}

variable "vmr_instance_type" {
  description = "VMR Instance Type"
  type        = string
  default     = "t3.medium"
}

variable "vmr_storage_size" {
  description = "VMR Storage Size"
  type        = number
  default     = 30
}

variable "admin_user" {
  description = "VMR Admin user"
  type        = string
  default     = "admin"
}

variable "admin_password" {
  description = "VMR Admin password"
  type        = string
}

variable "storage_device" {
  description = "Storage Device Name"
  type        = string
  default = "nvme1n1"
}