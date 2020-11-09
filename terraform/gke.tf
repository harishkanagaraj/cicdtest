provider "google" {
 credentials = file("gcpsvc.json")
 region = "us-west1" 
 project = "swift-hangar-275604"

}

resource "google_container_cluster" "one" {
    name = "terrafrom-test-1"
    location = "us-west1"
    # remove_default_node_pool = true
    initial_node_count = 1
    network = var.vpc
    subnetwork = var.subnet
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