/*************************************************
           Function source code
*************************************************/
data "archive_file" "gcs_sourcecode_funct_model" {
  type        = "zip"
  source_dir  = "../sourcecode/cloud_func_schedule_model"
  output_path = "../sourcecode/cloud_func_schedule_model/code.zip"
}
#step2_google_storage_bucket_object
resource "google_storage_bucket_object" "archiv" {
  name = "code.zip"
  bucket = google_storage_bucket.bucket["gcs_sourcecode_funct_model"].name
  source = data.archive_file.gcs_sourcecode_funct_model.output_path
}

/*************************************************
           step4_google_cloud_functions
*************************************************/
resource "google_cloudfunctions_function" "update_model" {
  name        = "${local.project_id}-fct-${var.name_function}"
  description = var.description_function
  runtime     = var.runtime_function
  timeout     = var.timeout_model
  entry_point = var.entry_point_function
  available_memory_mb = var.available_memory_mb_function
  service_account_email = google_service_account.service_account["function_model"].email
  source_archive_bucket = google_storage_bucket.bucket["gcs_sourcecode_funct_model"].name
  source_archive_object = google_storage_bucket_object.archiv.name
  # Ajout du déclencheur
  event_trigger {
    event_type = "providers/cloud.pubsub/eventTypes/topic.publish"
    resource = google_pubsub_topic.topic.id
  }
  labels = {
    my-label = "my-label-value"
  }

  environment_variables = {
    MY_ENV_VAR = "my-env-var-value"
  }
  
  lifecycle {
  replace_triggered_by = [
    google_storage_bucket_object.archiv.md5hash
  ]
  }

}


