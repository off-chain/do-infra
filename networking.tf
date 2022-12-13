resource "digitalocean_vpc" "main" {
  name     = var.project
  region   = var.region
  ip_range = "10.10.10.0/24"
}
