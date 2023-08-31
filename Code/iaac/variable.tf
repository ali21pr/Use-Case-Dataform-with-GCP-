
# Service Account
variable "service_accounts" {
    type = map(object({
    purpose      = string
    display_name = string
    description  = string
  }))
}

# Bucket
variable "buckets" {
    type = map(object({
    identifier = string
    location = string
    storage_class = string
    versioning_enabled = bool
  }))
}

#google cloud function 

variable "name_func" {
    type = string
}
variable "description" {
    type = string
}
variable "runtime" {
    type = string
}
variable "entry_point" {
    type = string
}
variable "available_memory_mb" {
    type = number
}

#google cloud function that trigger model

variable "name_function" {
    type = string
}
variable "description_function" {
    type = string
}
variable "runtime_function" {
    type = string
}
variable "entry_point_function" {
    type = string
}
variable "available_memory_mb_function" {
    type = number
}
variable "timeout_model" {
    type = number
}

#Dataset Bigquery 
variable "datasets" {
  type = map(object({
    dataset_id = string
    location_dataset = string
    description_dataset = string
  }))
}

#Dataform reposiyory
variable "project_id" {
  description = "The ID of your Google Cloud project"
  type        = string
}

variable "git_url" {
  description = "URL of your Git repository"
  type        = string
}

variable "git_default_branch" {
  description = "Default branch of your Git repository"
  type        = string
}
variable "name" {
  description = "The name of the Dataform repository"
  type        = string
}

#Secret 
variable "secret_id" {
  description = "ID for the Secret Manager secret"
  type        = string
}

#secret_version 
variable "secret_data" {
  description = "The secret data"
  type        = string
}

#workflow
variable "name_workflow" {
  description = "The name of the workflow."
  type        = string
}

variable "region" {
  description = "The region where the workflow will be deployed."
  type        = string
  default     = "europe-west1"
}
#scheduler 
variable "name_scheduler_model" {
  description = "The name of the scheduler"
  type        = string
}

variable "schedule_model" {
  description = "The schedule on which the job will be executed"
  type        = string
  default     = "0 * * * *"
}

variable "description_Scheduler_model" {
  description = "scheduler job of Dataform"
  type        = string
}

variable "time_zone_model" {
  description = "The time zone to be used for the scheduler job"
  type        = string
}

#Pub/Sub 
variable "name_topic" {
  description = "The name of the topic"
  type        = string
}

#scheduler 
variable "name_scheduler" {
  description = "The name of the scheduler"
  type        = string
}

variable "schedule" {
  description = "The schedule on which the job will be executed"
  type        = string
  default     = "0 * * * *"
}

variable "description_Scheduler" {
  description = "scheduler job of Dataform"
  type        = string
}

variable "time_zone" {
  description = "The time zone to be used for the scheduler job"
  type        = string
}

#App Engine
variable "location_id" {
  description = "Location of the App Engine"
  type        = string
}

variable "auth_domain" {
  description = "The auth domain of the app engine"
  type        = string
}