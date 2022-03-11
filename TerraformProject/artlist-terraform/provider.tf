variable "minikube_host" {
  type        = string
  description = ""
  default     = "https://127.0.0.1:58720"
}

terraform {
  required_version = "~> 1.0.0"
  required_providers {
    mycloud = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.13"
    }
  }
  backend "local" {
    path = "/tmp/terraform.tfstate"
  }
}

provider "kubernetes" {
  host = var.minikube_host
}