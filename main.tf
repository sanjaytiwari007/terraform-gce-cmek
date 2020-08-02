provider "google" {
  project     = var.project_id
    region      = var.region
}
resource "google_kms_key_ring" "default" {
  name = var.ring_name
  location = var.ring_location
}
resource "google_kms_crypto_key" "default" {
  name = "gce_east1_symm_key1"
  key_ring = google_kms_key_ring.default.self_link
}
data "google_iam_policy" "default" {
  binding {
    members = [
    "serviceAccount:service-1049178966878@compute-system.iam.gserviceaccount.com"
    ]
    role = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  }
}
resource "google_kms_crypto_key_iam_policy" "default" {
  crypto_key_id = google_kms_crypto_key.default.id
  policy_data = data.google_iam_policy.default.policy_data
}
resource "google_compute_instance" "default" {
  name         = var.gce_name
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    kms_key_self_link = google_kms_crypto_key.default.self_link
    initialize_params {
      image = var.image
    }
  }
    network_interface{
    network = var.project_network
      access_config {

      }
    }
}
output "keyring" {
  value = google_kms_key_ring.default.self_link
}
output "kmskey" {
  value = google_kms_crypto_key.default.self_link
}
