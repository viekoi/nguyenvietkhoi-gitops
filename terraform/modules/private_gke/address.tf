resource "google_compute_address" "dev_static_external_lb" {
  name   = "dev-static-external-lb"
  region = "us-central1"
}