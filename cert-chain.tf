

locals {
  cert-chain_yml= yamldecode(file("data/cert-chain.yml"))
}


    
resource "bigip_ssl_certificate" "cert-chain" {
  for_each = local.cert-chain_yml
  name      = format("%s.crt", each.key)
  content   = each.value.public-key
  partition = var.partition
}


  

    
