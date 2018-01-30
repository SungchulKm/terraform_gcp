provider "google" {
  credentials = "/home/schulkim/.config/gcloud/terraform-admin-new.json"
  project     = "${var.project-name}"
  region      = "${var.region}"
}


resource "google_compute_network" "multinode_vpc" {
  name = "${var.network}"
}

resource "google_compute_subnetwork" "multinode_vpc_subnetwork" {
  name          = "${var.network}-subnetwork-${var.region}"
  region        = "${var.region}"
  network       = "${google_compute_network.multinode_vpc.self_link}"
  ip_cidr_range = "10.10.0.0/24"
}