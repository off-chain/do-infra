resource "digitalocean_project" "main" {
  name        = format("%s-prod", var.project)
  description = format("%s-prod apps", var.project)
  purpose     = format("%s-prod apps", var.project)
  environment = "Production"
  is_default  = true
  resources = [
    digitalocean_domain.main.urn,
    digitalocean_domain.taraxa_hype_prod.urn,
    digitalocean_domain.taraxa_hype_qa.urn,
    digitalocean_kubernetes_cluster.main.urn,
    digitalocean_database_cluster.hype_prod.urn
  ]
}
