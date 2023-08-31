resource "google_cloud_scheduler_job" "job" {
  name     = "${replace(var.project_id, "-", "_")}_sheduler_${var.name_scheduler_model}"
  region   = var.region
  schedule = var.schedule_model
  description = var.description_Scheduler_model
  time_zone    = var.time_zone_model

  pubsub_target {
    topic_name = google_pubsub_topic.topic.id
    data       = base64encode("update model")
  }
}