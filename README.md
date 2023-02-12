# Automated CI/CD pipeline for web development


## Summary

The purpose of this repository is to provide an easily configurable and flexible framework for a fully automated pipeline to use for your web development projects. 

## Intro

In its current iteration the code is set up to create the framework for two separate developer teams to be able to have
immediate access to their published resources in a live production environment. The project uses Terraform to provision all 
the necessary resources in AWS to have a functioning website that is updated with every commit to the respective frontend or
backend developer repositories. The frontend and backend resources are containerized and uploaded to Docker Hub with each 
commit. The containers are hosted on two separate EC2 instances in the AWS cloud and automatically updated when changes occur 
using webhooks and timed redeploy scripts for redundancy. The database is hosted on a separate RDS instance in the cloud. 
Automation is achieved using Github Actions which provides granular control over when and how changes are tracked and pushed 
to the live environment. For a flowchart detailing the workflow, please refer to the following diagram:

[Workflow on Draw.io](https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=CI-CD%20Pipeline.drawio#Uhttps%3A%2F%2Fraw.githubusercontent.com%2Fcsotiistvan%2FDocker-redeploy-with-webhooks%2Fmain%2FCI-CD%2520Pipeline.drawio)


## How to use this repository

### Requirements

To use this repository, you will need to have accounts for the followintg platforms:
- [GitHub](https://docs.github.com/en/get-started/signing-up-for-github/signing-up-for-a-new-github-account)
- [AWS](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/) Related secrets are AWS_ACC_KEY (API Access Key) and AWS_SECRET_KEY (API Secret Key)
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-sign-up) Related secrets are TF_API_TOKEN (API Access token)
- [Docker Hub](https://docs.docker.com/docker-id/) Related secrets are DOCKERHUB_USERNAME and DOCKERHUB_PASSWORD

The respective credentials or tokens need to be set up in your Github Actions secrets. Please make sure to have a local backup of these details as once saved, you will not be able to view them again. 

### Setting up your repositories

The files included in the `external` folder should be added to the respective repositories. The .yml files contain the Github actions to pack and publish the built resources on Docker Hub. These files should be placed under `.github/workflows` in the repository. The Dockerfile can be added to any location, as long as you refer to the appropriate path in the .yml file. The repository secrets for Docker Hub login data need to be added in the settings. It is possible to automatically build your site/apps with Github actions as well if that is preferred, in this case the build actions can be added to the existing .yml. In case you prefer to use webhooks for container redeployment, you need to set those up as well in the settings.  

### Customizing code for your project

To adapt the Terraform code to your preferences, some details will have to be changed in the .tf files. The code includes an example configuration, but you should be sure the AWS resources used are both sufficient and necessary for your project. It is recommended to play around in the AWS Cost Explorer to find out what setup is best for you. Inline comments will help with the details that might need to be changed. 

## Todos

Added functionality 

 - Optional load balancer 
 - Add testing environment in addition to production
 - Improve database security and add automatic backups
 - Introduce more variables for ease of customization
 - Automatic SSL certificate setup and HTTPS configuration

Fixes

 - Clean up inline comments in code

## Main contributors

Author - [Istvan Csoti](https://github.com/csotiistvan)

Special thanks to [Richard Weibl](https://github.com/WRicsi) who was the co-author of the project this grew out from. 
You can check the original project out here: [Adventures in Terraform](https://github.com/csotiistvan/Adventures-in-Terraform)
