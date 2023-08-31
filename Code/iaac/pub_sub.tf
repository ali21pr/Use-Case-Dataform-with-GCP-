resource "google_pubsub_topic" "topic" {
  name = "${replace(var.project_id, "-", "_")}_topic_${var.name_topic}"
}