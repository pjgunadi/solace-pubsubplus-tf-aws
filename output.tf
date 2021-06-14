output "vmr-main-ip" {
  description = "Public IP address of Main VMR"
  value       = aws_instance.vmr-main.public_ip
}

output "vmr-backup-ip" {
  description = "Public IP address of Backup VMR"
  value       = var.vmr_ha ? aws_instance.vmr-backup.0.public_ip : ""
}

output "vmr-monitor-ip" {
  description = "Public IP address of Monitor VMR"
  value       = var.vmr_ha ? aws_instance.vmr-monitor.0.public_ip : ""
}