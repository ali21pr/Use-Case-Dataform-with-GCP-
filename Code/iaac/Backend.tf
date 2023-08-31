terraform {
  backend "gcs" {
    bucket  = "buckets_functions"
    prefix  = "terraform"
  }
}
