
# Demo project

This project is final task for DevOps course by TeachMeSkills.

It includes:
- Python Demoapp (https://github.com/benc-uk/python-demoapp)
- Terraform code to deploy ec2 insatnce in AWS
- Ansible role to deploy docker on host and run docker container with app
- Ansible role to deploy docker and docker-compose on host and run prometheus-grafana-blackbox-node-exporter stack for monitoring
- .gitlab-ci file for GitLab CI/CD with described CI/CD process wich tests, builds app, pushes created docker image to docker registry, deploys infrastructure with monitoring in aws and deploys app docker container to it 

# Requirments to start

## If you want to use this project locally

You need to add some environment variables to your system:
- PROD_CONTAINER_NAME
  Name of container that will be made to run python demoapp
- PROD_CONTAINER_IMAGE
  Full name of container image with tag (it will be used to pull image to docker registry and then deploy it to docker host
- TF_VAR_VMNAME
  Name of machine that will be created in aws and in which app and monitoring will be deployed
- TF_aws_ssh_key
  Name of ssh key-pair in your aws account, that will be assigned to deployed VM
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- DOCKER_HUB_USER
  User for docker registry to push and pull docker image with app
- DOCKER_HUB_PASS
  Password for docker registry to push and pull docker image with app

  Also you need to add private key from key-pair that you selected in TF_aws_ssh_key to host from which you execute commands before start

## If you want to use this project with gitlab ci/cd

1. Mirror this project to gitlab
2. Move terraform state file to gitlab
3. Change variables in .gitlab-ci.yml:
- PROD_CONTAINER_NAME
  Name of container that will be made to run python demoapp
- PROD_CONTAINER_IMAGE
  Full name of container image with tag (it will be used to pull image to docker registry and then deploy it to docker host
- TF_VAR_VMNAME
  Name of machine that will be created in aws and in which app and monitoring will be deployed
- TF_aws_ssh_key
  Add this variable to .gitlab-ci.yml in section variables with the name of ssh key-pair in your aws account, that will be assigned to deployed VM
4. Add secret variables to gitlab:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- DOCKER_HUB_USER
  User for docker registry to push and pull docker image with app
- DOCKER_HUB_PASS
  Password for docker registry to push and pull docker image with app
- SSH_KEY_AWS
  Add as type file and fill with ssh private key from key-pair that you selected in TF_aws_ssh_key

