---
defaults:
  image:
    id: 124
    name: Ubuntu 14.04.1 64bit LTS
  location:
    id: 2
    name: Dallas, TX, USA
locations:
- country: US
  id: '2'
  name: Dallas, TX, USA
- country: US
  id: '3'
  name: Fremont, CA, USA
- country: US
  id: '4'
  name: Atlanta, GA, USA
- country: US
  id: '6'
  name: Newark, NJ, USA
- country: GB
  id: '7'
  name: London, England, UK
- country: JP
  id: '8'
  name: Tokyo, JP
sizes:
- bandwidth: 2000
  disk: 24576
  id: '1'
  name: Linode 1024
  price: 10.0
  price_per: month
  ram: 1024
- bandwidth: 3000
  disk: 49152
  id: '2'
  name: Linode 2048
  price: 20.0
  price_per: month
  ram: 2048
- bandwidth: 4000
  disk: 98304
  id: '4'
  name: Linode 4096
  price: 40.0
  price_per: month
  ram: 4096
- bandwidth: 8000
  disk: 196608
  id: '6'
  name: Linode 8192
  price: 80.0
  price_per: month
  ram: 8192
- bandwidth: 16000
  disk: 393216
  id: '7'
  name: Linode 16384
  price: 160.0
  price_per: month
  ram: 16384
- bandwidth: 20000
  disk: 786432
  id: '8'
  name: Linode 32768
  price: 320.0
  price_per: month
  ram: 32768
- bandwidth: 20000
  disk: 1179648
  id: '9'
  name: Linode 49152
  price: 480.0
  price_per: month
  ram: 49152
- bandwidth: 20000
  disk: 1572864
  id: '10'
  name: Linode 65536
  price: 640.0
  price_per: month
  ram: 65536
- bandwidth: 20000
  disk: 1966080
  id: '12'
  name: Linode 98304
  price: 960.0
  price_per: month
  ram: 98304
template: provider.html
title: Linode

---
[Linode](https://www.linode.com/?r=a278f28e12e5e4e08adc41d8491a1988363e80d6) is a virtual private server provider based in New Jersey with datacenters in Tokyo, the US (US West, US Central, US South, US East) and London.

## Example

The following [node file](http://docs.devo.ps/manual/nodes/#node-file) will create a Linode 1024 server (`size: 1`) in their droplet Dallas datacenter (`location: 2`):

    id: linode_server
    name: Linode server
    type: server

    provider:
      name: linode
      location: 2
      size: 1

<em>Don't have a Linode account yet? <a href='https://www.linode.com/?r=a278f28e12e5e4e08adc41d8491a1988363e80d6' target='_blank'>Sign up for an account</a>.</em>