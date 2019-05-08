###############################################################################
# 
# S3 REMOTE STATE BACKEND
#
# Run after apply Infrastructure/Main.tf on setup, run before on destroy
#
###############################################################################

###############################################################################
# BACKEND #####################################################################
terraform {
  required_version = ">= 0.11.11"

  backend "s3" {
    bucket         = "tf-backend-remote-state"
    key            = "terraform.tfstate"
    dynamodb_table = "tf-remote-state-lock"
    region         = "us-east-1"
  }
}


###############################################################################
# PROVIDER ####################################################################
provider "aws" {
    region  = "us-east-1"
    version = "~> 1.56"
}


###############################################################################
# SERVER ######################################################################
## ¡¡ Demonstration purposes only, not secured for production !! ##############
resource "aws_instance" "amiWebServer" {
  ami                         = "${var.aws_ubuntu_instance}"
  instance_type               = "${var.aws_instance_type}"
  associate_public_ip_address = "true"
  vpc_security_group_ids      = ["${aws_security_group.sgAMIWebServer.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "S3 Remote State Backend Example" > index.html
              nohup busybox httpd -f -p "${var.server_http_port}" &
              EOF
}

resource "aws_security_group" "sgAMIWebServer" {
  name          = "ami-web-server-sg-ingress"

  ingress {
    from_port   = "${var.server_http_port}"
    to_port     = "${var.server_http_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


###############################################################################
# OTUPUTS #####################################################################
# Use http://public_ip:8080 to hit web server test page #######################
output "amiWebServerPublicDNS" {
  value = "${aws_instance.amiWebServer.public_dns}"
}

output "amiWebServerPublicIP" {
  value = "${aws_instance.amiWebServer.public_ip}"
}
