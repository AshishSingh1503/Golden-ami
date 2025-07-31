packer {
  required_plugins {
    amazon = {
      source = "github.com/hashicorp/amazon"
      version = ">= 1.0.0"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  region                  = "ap-south-1"
  source_ami_filter {
    filters = {
      name = "ubuntu/images/hvm-ssd/ubuntu-*-24.04-amd64-server-*"
      virtualization-type = "hvm"
      root-device-type    = "ebs"
    }
    most_recent = true
    owners      = ["099720109477"] # Canonical
  }
  instance_type           = "t3.micro"
  ssh_username            = "ubuntu"
  ami_name                = "golden-ubuntu24-{{timestamp}}"
  ami_description         = "Golden Ubuntu 24.04 LTS with SSM and CW agent"
  encrypt_boot            = true
  kms_key_id              = "alias/aws/ebs"
  tags = {
    "Name"      = "GoldenUbuntu24"
    "CreatedBy" = "Packer"
    "Version"   = "{{timestamp}}"
  }

  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 16
    volume_type = "gp3"
    delete_on_termination = true
  }
}

build {
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "shell" {
    scripts = [
      "scripts/bootstrap.sh",
      "scripts/harden.sh",
      "scripts/validate.sh"
    ]
  }
}
