terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.51.1"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "celestine-ansible" {
  ami           = "ami-00fa32593b478ad6e"
  instance_type = "t2.micro"

  key_name = "celestine-onyango2.pem"
  
  tags = {
    Name = "celestine-ansible
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y software-properties-common",
      "sudo add-apt-repository --yes --update ppa:ansible/ansible",
      "sudo apt-get install -y ansible"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu" 
      private_key = file("~/.ssh/celestine-onyango2.pem") 
      host        = self.public_ip
    }
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ip_address.txt"
  }
}