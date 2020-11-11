

resource "google_service_account" "jenkins" {
    account_id = "cicd-k8s-svc"
    display_name = "cicd-k8s-svc"
}


resource "google_project_iam_custom_role" "cicdjenkins" {
    role_id = "cicdgkerole"
    title = "cide-customerle"
    permissions = ["container.apiServices.get", "container.apiServices.list", 
                   "container.clusters.get", "container.clusters.getCredentials",
                   "container.clusters.list", "resourcemanager.projects.get"]
    
}

resource "google_service_account_iam_member" "cicdmember" {
    service_account_id = google_service_account.jenkins.name
    role = google_project_iam_custom_role.cicdjenkins.id
    member =  "serviceAccount:${google_service_account.jenkins.email}"
        
    
}


resource "google_service_account_iam_binding" "cicd" {
    service_account_id = google_service_account.jenkins.name
    role = google_project_iam_custom_role.cicdjenkins.id
    members = [
        "serviceAccount:${google_service_account.jenkins.email}"
        
    ]

}

