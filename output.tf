
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


output "cert-chain" {
  value= {
    for k, v in  bigip_ssl_certificate.cert-chain : k => format("/%s/%s", v.partition, v.name)


  } 
}

/*
cert-chain = {
  "root-ca-home-lab" = "/prod1/root-ca-home-lab.crt"
}
private-key = {
  "app1-home-lab" = "/prod1/app1-home-lab.key"
  "app2-home-lab" = "/prod1/app2-home-lab.key"
}
public-key = {
  "app1-home-lab" = "/prod1/app1-home-lab.crt"
  "app2-home-lab" = "/prod1/app2-home-lab.crt"
}
*/

