resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = var.location_id
  auth_domain = var.auth_domain

  feature_settings {
    split_health_checks = true
  }
}
