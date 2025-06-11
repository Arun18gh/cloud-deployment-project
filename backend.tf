terraform {
  backend "s3" {
    bucket         = "networking-ca1-20061730"
    key            = "terraform/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
}
