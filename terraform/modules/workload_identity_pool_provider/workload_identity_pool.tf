

resource "google_iam_workload_identity_pool" "pool" {
  workload_identity_pool_id = "wip-github-actions"

}

resource "google_iam_workload_identity_pool_provider" "github" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "wip-github-actions"
  display_name                       = var.provider_name
  description                        = var.description
  disabled                           = false
  attribute_condition                = <<EOT
    attribute.repository == "${var.repo_path}"
EOT
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

data "google_iam_workload_identity_pool" "pool" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.pool.workload_identity_pool_id
}