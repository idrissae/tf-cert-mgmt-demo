

locals {
  certificate_name = "app1.home.lab"
  certifs_yml= yamldecode(file("data/secrets.yml"))
}


    
resource "bigip_ssl_certificate" "public-key" {
  for_each = local.certifs_yml
  name      = format("%s.crt", each.key)
  content   = each.value.public-key
  partition = var.partition
}



resource "bigip_ssl_key" "private-key" {
  for_each = local.certifs_yml
  name      = format("%s.key", each.key)
  content   = each.value.private-key
  partition = var.partition
}

output "public-key" {
  value= {
    for k, v in  bigip_ssl_certificate.public-key : k => format("/%s/%s", v.partition, v.name)


  } 
}

output "private-key" {
  value= {
    for k, v in  bigip_ssl_key.private-key : k => format("/%s/%s", v.partition, v.name)

  } 

  
}
    
