---
"defaults":
  "image":
    "id": !!null >-
      null
  "location":
    "id": >-
      us-east-1
    "name": >-
      US East (N. Virginia)
"description": "Amazon EC2 is a full featured cloud provider with extensive options.\n\
  Due to the various types of instances, AMIs and locations, no default image AMI\n\
  can be provided by the devo.ps platform. Refer to the Amazon EC2 documentation\n\
  in order to find the proper combinaison between instance type, ami, location.\n\n\
  \nCurrently devo.ps only support Ubuntu 14.04 LTS, you should limit your AMI choices\n\
  to the official Ubuntu AMIs - see http://cloud-images.ubuntu.com/releases/14.04.1/release/ "
"locations":
- "country": >-
    US
  "id": >-
    us-east-1
  "name": >-
    US East (Northern Virginia)
- "country": >-
    US
  "id": >-
    us-west-1
  "name": >-
    US West (Oregon)
- "country": >-
    US
  "id": >-
    us-west-2
  "name": >-
    US West (Northern California)
- "country": >-
    Ireland
  "id": >-
    eu-west-1
  "name": >-
    EU (Ireland)
- "country": >-
    Singapore
  "id": >-
    ap-southeast-1
  "name": >-
    Asia Pacific (Singapore)
- "country": >-
    Australia
  "id": >-
    ap-southeast-2
  "name": >-
    Asia Pacific (Sydney)
- "country": >-
    Japan
  "id": >-
    ap-northeast-1
  "name": >-
    Asia Pacific (Tokyo)
- "country": >-
    Brazil
  "id": >-
    sa-east-1
  "name": >-
    South America (Sao Paulo)
