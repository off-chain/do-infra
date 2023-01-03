resource "digitalocean_database_cluster" "hype_prod" {
  name                 = "hype-prod"
  engine               = "pg"
  version              = "14"
  size                 = "db-s-2vcpu-4gb"
  region               = var.region
  node_count           = 1
  private_network_uuid = digitalocean_vpc.main.id

  maintenance_window {
    hour = "04:00:00"
    day  = "sunday"
  }
}

resource "digitalocean_database_cluster" "hype_qa" {
  name                 = "hype-qa"
  engine               = "pg"
  version              = "14"
  size                 = "db-s-1vcpu-1gb"
  region               = var.region
  node_count           = 1
  private_network_uuid = digitalocean_vpc.main.id

  maintenance_window {
    hour = "04:00:00"
    day  = "sunday"
  }
}

resource "digitalocean_database_firewall" "hype_prod" {
  cluster_id = digitalocean_database_cluster.hype_prod.id

  rule {
    type  = "k8s"
    value = digitalocean_kubernetes_cluster.main.id
  }
}

resource "digitalocean_database_db" "hype_prod_indexer" {
  cluster_id = digitalocean_database_cluster.hype_prod.id
  name       = "indexer"
}

resource "digitalocean_database_firewall" "hype_qa" {
  cluster_id = digitalocean_database_cluster.hype_qa.id

  rule {
    type  = "k8s"
    value = digitalocean_kubernetes_cluster.main.id
  }
}

resource "digitalocean_database_db" "hype_qa_indexer" {
  cluster_id = digitalocean_database_cluster.hype_qa.id
  name       = "indexer"
}
