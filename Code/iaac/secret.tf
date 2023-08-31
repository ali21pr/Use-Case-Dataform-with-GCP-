resource "google_secret_manager_secret" "Dataform_secret" {
  secret_id = "${replace(var.project_id, "-", "_")}_Secret_${var.secret_id}"

  replication {
    automatic = true
  }
}
