
resource "google_container_cluster" "gke_cluster" {
  name     = "${var.gcp_project}-gke-cluster-autopilot"
  location = var.gcp_region

  enable_autopilot = true


  network    = google_compute_network.gcp_vpc.self_link
  subnetwork = google_compute_subnetwork.gcp_vpc_subnet.self_link


  deletion_protection = false


  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ip_range
  }

  # IP Address Ranges
  ip_allocation_policy {
    cluster_secondary_range_name  = google_compute_subnetwork.gcp_vpc_subnet.secondary_ip_range[0].range_name
    services_secondary_range_name = google_compute_subnetwork.gcp_vpc_subnet.secondary_ip_range[1].range_name
  }


  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "0.0.0.0/0"
      display_name = "entire-internet"
    }
  }
}