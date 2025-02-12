terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}

provider "aws"{
    region = "sa-east-1" # South America (Sao Paulo)
}

# SSH Keys Pair
resource "aws_key_pair" "key_pair" {
    key_name = "jupyter-key"
    public_key = var.public_key
}

# Security Group
resource "aws_security_group" "security_group" {
    name = "jupyter-sg"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.public_ip}/32"] 
    }

    ingress {
        from_port = 8888
        to_port = 8888
        protocol = "tcp"
        cidr_blocks = ["${var.public_ip}/32"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# EC2 Instance
resource "aws_instance" "instance" {
    ami = "ami-0780816dd7ce942fd" # Ubuntu Server 22.04 LTS
    instance_type = "t2.micro"
    key_name = aws_key_pair.key_pair.key_name
    security_groups = [aws_security_group.security_group.name]

    tags = {
        Name = "jupyter-instance"
    }
}
