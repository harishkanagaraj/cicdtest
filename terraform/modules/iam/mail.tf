

resource "google_project_iam_custom_role" "gke-deployer" {
  role_id     = "gke_deployertest"
  title       = "Minimal IAM role for GKE access"
  description = "Bare minimum permissions to access the kubernetes API for using the Jenkins GKE plugin."
  project     = var.project

  permissions = [
    "compute.zones.list",
    "container.apiServices.get",
    "container.apiServices.list",
    "container.clusters.get",
    "container.clusters.getCredentials",
    "container.clusters.list",
    "resourcemanager.projects.get",
  ]
}


resource "google_service_account" "jenkins-gke-deployer" {
  account_id   = var.sa_name
  display_name = var.sa_name
}


resource "google_project_iam_member" "jenkins-deployer-gke-access" {
  project = var.project
  role    = "projects/${var.project}/roles/${google_project_iam_custom_role.gke-deployer.role_id}"
  member  = "serviceAccount:${google_service_account.jenkins-gke-deployer.email}"
}