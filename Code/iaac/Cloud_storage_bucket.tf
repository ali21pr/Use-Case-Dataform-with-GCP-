# Cloud Storage Bucket
 resource "google_storage_bucket" "bucket" {
  for_each      = var.buckets
  name          = join("", [
                            "${local.project_id}-gcs-",
                            "${lookup(local.location_map, each.value.location, each.value.location)}-",
                            "${each.value.identifier}",
                            ])
             
  location      = each.value.location
  storage_class = each.value.storage_class
  versioning {
    enabled = each.value.versioning_enabled
  }
}