data "digitalocean_kubernetes_versions" "main" {
  version_prefix = "1.25."
}

resource "digitalocean_kubernetes_cluster" "main" {
  name         = var.project
  region       = var.region
  auto_upgrade = true
  version      = data.digitalocean_kubernetes_versions.main.latest_version
  vpc_uuid     = digitalocean_vpc.main.id

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  node_pool {
    name       = format("%s-worker-pool-1", var.project)
    size       = "s-2vcpu-4gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
  }
}
