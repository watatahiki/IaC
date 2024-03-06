terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
      version = "3.29.0"
    }
  }
  cloud {
    organization = "XXXXX"
  }
}
