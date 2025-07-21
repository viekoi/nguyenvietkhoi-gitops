
resource "google_compute_router" "cloud_router" {
  name    = "${var.gcp_project}-${var.gcp_region}-cloud-router"
  network = google_compute_network.gcp_vpc.id
  region  = var.gcp_region
}


resource "google_compute_router_nat" "cloud_nat" {
  name                               = "${var.gcp_project}-${var.gcp_region}-cloud-nat"
  router                             = google_compute_router.cloud_router.name
  region                             = google_compute_router.cloud_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
    enable = true
    filter = "ALL"
  }
}