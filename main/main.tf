#**********************ORG***************************
resource "github_actions_organization_secret" "org_secret" {
  for_each = var.org_secrets
  secret_name     = each.value["secret_name"]
  visibility      = "all"
  encrypted_value = each.value["secret_value"]
}

resource "github_actions_organization_variable" "org_variable" {
  for_each = var.org_variables
  variable_name   = each.value["variable_name"]
  visibility      = "all"
  value           = each.value["variable_value"]
}
#***********************ORG-REPO**************************
resource "github_actions_secret" "org_repo_secret" {
  for_each = var.repo_secrets
  repository       = each.value["repo_name"]
  secret_name      = each.value["secret_name"]
  encrypted_value  = each.value["secret_value"]
}
resource "github_actions_variable" "example_variable" {
  for_each = var.repo_variables
  repository       = each.value["repo_name"]
  variable_name    = each.value["variable_name"]
  value            = each.value["variable_value"]
}