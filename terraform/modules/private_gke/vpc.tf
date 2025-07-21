
resource "google_compute_network" "gcp_vpc" {
  name                    = "${var.gcp_project}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "gcp_vpc_subnet" {
  name                     = "${var.gcp_project}-${var.gcp_region}-subnet"
  region                   = var.gcp_region
  network                  = google_compute_network.gcp_vpc.id
  private_ip_google_access = true
  ip_cidr_range            = var.subnet_ip_range
  secondary_ip_range {
    range_name    = "kubernetes-pod-range"
    ip_cidr_range = var.pods_ip_range
  }
  secondary_ip_range {
    range_name    = "kubernetes-services-range"
    ip_cidr_range = var.services_ip_range
  }
}


