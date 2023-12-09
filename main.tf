provider "google" {
    project = var.project_id
 #credentials = file("./ringed-trail-406913-555d2fba8adf.json")
}



resource "google_compute_network" "newvpc" {
    name = var.network_name
    mtu                     = 1460
      auto_create_subnetworks = true
      routing_mode = "GLOBAL"

}
