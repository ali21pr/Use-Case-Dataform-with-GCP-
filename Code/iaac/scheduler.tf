resource "google_cloud_scheduler_job" "scheduler_job" {
  name     = "${replace(var.project_id, "-", "_")}_sheduler_${var.name_scheduler}"
  region   = var.region
  schedule = var.schedule
  description = var.description_Scheduler
  time_zone    = var.time_zone

    http_target {
    http_method = "POST"
    uri         = "https://workflowexecutions.googleapis.com/v1/projects/${var.project_id}/locations/${var.region}/workflows/${google_workflows_workflow.workflow_dataform.name}/executions"

    oauth_token {
      service_account_email = google_service_account.service_account["scheduler_workflow"].email
    }

    headers = {
      Content-Type = "Google-Cloud-Scheduler"
      User-Agent   = "Google-Cloud-Scheduler"
    }

    body = base64encode(jsonencode({
      argument = "{}"
      callLogLevel = "CALL_LOG_LEVEL_UNSPECIFIED"
    }))
  }

}