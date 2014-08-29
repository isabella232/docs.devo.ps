---
defaults:
  image:
    id: null
  location:
    id: us-east-1
    name: US East (N. Virginia)
locations:
- country: US
  id: us-east-1
  name: US East (Northern Virginia)
- country: US
  id: us-west-1
  name: US West (Oregon)
- country: US
  id: us-west-2
  name: US West (Northern California)
- country: Ireland
  id: eu-west-1
  name: EU (Ireland)
- country: Singapore
  id: ap-southeast-1
  name: Asia Pacific (Singapore)
- country: Australia
  id: ap-southeast-2
  name: Asia Pacific (Sydney)
- country: Japan
  id: ap-northeast-1
  name: Asia Pacific (Tokyo)
- country: Brazil
  id: sa-east-1
  name: South America (Sao Paulo)
sizes:
- bandwidth: null
  disk: 15
  id: t1.micro
  name: Micro Instance
  price: 0.02
  price_per: hour
  ram: 613
- bandwidth: null
  disk: 160
  id: m1.small
  name: Small Instance
  price: 0.065
  price_per: hour
  ram: 1740
- bandwidth: null
  disk: 410
  id: m1.medium
  name: Medium Instance
  price: 0.13
  price_per: hour
  ram: 3700
- bandwidth: null
  disk: 850
  id: m1.large
  name: Large Instance
  price: 0.26
  price_per: hour
  ram: 7680
- bandwidth: null
  disk: 1690
  id: m1.xlarge
  name: Extra Large Instance
  price: 0.52
  price_per: hour
  ram: 15360
- bandwidth: null
  disk: 420
  id: m2.xlarge
  name: High-Memory Extra Large Instance
  price: 0.5
  price_per: hour
  ram: 17510
- bandwidth: null
  disk: 850
  id: m2.2xlarge
  name: High-Memory Double Extra Large Instance
  price: 1.0
  price_per: hour
  ram: 35021
- bandwidth: null
  disk: 1690
  id: m2.4xlarge
  name: High-Memory Quadruple Extra Large Instance
  price: 2.0
  price_per: hour
  ram: 70042
- bandwidth: null
  disk: 4000
  id: m3.medium
  name: Medium Instance
  price: 0.113
  price_per: hour
  ram: 3840
- bandwidth: null
  disk: 32000
  id: m3.large
  name: Large Instance
  price: 0.225
  price_per: hour
  ram: 7168
- bandwidth: null
  disk: 80000
  id: m3.xlarge
  name: Extra Large Instance
  price: 0.45
  price_per: hour
  ram: 15360
- bandwidth: null
  disk: 160000
  id: m3.2xlarge
  name: Double Extra Large Instance
  price: 0.9
  price_per: hour
  ram: 30720
- bandwidth: null
  disk: 350
  id: c1.medium
  name: High-CPU Medium Instance
  price: 0.17
  price_per: hour
  ram: 1740
- bandwidth: null
  disk: 1690
  id: c1.xlarge
  name: High-CPU Extra Large Instance
  price: 0.68
  price_per: hour
  ram: 7680
- bandwidth: null
  disk: 1690
  id: cc1.4xlarge
  name: Cluster Compute Quadruple Extra Large Instance
  price: 1.3
  price_per: hour
  ram: 23552
- bandwidth: null
  disk: 3370
  id: cc2.8xlarge
  name: Cluster Compute Eight Extra Large Instance
  price: 2.4
  price_per: hour
  ram: 63488
- bandwidth: null
  disk: 16
  id: c3.large
  name: Compute Optimized Large Instance
  price: 0.15
  price_per: hour
  ram: 3750
- bandwidth: null
  disk: 40
  id: c3.xlarge
  name: Compute Optimized Extra Large Instance
  price: 0.3
  price_per: hour
  ram: 7000
- bandwidth: null
  disk: 80
  id: c3.2xlarge
  name: Compute Optimized Double Extra Large Instance
  price: 0.6
  price_per: hour
  ram: 15000
- bandwidth: null
  disk: 160
  id: c3.4xlarge
  name: Compute Optimized Quadruple Extra Large Instance
  price: 1.2
  price_per: hour
  ram: 30000
- bandwidth: null
  disk: 320
  id: c3.8xlarge
  name: Compute Optimized Eight Extra Large Instance
  price: 2.4
  price_per: hour
  ram: 60000
- bandwidth: null
  disk: 1690
  id: cg1.4xlarge
  name: Cluster GPU Quadruple Extra Large Instance
  price: 2.1
  price_per: hour
  ram: 22528
- bandwidth: null
  disk: 240
  id: cr1.8xlarge
  name: High Memory Cluster Eight Extra Large
  price: 3.5
  price_per: hour
  ram: 244000
- bandwidth: null
  disk: 48000
  id: hs1.8xlarge
  name: High Storage Eight Extra Large Instance
  price: 4.6
  price_per: hour
  ram: 119808
- bandwidth: null
  disk: 800
  id: i2.xlarge
  name: High Storage Optimized Extra Large Instance
  price: 0.85
  price_per: hour
  ram: 31232
- bandwidth: null
  disk: 1600
  id: i2.2xlarge
  name: High Storage Optimized Double Extra Large Instance
  price: 1.71
  price_per: hour
  ram: 62464
- bandwidth: null
  disk: 3200
  id: i2.4xlarge
  name: High Storage Optimized Quadruple Large Instance
  price: 3.41
  price_per: hour
  ram: 124928
- bandwidth: null
  disk: 6400
  id: i2.8xlarge
  name: High Storage Optimized Eight Extra Large Instance
  price: 6.82
  price_per: hour
  ram: 249856
template: provider.html
title: Amazon EC2

---
[Amazon Elastic Compute Cloud (EC2)](https://aws.amazon.com/) is one of the most popular cloud computing platforms, with datacenters in the Northern Virginia, Northern California, Oregon, Sao Paulo, Ireland, Sydney, Tokyo and Singapore.

<em>Due to the large amount of configurations available on EC2, we are currently not able to provide default values for the image. Refer to both the [EC2 Instance Types Matrix](https://aws.amazon.com/ec2/instance-types/) and the [official Ubuntu AMIs page](http://cloud-images.ubuntu.com/releases/14.04.1/release/) to define the AMI that will work for your location and instance size.</em>

<em>Don't have an Amazon EC2 account yet? <a href='https://aws.amazon.com/' target='_blank'>Sign up for an account</a>.</em>

### Example

The following [node file](http://docs.devo.ps/manual/nodes/#node-file) will create a micro instance of first generation (`size: t1.micro`) in the Northern Virginia datacenter (`location: us-east-1`) with a 64-bit Ubuntu 14.04.1 LTS, EBS-backed AMI (`image: ami-d2ff23ba`, see the [official Ubuntu AMIs page](http://cloud-images.ubuntu.com/releases/14.04.1/release/)):


    id: ec2_server
    name: EC2 server
    type: server

    providers:
      name: ec2
      size: t1.micro
      location: us-east-1
      image: ami-d2ff23ba
