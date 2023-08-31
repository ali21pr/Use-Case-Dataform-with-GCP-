locals{
    repository = "projects/kyr-sandbox-test-abo/locations/europe-west1/repositories/kyr_sandbox_test_abo_Dataform_Repository"
    workspace =  "projects/kyr-sandbox-test-abo/locations/europe-west1/repositories/kyr_sandbox_test_abo_Dataform_Repository/workspaces/kyr_sandbox_test_abo_Dataform_workspace"
}

resource "google_workflows_workflow" "workflow_dataform" {
  name          = "${replace(var.project_id, "-", "_")}_Workflow_${var.name_workflow}"
  region        = var.region
  description   = "Workflow that execute all queries that we are defined in dataform"
  service_account = google_service_account.service_account["workflow_Dataform"].email
  source_contents = <<-EOF
  # this is step workflows
  main:
    steps:
    - init:
        assign:
        - repository: projects/kyr-sandbox-test-abo/locations/europe-west1/repositories/kyr_sandbox_test_abo_Dataform_Repository
        - workspace: projects/kyr-sandbox-test-abo/locations/europe-west1/repositories/kyr_sandbox_test_abo_Dataform_Repository/workspaces/kyr_sandbox_test_abo_Dataform_workspace
    - compileQueries:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/compilationResults"
            auth:
                type: OAuth2
            body:
               # gitCommitish: ali_workspace
                workspace: ${local.workspace}
        result: compilationResult
    - runQuery1_1:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete1_1"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery2_1:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete2_1"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery3_1:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete3_1"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery4_1:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete4_1"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery5_1:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete5_1"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery6_1:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete6_1"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery7_1:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete7_1"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery8_1:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete8_1"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery9_1:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete9_1"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery10_1:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete10_1"]
                    includedTargets: []
        result: workflowInvocation
    - sleep1:
        call: sys.sleep
        args:
            seconds: 45
    - runQuery1_2:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete1_2"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery2_2:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete2_2"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery3_2:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete3_2"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery4_2:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete4_2"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery5_2:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete5_2"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery6_2:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete6_2"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery7_2:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete7_2"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery8_2:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete8_2"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery9_2:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete9_2"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery10_2:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete10_2"]
                    includedTargets: []
        result: workflowInvocation
    - sleep2:
        call: sys.sleep
        args:
            seconds: 45
    - runQuery1_3:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete1_3"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery2_3:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete2_3"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery3_3:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete3_3"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery4_3:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete4_3"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery5_3:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete5_3"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery6_3:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete6_3"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery7_3:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete7_3"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery8_3:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete8_3"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery9_3:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete9_3"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery10_3:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete10_3"]
                    includedTargets: []
        result: workflowInvocation
    - sleep3:
        call: sys.sleep
        args:
            seconds: 45
    - runQuery1_4:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete1_4"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery2_4:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete2_4"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery3_4:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete3_4"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery4_4:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete4_4"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery5_4:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete5_4"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery6_4:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete6_4"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery7_4:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete7_4"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery8_4:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete8_4"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery9_4:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete9_4"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery10_4:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete10_4"]
                    includedTargets: []
        result: workflowInvocation
    - sleep4:
        call: sys.sleep
        args:
            seconds: 45
    - runQuery1_5:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete1_5"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery2_5:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete2_5"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery3_5:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete3_5"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery4_5:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete4_5"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery5_5:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete5_5"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery6_5:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete6_5"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery7_5:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete7_5"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery8_5:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete8_5"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery9_5:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete9_5"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery10_5:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete10_5"]
                    includedTargets: []
        result: workflowInvocation
    - sleep5:
        call: sys.sleep
        args:
            seconds: 45
    - runQuery1_6:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete1_6"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery2_6:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete2_6"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery3_6:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete3_6"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery4_6:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete4_6"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery5_6:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete5_6"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery6_6:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete6_6"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery7_6:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete7_6"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery8_6:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete8_6"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery9_6:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete9_6"]
                    includedTargets: []
        result: workflowInvocation
    - runQuery10_6:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["requete10_6"]
                    includedTargets: []
        result: workflowInvocation
    - sleep6:
        call: sys.sleep
        args:
            seconds: 45
    - runModel_1:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["1_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_2:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["2_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_3:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["3_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_4:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["4_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_5:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["5_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_6:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["6_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_7:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["7_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_8:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["8_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_9:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["9_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_10:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["10_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_11:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["11_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_12:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["12_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_13:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["13_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_14:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["14_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_15:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["15_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModel_16:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["16_modele"]
                    includedTargets: []
        result: workflowInvocation
    - runModelBQ_ML:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["BQ_ML"]
                    includedTargets: []
        result: workflowInvocation
    - sleep7:
        call: sys.sleep
        args:
            seconds: 60
    - runpredictions_risk:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["predictions_risk"]
                    includedTargets: []
        result: workflowInvocation
    - sleep8:
        call: sys.sleep
        args:
            seconds: 60
    - runrisk_comparaiosn:
        call: http.post
        args:
            url: "https://dataform.googleapis.com/v1beta1/${local.repository}/workflowInvocations"
            auth:
                type: OAuth2
            body:
                compilationResult: $${compilationResult.body.name}
                invocationConfig:
                    includedTags: ["risk_comparaiosn"]
                    includedTargets: []
        result: workflowInvocation
    - complete:
        return: $${workflowInvocation.body.name}
    
EOF
}
