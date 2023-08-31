/*************************************************
           Function source code
*************************************************/
data "archive_file" "gcs_sourcecode" {
  type        = "zip"
  source_dir  = "../sourcecode/Cloud_function"
  output_path = "../sourcecode/Cloud_function/code.zip"
}
#step2_google_storage_bucket_object
resource "google_storage_bucket_object" "archiver" {
  name = "code.zip"
  bucket = google_storage_bucket.bucket["gcs_sourcecode"].name
  source = data.archive_file.gcs_sourcecode.output_path
}

/*************************************************
           step4_google_cloud_functions
*************************************************/
resource "google_cloudfunctions_function" "gcs_alert_finalized" {
  name        = "${local.project_id}-fct-${var.name_func}"
  description = var.description
  runtime     = var.runtime
  entry_point = var.entry_point
  available_memory_mb = var.available_memory_mb
  service_account_email = google_service_account.service_account["function_sa"].email
  source_archive_bucket = google_storage_bucket.bucket["gcs_sourcecode"].name
  source_archive_object = google_storage_bucket_object.archiver.name
  # Ajout du déclencheur
  event_trigger {
    event_type = "google.storage.object.finalize"
    resource   = google_storage_bucket.bucket["gcs_file_appload"].name
  }
  
  timeout = 60
  labels = {
    my-label = "my-label-value"
  }

  environment_variables = {
    MY_ENV_VAR = "my-env-var-value"
  }
  
  lifecycle {
  replace_triggered_by = [
    google_storage_bucket_object.archiver.md5hash
  ]
  }

}


