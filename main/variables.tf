variable "org_secrets"{
  type = map (object({
    secret_name = string
    secret_value = string
  }))
  default = {
    "one" = {
      secret_name = "ENV_NAME"
      secret_value = "9KF+l0jU8Y/KnvpdKK/x5TCIapASDt25MD0gHmxF6m5plGl8AysN5UCOjKz4Sl0Rmvso"
    }
    "two" = {
      secret_name = "BRANCH_NAME"
      secret_value = "OfBnUBdqMFOBEwnOXlGvxP6yCDI4AdrtP+zs37DEtxl/ITeFhtlDuWW7CrazDJLoQFEM"
    }
    "three" = {
      secret_name = "MVN_VERSION"
      secret_value = "OfBnUBdqMFOBEwnOXlGvxP6yCDI4AdrtP+zs37DEtxl/ITeFhtlDuWW7CrazDJLoQFEM"
    }
  }
}

variable "repo_secrets" {
  type = map (object({
    repo_name = string
    secret_name = string
    secret_value = string
  }))
  default = {
    "one" = {
      repo_name = "greetings-app"
      secret_name = "GRANTTYPECONNECTEDAPP"
      secret_value = "zuCnmyhZFJXgAQtRHU/k1YFlsoxxm3Ozbsb79PkNfkiwswMt1npZxQf22RxZIDVPXQ0nGdLt2CPGObGOgzrYsA9p/8ZeiMDJYbZae3Y6pec="
    }
    "two" = {
      repo_name = "greetings-app"
      secret_name = "REPO_SECRET_1"
      secret_value = "bmGxFxjD24tzh/xeZoJw8MGKjFxpZnst48hQsEe9nEG3EEmMloA667f2MHfPsWFzR8Tw"
    }
    "three" = {
      repo_name = "upsert-git-secrets-and-vars"
      secret_name = "REPO_SECRET"
      secret_value = "bmGxFxjD24tzh/xeZoJw8MGKjFxpZnst48hQsEe9nEG3EEmMloA667f2MHfPsWFzR8Tw"
    }
  }
}

variable "org_variables" {
  type = map (object({
    variable_name = string
    variable_value = string
  }))
  default = {
    "one" = {
      variable_name = "MULE_VERSION"
      variable_value = "4.4.2"
    }
    "two" = {
      variable_name = "TERRAFORM_VARIABLE_NAME"
      variable_value = "TF ORG test"
    }
  }
  
}

variable "repo_variables" {
    type = map (object({
      repo_name = string
      variable_name = string
      variable_value = string
    }))
    default = {
      "one" = {
        repo_name = "greetings-app"
        variable_name = "MAVEN_VERSION"
        variable_value = "3.7.0"
      }
      "two" = {
        repo_name = "upsert-git-secrets-and-vars"
        variable_name = "KEY"
        variable_value = "132465789"
      }
    }
}