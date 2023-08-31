/*
* Service Account
*/
resource "google_service_account" "service_account" {
  for_each     = var.service_accounts
  account_id   = "sac-${lower(each.value.purpose)}"
  display_name = each.value.display_name
  description  = each.value.description
}
