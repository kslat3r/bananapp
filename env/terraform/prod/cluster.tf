resource "google_container_cluster" "banapp-prod" {
  name = "banapp-prod"
  zone = "europe-west2-a"
  initial_node_count = 3
  
  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = 10
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append"
    ]
  }
}

output "get-credentials-cmd" {
  value = "gcloud container clusters get-credentials ${google_container_cluster.banapp-prod.id} --zone ${google_container_cluster.banapp-prod.zone}"
}