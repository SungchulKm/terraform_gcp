resource "google_compute_firewall" "ssh" {
  name    = "${var.network}-firewall-ssh"
  network = "${google_compute_network.multinode_vpc.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["${var.network}-firewall-ssh"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "http" {
  name    = "${var.network}-firewall-http"
  network = "${google_compute_network.multinode_vpc.name}"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags   = ["${var.network}-firewall-http"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "https" {
  name    = "${var.network}-firewall-https"
  network = "${google_compute_network.multinode_vpc.name}"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  target_tags   = ["${var.network}-firewall-https"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "icmp" {
  name    = "${var.network}-firewall-icmp"
  network = "${google_compute_network.multinode_vpc.name}"

  allow {
    protocol = "icmp"
  }

  target_tags   = ["${var.network}-firewall-icmp"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "mysql" {
  name    = "${var.network}-firewallmysql"
  network = "${google_compute_network.multinode_vpc.name}"

  allow {
    protocol = "tcp"
    ports    = ["5432"]
  }

  target_tags   = ["${var.network}-firewall-mysql"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "firewall-openshift-console" {
  name    = "${var.network}-firewall-openshift-console"
  network = "${google_compute_network.multinode_vpc.name}"

  allow {
    protocol = "tcp"
    ports    = ["8443"]
  }

  target_tags   = ["${var.network}-firewall-openshift-console"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "firewall-secure-was" {
  name    = "${var.network}-firewall-secure-was"
  network = "${google_compute_network.multinode_vpc.name}"

  allow {
    protocol = "tcp"
    ports    = ["24284"]
  }

  target_tags   = ["${var.network}-firewall-secure-forward"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "firewall-was" {
  name    = "${var.network}-firewall-was"
  network = "${google_compute_network.multinode_vpc.name}"

  allow {
    protocol = "tcp"
    ports    = ["8009"]
  }

  target_tags   = ["${var.network}-firewall-secure-forward"]
  source_ranges = ["10.10.0.0/24"]
}