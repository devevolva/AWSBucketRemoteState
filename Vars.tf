###############################################################################
# 
# VARIABLES
#
###############################################################################

###############################################################################
# SERVER ######################################################################
variable "aws_ubuntu_instance" {
  description = "AWS Ubuntu AMI."
  default     = "ami-43a15f3e"
}
variable "aws_instance_type" {
  description = "AWS instance type."
  default     = "t2.micro"
}

variable "server_http_port" {
  description = "Server HTTP port."
  default     = 8080
}
