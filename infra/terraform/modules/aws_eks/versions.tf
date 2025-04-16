terraform {
  required_providers {
    aws = {
      version = ">= 5.60.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    }
  }

  required_version = ">= 1.9.0"
}
