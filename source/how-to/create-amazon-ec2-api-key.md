---
title: Create Amazon EC2 API key
---

Amazon AWS manages its user credentials with the IAM service. You need to create a user, save its keys and apply the correct user policies for that user to interact with the Amazon AWS services.

1. [Log on your Amazon account](https://console.aws.amazon.com/?nc2=h_m_mc)

1. Click on the `IAM` service

    <p align='center'><img src='/assets/images/ec2_api_iam.png' alt='AWS IAM' /></p>

1. Click on the `Users` item in the left menu

    <p align='center'><img src='/assets/images/ec2_api_iam_menu.png' alt='AWS IAM Menu' /></p>

1. Click on `Create` and enter a user (devo.ps for example)

    <p align='center'><img src='/assets/images/ec2_api_create.png' alt='AWS IAM create' /></p>

    <em>Upon Save, you will be presented with your access key and secret key, beware you must write them down now as they won't be displayed to you anymore in the future. If you don't save those information, you will have to re-create a user.</em>

1. You are now presented with the current user, click on the `Attach user policy` to set permissions

    <p align='center'><img src='/assets/images/ec2_api_iam_details.png' alt='AWS IAM user details' /></p>

    <em>By default a new user created on `IAM` does not have any access or permissions. You must set the user policy to grant that user the right to interact with the EC2 service.</em>

1. To simplify your life, use the templated rules, and select `Amazon EC2 Full Access` and apply the policy.

    <p align='center'><img src='/assets/images/ec2_api_iam_policy.png' alt='AWS IAM user policy' /></p>

    <em>You can select other templates if you know what you are doing. The only requirement being that devo.ps will be creating instances on your behalf and need write access for the EC2 service. You may want to add other policies like S3 if you plan on using S3 service.</em>

1. You will then be presented with a text version of the policies, finally click `Apply Policy`.

    <p align='center'><img src='/assets/images/ec2_api_iam_apply.png' alt='AWS IAM' /></p>

1. Go in your [devo.ps profile](https://app.devo.ps/#/user/profile)

    <em>Click on `Add a Cloud Provider`, select `Amazon EC2` and enter the keys created in the previous step.</em>


