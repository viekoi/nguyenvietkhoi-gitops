resource "google_artifact_registry_repository" "my-repo" {
  project       = var.gcp_project_id
  location      = var.gcp_region
  format        = var.format
  repository_id = var.repo_name
  description   = var.description
}