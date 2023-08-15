variable "org_secrets"{
  type = map (object({
    secret_name = string
    secret_value = string
  }))
}

variable "repo_secrets" {
  type = map (object({
    repo_name = string
    secret_name = string
    secret_value = string
  }))
}

variable "org_variables" {
  type = map (object({
    variable_name = string
    variable_value = string
  }))
}

variable "repo_variables" {
    type = map (object({
      repo_name = string
      variable_name = string
      variable_value = string
    }))
}