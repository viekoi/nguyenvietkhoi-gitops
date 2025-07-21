resource "google_service_account" "service_account" {
  account_id   = "wip-github-actions"
  display_name = "wip-github-actions"
  description  = "Service account for wip pool for github actions"
}

resource "google_project_iam_member" "workload_identity_user" {
  project = var.gcp_project_id
  role    = "roles/iam.workloadIdentityUser"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}


resource "google_project_iam_member" "service_account_admin" {
  project = var.gcp_project_id
  role    = "roles/iam.serviceAccountAdmin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "storage_admin" {
  project = var.gcp_project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}


resource "google_project_iam_member" "artifact_registry_writer" {
  project = var.gcp_project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}


resource "google_service_account_iam_member" "workload_identity_user" {
  service_account_id = google_service_account.service_account.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${data.google_iam_workload_identity_pool.pool.name}/attribute.repository/${var.repo_path}"
}






