provider "google" {
 credentials = file("gcpsvc.json")
 region = "us-west1" 
 project = "swift-hangar-275604"

}

resource "google_compute_subnetwork" "gkesubnet" {
    name = "gkesubnet-1"
    ip_cidr_range = "10.0.2.0/24"
    region = "us-west2"
    network = var.vpc

  
}



resource "google_container_cluster" "one" {
    name = "terrafrom-test-1"
    location = "us-west2"
    # remove_default_node_pool = true
    initial_node_count = 1
    network = var.vpc
    subnetwork = google_compute_subnetwork.gkesubnet.id
    node_config {
      machine_type = "g1-small"
      disk_size_gb = 10
    }
    
    master_auth{
        username = var.username
        password = var.passwd
    client_certificate_config{
        issue_client_certificate = false

    }
}
}

module "iam" {
    source = "./modules/iam"
    
}