"sizes":
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    15
  "id": >-
    t1.micro
  "name": >-
    Micro Instance
  "price": !!float >-
    0.02
  "price_per": >-
    hour
  "ram": !!int >-
    613
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    160
  "id": >-
    m1.small
  "name": >-
    Small Instance
  "price": !!float >-
    0.065
  "price_per": >-
    hour
  "ram": !!int >-
    1740
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    410
  "id": >-
    m1.medium
  "name": >-
    Medium Instance
  "price": !!float >-
    0.13
  "price_per": >-
    hour
  "ram": !!int >-
    3700
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    850
  "id": >-
    m1.large
  "name": >-
    Large Instance
  "price": !!float >-
    0.26
  "price_per": >-
    hour
  "ram": !!int >-
    7680
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    1690
  "id": >-
    m1.xlarge
  "name": >-
    Extra Large Instance
  "price": !!float >-
    0.52
  "price_per": >-
    hour
  "ram": !!int >-
    15360
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    420
  "id": >-
    m2.xlarge
  "name": >-
    High-Memory Extra Large Instance
  "price": !!float >-
    0.5
  "price_per": >-
    hour
  "ram": !!int >-
    17510
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    850
  "id": >-
    m2.2xlarge
  "name": >-
    High-Memory Double Extra Large Instance
  "price": !!float >-
    1.0
  "price_per": >-
    hour
  "ram": !!int >-
    35021
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    1690
  "id": >-
    m2.4xlarge
  "name": >-
    High-Memory Quadruple Extra Large Instance
  "price": !!float >-
    2.0
  "price_per": >-
    hour
  "ram": !!int >-
    70042
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    4000
  "id": >-
    m3.medium
  "name": >-
    Medium Instance
  "price": !!float >-
    0.113
  "price_per": >-
    hour
  "ram": !!int >-
    3840
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    32000
  "id": >-
    m3.large
  "name": >-
    Large Instance
  "price": !!float >-
    0.225
  "price_per": >-
    hour
  "ram": !!int >-
    7168
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    80000
  "id": >-
    m3.xlarge
  "name": >-
    Extra Large Instance
  "price": !!float >-
    0.45
  "price_per": >-
    hour
  "ram": !!int >-
    15360
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    160000
  "id": >-
    m3.2xlarge
  "name": >-
    Double Extra Large Instance
  "price": !!float >-
    0.9
  "price_per": >-
    hour
  "ram": !!int >-
    30720
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    350
  "id": >-
    c1.medium
  "name": >-
    High-CPU Medium Instance
  "price": !!float >-
    0.17
  "price_per": >-
    hour
  "ram": !!int >-
    1740
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    1690
  "id": >-
    c1.xlarge
  "name": >-
    High-CPU Extra Large Instance
  "price": !!float >-
    0.68
  "price_per": >-
    hour
  "ram": !!int >-
    7680
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    1690
  "id": >-
    cc1.4xlarge
  "name": >-
    Cluster Compute Quadruple Extra Large Instance
  "price": !!float >-
    1.3
  "price_per": >-
    hour
  "ram": !!int >-
    23552
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    3370
  "id": >-
    cc2.8xlarge
  "name": >-
    Cluster Compute Eight Extra Large Instance
  "price": !!float >-
    2.4
  "price_per": >-
    hour
  "ram": !!int >-
    63488
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    16
  "id": >-
    c3.large
  "name": >-
    Compute Optimized Large Instance
  "price": !!float >-
    0.15
  "price_per": >-
    hour
  "ram": !!int >-
    3750
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    40
  "id": >-
    c3.xlarge
  "name": >-
    Compute Optimized Extra Large Instance
  "price": !!float >-
    0.3
  "price_per": >-
    hour
  "ram": !!int >-
    7000
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    80
  "id": >-
    c3.2xlarge
  "name": >-
    Compute Optimized Double Extra Large Instance
  "price": !!float >-
    0.6
  "price_per": >-
    hour
  "ram": !!int >-
    15000
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    160
  "id": >-
    c3.4xlarge
  "name": >-
    Compute Optimized Quadruple Extra Large Instance
  "price": !!float >-
    1.2
  "price_per": >-
    hour
  "ram": !!int >-
    30000
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    320
  "id": >-
    c3.8xlarge
  "name": >-
    Compute Optimized Eight Extra Large Instance
  "price": !!float >-
    2.4
  "price_per": >-
    hour
  "ram": !!int >-
    60000
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    1690
  "id": >-
    cg1.4xlarge
  "name": >-
    Cluster GPU Quadruple Extra Large Instance
  "price": !!float >-
    2.1
  "price_per": >-
    hour
  "ram": !!int >-
    22528
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    240
  "id": >-
    cr1.8xlarge
  "name": >-
    High Memory Cluster Eight Extra Large
  "price": !!float >-
    3.5
  "price_per": >-
    hour
  "ram": !!int >-
    244000
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    48000
  "id": >-
    hs1.8xlarge
  "name": >-
    High Storage Eight Extra Large Instance
  "price": !!float >-
    4.6
  "price_per": >-
    hour
  "ram": !!int >-
    119808
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    800
  "id": >-
    i2.xlarge
  "name": >-
    High Storage Optimized Extra Large Instance
  "price": !!float >-
    0.85
  "price_per": >-
    hour
  "ram": !!int >-
    31232
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    1600
  "id": >-
    i2.2xlarge
  "name": >-
    High Storage Optimized Double Extra Large Instance
  "price": !!float >-
    1.71
  "price_per": >-
    hour
  "ram": !!int >-
    62464
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    3200
  "id": >-
    i2.4xlarge
  "name": >-
    High Storage Optimized Quadruple Large Instance
  "price": !!float >-
    3.41
  "price_per": >-
    hour
  "ram": !!int >-
    124928
- "bandwidth": !!null >-
    null
  "disk": !!int >-
    6400
  "id": >-
    i2.8xlarge
  "name": >-
    High Storage Optimized Eight Extra Large Instance
  "price": !!float >-
    6.82
  "price_per": >-
    hour
  "ram": !!int >-
    249856
"template": >-
  provider.html
"title": >-
  Ec2

---