resource "helm_release" "argocd_image_updater" {
  name = "argocd-image-updater"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argocd-image-updater"
  namespace        = "argocd"
  create_namespace = true
  version          = "0.12.3"

  depends_on = [helm_release.argocd]
}

resource "google_project_iam_binding" "cluster_viewer" {
  project = var.gcp_project_id
  role    = "roles/artifactregistry.repoAdmin"

  members = [
    "principal://iam.googleapis.com/projects/${var.gcp_project_number}/locations/global/workloadIdentityPools/${var.gcp_project_id}.svc.id.goog/subject/ns/argocd/sa/argocd-image-updater"
  ]
}