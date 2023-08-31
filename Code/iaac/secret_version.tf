resource "google_secret_manager_secret_version" "secret_version" {
  provider = google-beta
  secret = google_secret_manager_secret.Dataform_secret.id
  secret_data = var.secret_data
}
