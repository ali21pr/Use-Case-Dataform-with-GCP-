resource "google_bigquery_dataset" "dataset" {
  for_each = var.datasets
  dataset_id  = "${replace(local.project_id,"-","_")}_bqd_${each.value.dataset_id}"
  location    = each.value.location_dataset
  description = each.value.description_dataset

  labels = {
    "label-key" = "label-value"
  }
}