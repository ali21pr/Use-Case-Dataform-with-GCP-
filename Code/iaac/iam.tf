
# IAM Project_level 

module "projects_iam_bindings" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  version  = "~> 7.6"
  projects = [local.project_id]
  

  #mode    = "additive"

  bindings = {

    "roles/logging.logWriter" = [
      "serviceAccount:${google_service_account.service_account["function_sa"].email}"
    ]

    "roles/bigquery.admin" = [
      "serviceAccount:${google_service_account.service_account["function_sa"].email}",
      "serviceAccount:${google_service_account.service_account["function_model"].email}"
    ]

    "roles/storage.admin" = [
      "serviceAccount:${google_service_account.service_account["function_sa"].email}"
    ]

    # Pour le compte de service "Dataform"
  "roles/bigquery.dataEditor" = [
    "serviceAccount:${google_service_account.service_account["Dataform_sa"].email}",
    "serviceAccount:${google_service_account.service_account["Dataform_cli"].email}",
    
  ]
  "roles/bigquery.dataViewer" = [
    "serviceAccount:${google_service_account.service_account["Dataform_sa"].email}",
    "serviceAccount:${google_service_account.service_account["Dataform_cli"].email}",
    
  ]
  "roles/bigquery.jobUser" = [
    "serviceAccount:${google_service_account.service_account["Dataform_sa"].email}",
    "serviceAccount:${google_service_account.service_account["Dataform_cli"].email}",
    
  ]
  "roles/secretmanager.secretAccessor" = [
    "serviceAccount:${google_service_account.service_account["Dataform_sa"].email}",
    
  ]

  # Pour le compte de service "workflow_Dataform"
    "roles/dataform.editor" = [
      "serviceAccount:${google_service_account.service_account["workflow_Dataform"].email}"
    ]

    # Ajout du rôle Workflows Invoker
    "roles/workflows.invoker" = [
      "serviceAccount:${google_service_account.service_account["scheduler_workflow"].email}"
    ]

    # Cloud function qui va triggerer le model
    "roles/cloudfunctions.developer" = [
      "serviceAccount:${google_service_account.service_account["function_model"].email}"
    ]

    # Ajout du rôle Pub/Sub editor
    "roles/pubsub.editor" = [
      "serviceAccount:${google_service_account.service_account["pubsub_topic"].email}"
    ] 

    # Ajout du rôle cloudsheduler admin pour le scheduler model
    "roles/cloudscheduler.admin" = [
      "serviceAccount:${google_service_account.service_account["scheduler_model"].email}"
    ]

    # Ajout du rôle Pub/Sub publisher pour le sheduler model
    "roles/pubsub.publisher" = [
      "serviceAccount:${google_service_account.service_account["scheduler_model"].email}"
    ] 
  }

}

# IAM Dataset
resource "google_bigquery_dataset_iam_binding" "read_bq" {
  for_each = google_bigquery_dataset.dataset
  dataset_id = each.value.dataset_id
  role       = "roles/bigquery.admin"

  members = [
    "serviceAccount:${google_service_account.service_account["function_sa"].email}",
    "serviceAccount:${google_service_account.service_account["function_model"].email}"
    
  ]
}
# IAM Bucket
resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.bucket["gcs_file_appload"].name
  role = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.service_account["function_sa"].email}",
  ]
}
