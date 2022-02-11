data "google_compute_network" "my_network" {
  name = "default"
  project = var.mproject_id
}
module "compute_vm" {
  source = "../module"
  project_id = var.mproject_id
  name = "super-dev-instance"
  tags = ["http-server","https-server"]
  labels = {
    app = "prod"
  }
  metadata = {
    startup-script="apt-get install nginx -y"
  }
  network_interfaces = [{
   network = data.google_compute_network.my_network.self_link
    nat = true
    subnetwork = data.google_compute_network.my_network.subnetworks_self_links[8]
    addresses = null

  }]
  zone = var.mzone
}
