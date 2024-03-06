############################################################
# providers
# (Set the value to the terraform cloud environment variable)
############################################################
variable "datadog_api_key" {}
variable "datadog_app_key" {}
variable "datadog_api_url" {}

############################################################
# common
############################################################
variable "env" {
  type = string
  default = "prod"
}

variable "notice_slack_infra_channel" {
  type = string
  default = "XXXXX"
}

variable "notice_slack_url_channel" {
  type = string
  default = "XXXXX"
}

############################################################
# DB parameters
############################################################
locals {
  rds_param_list = [
    {
      dbname                      = "XXXXX"
      conn_alret                  = "50"
      conn_alret_rcy              = "39"
      conn_warn                   = "40"
      conn_warn_rcy               = "39"
      cpu_alret                   = "90"
      cpu_alret_rcy               = "79"
      cpu_warn                    = "80"
      cpu_warn_rcy                = "79"
      mem_alret                   = "268435456"
      mem_alret_rcy               = "1073741824"
      mem_warn                    = "536870912"
      mem_warn_rcy                = "1073741824"
      # select_latency_alret        = "50"
      # select_latency_alret_rcy    = "39"
      # select_latency_warn         = "40"
      # select_latency_warn_rcy     = "39"
      # dml_latency_alret           = "50"
      # dml_latency_alret_rcy       = "39"
      # dml_latency_warn            = "40"
      # dml_latency_warn_rcy        = "39"
    },
    {
      dbname                      = "XXXXX"
      conn_alret                  = "50"
      conn_alret_rcy              = "39"
      conn_warn                   = "40"
      conn_warn_rcy               = "39"
      cpu_alret                   = "90"
      cpu_alret_rcy               = "79"
      cpu_warn                    = "80"
      cpu_warn_rcy                = "79"
      mem_alret                   = "268435456"
      mem_alret_rcy               = "1073741824"
      mem_warn                    = "536870912"
      mem_warn_rcy                = "1073741824"
      # select_latency_alret        = "50"
      # select_latency_alret_rcy    = "39"
      # select_latency_warn         = "40"
      # select_latency_warn_rcy     = "39"
      # dml_latency_alret           = "50"
      # dml_latency_alret_rcy       = "39"
      # dml_latency_warn            = "40"
      # dml_latency_warn_rcy        = "39"
    }
  ]
}

############################################################
# CloudFront parameters
############################################################
locals {
  cloudfront_param_list = [
    {
      # サービス1
      distr_id                 = "XXXXX"
      # cf_4xx_error_alret       = "99"
      # cf_4xx_error_alret_rcy   = "97"
      # cf_4xx_error_warn        = "98"
      # cf_4xx_error_warn_rcy    = "97"
      cf_5xx_error_alret       = "500"
      cf_5xx_error_alret_rcy   = "10"
      cf_5xx_error_warn        = "300"
      cf_5xx_error_warn_rcy    = "10"
    },
    {
      # サービス2
      distr_id                 = "XXXXX"
      # cf_4xx_error_alret       = "99"
      # cf_4xx_error_alret_rcy   = "97"
      # cf_4xx_error_warn        = "98"
      # cf_4xx_error_warn_rcy    = "97"
      cf_5xx_error_alret       = "500"
      cf_5xx_error_alret_rcy   = "10"
      cf_5xx_error_warn        = "300"
      cf_5xx_error_warn_rcy    = "10"
    }
  ]
}

