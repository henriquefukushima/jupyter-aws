# Jupyter Notebook on AWS with Terraform

The purpose of this project is to introduce new users to the Amazon Web Services (AWS) by setting up a simple infrastructure to run Jupyter Notebooks on AWS using Terrafom.

Terraform will provide the following features on AWS

- EC2 Instance: a cloud virtual machine where the Jupyter Notebook will be executed
- Security Group: a set of firewall rules that control the in-and-out network traffic of the EC2 Instance
- SSH Keys Pair: cryptography keys that enables a safe connection to the EC2 instance