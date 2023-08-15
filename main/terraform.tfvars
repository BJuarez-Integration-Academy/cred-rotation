org_secrets = {
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
    }}

org_variables = {
    "one" = {
      variable_name = "MULE_VERSION"
      variable_value = "4.4.2"
    }
    "two" = {
      variable_name = "TERRAFORM_VARIABLE_NAME"
      variable_value = "TF ORG test"
    }
}

repo_secrets = {
    "one" = {
      repo_name = "greetings-app"
      secret_name = "GRANTTYPECONNECTEDAPP"
      secret_value = "VTw2lrNd4JgQpY1Y6I6302evDFEyPcHmOtBb9oYe5zGLPA2R3p1AzIqOg+80HKmZUAf2FOKL3A8M0fFzXrdP0E0M"
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

repo_variables = {} #Empty

/*repo_variables = {
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
    }*/