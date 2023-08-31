
# Service Accounts
service_accounts = {
    Dataform_sa = {
        purpose = "repos-dataform",
        display_name = "service account for dataform ",
        description  = "STANDARD"
}
    Dataform_cli = {
        purpose = "CLI-dataform",
        display_name = "service account for dataform CLI ",
        description  = "STANDARD"
}
    function_sa = {
        purpose = "cloud-function",
        display_name = "service account for cloud function ",
        description  = "STANDARD"
    }
    function_model = {
        purpose = "model-schedule",
        display_name = "service account for cloud function ",
        description  = "STANDARD"
    }
    workflow_Dataform = {
        purpose = "workflow-Dataform",
        display_name = "service account for Workflow that execute queries dataform",
        description  = "STANDARD"
}   
    scheduler_workflow = {
        purpose = "scheduler-workflow",
        display_name = "service account for scheduler that trigger workflow dataform ",
        description  = "STANDARD"
}   
    scheduler_model = {
        purpose = "scheduler-model",
        display_name = "service account for scheduler that trigger pubsub in order to trriger cloud function model ",
        description  = "STANDARD"
}
    pubsub_topic = {
        purpose = "pubsub-topic",
        display_name = "pub/sub that trigger cloud function model ",
        description  = "STANDARD"
}
}

# GCS Buckets
buckets = {
    gcs_sourcecode = {
        identifier = "cloud_fun_sourcecode_bucket"
        location = "europe-west1"
        storage_class = "STANDARD"
        versioning_enabled = "false"
    }
    gcs_file_appload = {
        identifier = "gcs_apload_file_bucket"
        location = "europe-west1"
        storage_class = "STANDARD"
        versioning_enabled = "false"
    }
    gcs_sourcecode_funct_model = {
        identifier = "gcs_sourcecode_funct_model"
        location = "europe-west1"
        storage_class = "STANDARD"
        versioning_enabled = "false"
    }
}

#google cloud function 

name_func = "gcs_alert_finalized"
description = "My function triggered by Cloud Storage"
runtime     = "python38"
entry_point = "hello_gcs_finalized"
available_memory_mb  = 256
#timeout_cf = 60
#google cloud function that trriger model
name_function = "update_model"
description_function = "My function triggered by Cloud Storage"
runtime_function     = "python38"
entry_point_function = "update_model"
available_memory_mb_function  = 256
timeout_model = 540
#Dataset Bigquery 
datasets = {
dataset_dataform2 = {
dataset_id = "dataset_dataform2"
location_dataset   = "europe-west1"
description_dataset = "this is project Dataform"
},
Dataset_dataform = {
dataset_id = "Dataset_dataform"
location_dataset   = "europe-west1"
description_dataset = "this is project Dataform"
}
}

#Dataform Repository 
project_id         = "kyr-sandbox-test-abo"
git_url            = "https://github.com/ali21pr/Dataform.git"
git_default_branch = "main"
name = "Repository"

#Secret 
secret_id = "Dataform"

#secret_version 
secret_data = "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"
#workflow
name_workflow = "Dataform"
region        = "europe-west1"

#scheduler
name_scheduler = "scheduler_Dataform"
schedule = "0 10 * * *"
description_Scheduler = "scheduler job of Dataform"
time_zone   = "Europe/Paris"

#topic
name_topic = "dataform_schedule_model"

#scheduler_model
name_scheduler_model = "scheduler_model"
schedule_model = "10 10 * * *"
description_Scheduler_model = "scheduler job of Dataform"
time_zone_model   = "Europe/Paris"

#App Engine 
location_id = "europe-west"
auth_domain = "keyrus.com"