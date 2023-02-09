# Automated CI/CD pipeline for web development


## Summary

The purpose of this project is to provide a framework for a fully automated pipeline for use in web development. 

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

## Todos

## Main contributors

Author - [Istvan Csoti](https://github.com/csotiistvan)

Special thanks to [Richard Weibl](https://github.com/WRicsi) who was the co-author of the project this grew out from. You can check the original project out here: [Adventures in Terraform](https://github.com/csotiistvan/Adventures-in-Terraform)