############################################################
# ELB parameters
############################################################
locals {
  elb_param_list = [
    {
      # サービス1
      elb_name                         = "XXXXX"
      elb_host_count_error_alret       = "0"
      elb_host_count_error_alret_rcy   = "1"
      elb_elb_4xx_error_alret          = "100"
      elb_elb_4xx_error_alret_rcy      = "79"
      elb_elb_4xx_error_warn           = "80"
      elb_elb_4xx_error_warn_rcy       = "79"
      elb_target_4xx_error_alret       = "1500"
      elb_target_4xx_error_alret_rcy   = "999"
      elb_target_4xx_error_warn        = "1000"
      elb_target_4xx_error_warn_rcy    = "999"
      elb_elb_5xx_error_alret          = "300"
      elb_elb_5xx_error_alret_rcy      = "249"
      elb_elb_5xx_error_warn           = "250"
      elb_elb_5xx_error_warn_rcy       = "249"
      elb_target_5xx_error_alret       = "50"
      elb_target_5xx_error_alret_rcy   = "39"
      elb_target_5xx_error_warn        = "40"
      elb_target_5xx_error_warn_rcy    = "39"
    },
    {
      # サービス2
      elb_name                         = "XXXXX"
      elb_host_count_error_alret       = "0"
      elb_host_count_error_alret_rcy   = "1"
      elb_elb_4xx_error_alret          = "100"
      elb_elb_4xx_error_alret_rcy      = "79"
      elb_elb_4xx_error_warn           = "80"
      elb_elb_4xx_error_warn_rcy       = "79"
      elb_target_4xx_error_alret       = "1500"
      elb_target_4xx_error_alret_rcy   = "999"
      elb_target_4xx_error_warn        = "1000"
      elb_target_4xx_error_warn_rcy    = "999"
      elb_elb_5xx_error_alret          = "300"
      elb_elb_5xx_error_alret_rcy      = "249"
      elb_elb_5xx_error_warn           = "250"
      elb_elb_5xx_error_warn_rcy       = "249"
      elb_target_5xx_error_alret       = "50"
      elb_target_5xx_error_alret_rcy   = "39"
      elb_target_5xx_error_warn        = "40"
      elb_target_5xx_error_warn_rcy    = "39"
    }
  ]
}

############################################################
# ECS parameters
############################################################
locals {
  ecs_param_list = [
    {
      # サービス1
      ecs_cluster_name                  = "XXXXX"
      ecs_services_alret                = "0"
      ecs_services_alret_rcy            = "1"
      ecs_services_running_alret        = "0"
      ecs_services_running_alret_rcy    = "1"
      ecs_service_name                  = "XXXXX"
      ecs_services_cpu_alret            = "90"
      ecs_services_cpu_alret_rcy        = "79"
      ecs_services_cpu_warn             = "80"
      ecs_services_cpu_warn_rcy         = "79"
      ecs_services_mem_alret            = "90"
      ecs_services_mem_alret_rcy        = "79"
      ecs_services_mem_warn             = "80"
      ecs_services_mem_warn_rcy         = "79"
    },
    {
      # サービス2
      ecs_cluster_name                  = "XXXXX"
      ecs_services_alret                = "0"
      ecs_services_alret_rcy            = "1"
      ecs_services_running_alret        = "0"
      ecs_services_running_alret_rcy    = "1"
      ecs_service_name                  = "XXXXX"
      ecs_services_cpu_alret            = "90"
      ecs_services_cpu_alret_rcy        = "79"
      ecs_services_cpu_warn             = "80"
      ecs_services_cpu_warn_rcy         = "79"
      ecs_services_mem_alret            = "90"
      ecs_services_mem_alret_rcy        = "79"
      ecs_services_mem_warn             = "80"
      ecs_services_mem_warn_rcy         = "79"
    }
  ]
}

############################################################
# Synthetics parameters
############################################################
variable basic_username              {}
variable basic_password              {}

locals {
  url_param_list = [
    {
      # サービス1
      api_test_url                      = "XXXXX"
      redirect_path                     = ""
      url_service_name                  = "XXXXX"
      assertion_statuscode              = "200"
      polling_interval                  = "300"
    },
    {
      # サービス2
      api_test_url                      = "XXXXX"
      redirect_path                     = ""
      url_service_name                  = "XXXXX"
      assertion_statuscode              = "200"
      polling_interval                  = "300"
    }
  ]
}