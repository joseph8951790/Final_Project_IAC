terraform {
  backend "s3" {
    bucket         = "final-project-terraform-state-8870"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
} 