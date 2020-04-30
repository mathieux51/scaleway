terraform {
  required_version = ">=0.12.24"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "organization_id" {
  type = string
}

provider "scaleway" {
  version = "~> 1.14"
  access_key      = var.access_key
  secret_key      = var.secret_key
  organization_id = var.organization_id
  zone            = "nl-ams-1"
  region          = "nl-ams"
}

resource "scaleway_account_ssh_key" "main" {
  name       = "main"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_server" "server" {
  count = 1
  type = "DEV1-S"
  image = "debian_stretch"
  ip_id = scaleway_instance_ip.public_ip.id
}

output "public_ip" {
  value = scaleway_instance_ip.public_ip
}
