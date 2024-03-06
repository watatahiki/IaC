terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
      version = "3.29.0"
    }
  }
  cloud {
    organization = "XXXXX"

    workspaces {
      name = "XXXXX_prod"
    }
  }
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
  api_url = var.datadog_api_url
}
