# REMOTE STATE WITH LOCKING

## Using

Terraform v0.11.13 + provider.aws v1.56.0 

Powershell v5.1.17763.316

<br />

## Description
Utilize Terraform remote state using AWS S3 backend with state locking via AWS DynamoDB.

<br />

## Order of Application
When applying for the first time, run Infrastructure/Main.tf first to build
out the resources needed for applying Main.tf in the root folder which 
constructs the backend and webserver test example.

<br />

## Security Warning
:warning: The aws_instance "amiWebServer" in Main.tf in root is unsecured and is only 
intended to test backend configuration. It should be replaced before 
deployment to a prodcution environment and should not be left running 
unattended.
