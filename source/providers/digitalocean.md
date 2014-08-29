---
defaults:
  image:
    id: 5141286
    name: Ubuntu 14.04.1 64bit LTS
  location:
    id: 3
    name: San Francisco 1
locations:
- country: null
  id: '1'
  name: New York 1
- country: null
  id: '2'
  name: Amsterdam 1
- country: null
  id: '3'
  name: San Francisco 1
- country: null
  id: '4'
  name: New York 2
- country: null
  id: '5'
  name: Amsterdam 2
- country: null
  id: '6'
  name: Singapore 1
- country: null
  id: '7'
  name: London 1
- country: null
  id: '8'
  name: New York 3
sizes:
- bandwidth: 0
  disk: 0
  id: '66'
  name: 512MB
  price: 0
  price_per: hour
  ram: 512
- bandwidth: 0
  disk: 0
  id: '63'
  name: 1GB
  price: 0
  price_per: hour
  ram: 1024
- bandwidth: 0
  disk: 0
  id: '62'
  name: 2GB
  price: 0
  price_per: hour
  ram: 2048
- bandwidth: 0
  disk: 0
  id: '64'
  name: 4GB
  price: 0
  price_per: hour
  ram: 4096
- bandwidth: 0
  disk: 0
  id: '65'
  name: 8GB
  price: 0
  price_per: hour
  ram: 8192
- bandwidth: 0
  disk: 0
  id: '61'
  name: 16GB
  price: 0
  price_per: hour
  ram: 16384
- bandwidth: 0
  disk: 0
  id: '60'
  name: 32GB
  price: 0
  price_per: hour
  ram: 32768
- bandwidth: 0
  disk: 0
  id: '70'
  name: 48GB
  price: 0
  price_per: hour
  ram: 49152
- bandwidth: 0
  disk: 0
  id: '69'
  name: 64GB
  price: 0
  price_per: hour
  ram: 65536
template: provider.html
title: Digital Ocean

---
[DigitalOcean](http://digitalocean.com) is a virtual private server provider based in New York with datacenters in New York, Amsterdam, San Francisco, London and Singapore.

## Example

The following [node file](http://docs.devo.ps/manual/nodes/#node-file) will create a 512MB droplet (`size: 66`) on Digital Ocean in their San Francisco 1 datacenter (`location: 3`):

    id: digitalocean_server
    name: Digital Ocean server
    type: server

    provider:
      name: digitalocean
      location: 3
      size: 66

<em>Don't have a Digital Ocean account yet? <a href='https://www.digitalocean.com/?refcode=3918a442dbd7' class='button' target='_blank'>Sign up for an account</a></em>