# REMOTE STATE WITH LOCKING:
## Terraform remote state using AWS S3 with state locking via AWS DynamoDB.
***

### Order of Application
When applying for the first time, run Infrastructure/Main.tf first to build
out the resources needed for applying Main.tf in the root folder which 
constructs the backend and webserver test example.

### Security Warning
The aws_instance "amiWebServer" in Main.tf in root is unsecured and is only 
intended to test backend configuration. It should be replaced before 
deployment to a prodcution environment and should not be left running 
unattended.
