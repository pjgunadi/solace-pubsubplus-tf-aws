data "aws_ami" "solace_std" {
  most_recent      = true
  # name_regex       = "^solace-pubsub-standard-9\\.9.*"
  owners           = ["910732127950","679593333241"]

  filter {
    name   = "name"
    values = ["solace-pubsub-standard-9.9.0.28-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "template_file" "cloud_init" {
  template = file("${path.module}/scripts/cloudInit.tpl")

  vars = {
    admin_user = var.admin_user
    admin_password = var.admin_password
    device_name = var.storage_device
  }
}

resource "aws_instance" "vmr-main" {
  ami = data.aws_ami.solace_std.id
  instance_type = var.vmr_instance_type
  key_name = var.vmr_keypair
  tags = {
    Name = var.vmr_ha ? "${var.vmr_name}-a" : var.vmr_name
  }
  user_data = data.template_file.cloud_init.rendered
  security_groups = [ var.vmr_secgrp ]

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "gp2"
    volume_size = var.vmr_storage_size
  }
}

resource "aws_instance" "vmr-backup" {
  count = var.vmr_ha ? 1 : 0
  ami = data.aws_ami.solace_std.id
  instance_type = var.vmr_instance_type
  key_name = var.vmr_keypair
  availability_zone = aws_instance.vmr-main.availability_zone
  tags = {
    Name = "${var.vmr_name}-b"
  }
  user_data = data.template_file.cloud_init.rendered
  security_groups = [ var.vmr_secgrp ]

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "gp2"
    volume_size = var.vmr_storage_size
  }
}

resource "aws_instance" "vmr-monitor" {
  count = var.vmr_ha ? 1 : 0
  ami = data.aws_ami.solace_std.id
  instance_type = var.vmr_instance_type
  key_name = var.vmr_keypair
  availability_zone = aws_instance.vmr-main.availability_zone
  tags = {
    Name = "${var.vmr_name}-c"
  }
  user_data = data.template_file.cloud_init.rendered
  security_groups = [ var.vmr_secgrp ]

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "gp2"
    volume_size = var.vmr_storage_size
  }
}
