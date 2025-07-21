
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
    prefix = "gke/nguyenvietkhoi-gke"
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

data "google_client_config" "provider" {}

data "google_container_cluster" "gke_cluster" {
  name     = "${var.gcp_project}-gke-cluster-autopilot"
  location = var.gcp_region
}

provider "helm" {
  kubernetes = {
    host  = "https://${data.google_container_cluster.gke_cluster.endpoint}"
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(
      data.google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate
    )
  }
}
