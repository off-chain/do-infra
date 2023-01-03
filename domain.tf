resource "digitalocean_domain" "main" {
  name = "offchain.ro"
}

resource "digitalocean_domain" "taraxa_hype_prod" {
  name = "hype.taraxa.io"
}

resource "digitalocean_domain" "taraxa_hype_qa" {
  name = "qa.hype.taraxa.io"
}


resource "digitalocean_record" "main" {
  domain = digitalocean_domain.main.id
  type   = "A"
  name   = "@"
  value  = "185.199.109.153"
  ttl    = 3600
}

resource "digitalocean_record" "www" {
  domain = digitalocean_domain.main.id
  type   = "CNAME"
  name   = "www"
  value  = format("%s.", digitalocean_domain.main.name)
  ttl = 3600
}

resource "digitalocean_record" "charts" {
  domain = digitalocean_domain.main.id
  type   = "CNAME"
  name   = "charts"
  value  = "off-chain.github.io."
  ttl = 3600
}

resource "digitalocean_record" "ns1_a" {
  domain = digitalocean_domain.main.id
  type   = "A"
  name   = "ns1"
  value  = "173.245.58.51"
  ttl    = 3600
}

resource "digitalocean_record" "ns2_a" {
  domain = digitalocean_domain.main.id
  type   = "A"
  name   = "ns2"
  value  = "173.245.59.41"
  ttl    = 3600
}

resource "digitalocean_record" "ns3_a" {
  domain = digitalocean_domain.main.id
  type   = "A"
  name   = "ns3"
  value  = "198.41.222.173"
  ttl    = 3600
}

resource "digitalocean_record" "ns1_ns" {
  domain = digitalocean_domain.main.id
  type   = "NS"
  name   = "@"
  value  = "ns1.offchain.ro."
  ttl    = 86400
}

resource "digitalocean_record" "ns2_ns" {
  domain = digitalocean_domain.main.id
  type   = "NS"
  name   = "@"
  value  = "ns2.offchain.ro."
  ttl    = 86400
}

resource "digitalocean_record" "ns3_ns" {
  domain = digitalocean_domain.main.id
  type   = "NS"
  name   = "@"
  value  = "ns3.offchain.ro."
  ttl    = 86400
}

resource "digitalocean_record" "main_mx" {
  domain   = digitalocean_domain.main.id
  type     = "MX"
  name     = "@"
  priority = 1
  ttl      = 1800
  value    = "aspmx.l.google.com."
}

resource "digitalocean_record" "alt1_mx" {
  domain   = digitalocean_domain.main.id
  type     = "MX"
  name     = "@"
  priority = 5
  ttl      = 1800
  value    = "alt1.aspmx.l.google.com."
}

resource "digitalocean_record" "alt2_mx" {
  domain   = digitalocean_domain.main.id
  type     = "MX"
  name     = "@"
  priority = 5
  ttl      = 1800
  value    = "alt2.aspmx.l.google.com."
}

resource "digitalocean_record" "alt3_mx" {
  domain   = digitalocean_domain.main.id
  type     = "MX"
  name     = "@"
  priority = 10
  ttl      = 1800
  value    = "alt3.aspmx.l.google.com."
}

resource "digitalocean_record" "alt4_mx" {
  domain   = digitalocean_domain.main.id
  type     = "MX"
  name     = "@"
  priority = 10
  ttl      = 1800
  value    = "alt4.aspmx.l.google.com."
}

resource "digitalocean_record" "verify_mx" {
  domain   = digitalocean_domain.main.id
  type     = "MX"
  name     = "@"
  priority = 15
  ttl      = 14400
  value    = "oinlskcxfabiegmkecz5ndwpqnicick23p7ue6o2cfcodqn3vwua.mx-verification.google.com."
}
