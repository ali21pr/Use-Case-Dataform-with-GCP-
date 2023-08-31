resource "google_dataform_repository" "dataform_respository" {
  provider = google-beta
  name     = "${replace(var.project_id, "-", "_")}_Dataform_${var.name}"

  git_remote_settings {
    url                                    = var.git_url
    default_branch                         = var.git_default_branch
    authentication_token_secret_version    = google_secret_manager_secret_version.secret_version.id
  }

  workspace_compilation_overrides {
    default_database = var.project_id
  }
}
