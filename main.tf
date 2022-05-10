provider "google" {
     project     = var.project
     region      = "asia-east1"
     zone        = "asia-east1-c"
     credentials = file("gcp-accounts.json")
}

resource "google_compute_instance" "default" {
  name         = "server-${count.index}"
  count = 3
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_storage_bucket" "default" {
  name = "terraformbucket02"
  project = "gcp-terraform-348507"
  storage_class = "REGIONAL"
  location = "us-east1"
}
