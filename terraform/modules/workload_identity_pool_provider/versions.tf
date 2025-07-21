
terraform {
  required_version = ">= 1.9"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0.0"
    }

  }
  backend "gcs" {
    bucket = "nguyenvietkhoi-terraform"
    prefix = "wip/nguyenvietkhoi-wip"
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}