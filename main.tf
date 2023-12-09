provider "google" {
    project = var.project_id
 credentials = file("./ringed-trail-406913-555d2fba8adf.json")
}



resource "google_compute_network" "newvpc" {
    name = var.network_name
    mtu                     = 1460
      auto_create_subnetworks = false
      routing_mode = "GLOBAL"

}

resource "google_compute_subnetwork" "newsubnet" {
  name          = var.subnet_name
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.newvpc.id

}


resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

 

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

 

  network_interface {
    network = google_compute_network.newvpc.self_link

    subnetwork = google_compute_subnetwork.newsubnet.name

  }
}