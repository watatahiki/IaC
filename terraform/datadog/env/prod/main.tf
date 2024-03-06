module "rds" {
  source  = "../../modules/monitor/rds"
  
  notice_slack_channel = var.notice_slack_infra_channel
  rds_param_list = local.rds_param_list
  
  for_each = { for i in local.rds_param_list : i.dbname => i }
  dbname                      = each.value.dbname
  conn_alret                  = each.value.conn_alret
  conn_alret_rcy              = each.value.conn_alret_rcy
  conn_warn                   = each.value.conn_warn
  conn_warn_rcy               = each.value.conn_warn_rcy
  cpu_alret                   = each.value.cpu_alret
  cpu_alret_rcy               = each.value.cpu_alret_rcy
  cpu_warn                    = each.value.cpu_warn
  cpu_warn_rcy                = each.value.cpu_warn_rcy
  mem_alret                   = each.value.mem_alret
  mem_alret_rcy               = each.value.mem_alret_rcy
  mem_warn                    = each.value.mem_warn
  mem_warn_rcy                = each.value.mem_warn_rcy
  # select_latency_alret        = each.value.select_latency_alret
  # select_latency_alret_rcy    = each.value.select_latency_alret_rcy
  # select_latency_warn         = each.value.select_latency_warn
  # select_latency_warn_rcy     = each.value.select_latency_warn_rcy
  # dml_latency_alret           = each.value.dml_latency_alret
  # dml_latency_alret_rcy       = each.value.dml_latency_alret_rcy
  # dml_latency_warn            = each.value.dml_latency_warn
  # dml_latency_warn_rcy        = each.value.dml_latency_warn_rcy
}

module "cloudfront" {
  source  = "../../modules/monitor/cloudfront"
  
  notice_slack_channel = var.notice_slack_infra_channel
  cloudfront_param_list = local.cloudfront_param_list
  
  for_each = { for i in local.cloudfront_param_list : i.distr_id => i }
  distr_id                    = each.value.distr_id
  # cf_4xx_error_alret          = each.value.cf_4xx_error_alret
  # cf_4xx_error_alret_rcy      = each.value.cf_4xx_error_alret_rcy
  # cf_4xx_error_warn           = each.value.cf_4xx_error_warn
  # cf_4xx_error_warn_rcy       = each.value.cf_4xx_error_warn_rcy
  cf_5xx_error_alret          = each.value.cf_5xx_error_alret
  cf_5xx_error_alret_rcy      = each.value.cf_5xx_error_alret_rcy
  cf_5xx_error_warn           = each.value.cf_5xx_error_warn
  cf_5xx_error_warn_rcy       = each.value.cf_5xx_error_warn_rcy
}

module "elb" {
  source  = "../../modules/monitor/elb"
  
  notice_slack_channel = var.notice_slack_infra_channel
  elb_param_list = local.elb_param_list
  
  for_each = { for i in local.elb_param_list : i.elb_name => i }
  elb_name                            = each.value.elb_name
  elb_host_count_error_alret          = each.value.elb_host_count_error_alret
  elb_host_count_error_alret_rcy      = each.value.elb_host_count_error_alret_rcy
  elb_elb_4xx_error_alret             = each.value.elb_elb_4xx_error_alret
  elb_elb_4xx_error_alret_rcy         = each.value.elb_elb_4xx_error_alret_rcy
  elb_elb_4xx_error_warn              = each.value.elb_elb_4xx_error_warn
  elb_elb_4xx_error_warn_rcy          = each.value.elb_elb_4xx_error_warn_rcy
  elb_target_4xx_error_alret          = each.value.elb_target_4xx_error_alret
  elb_target_4xx_error_alret_rcy      = each.value.elb_target_4xx_error_alret_rcy
  elb_target_4xx_error_warn           = each.value.elb_target_4xx_error_warn
  elb_target_4xx_error_warn_rcy       = each.value.elb_target_4xx_error_warn_rcy
  elb_elb_5xx_error_alret             = each.value.elb_elb_5xx_error_alret
  elb_elb_5xx_error_alret_rcy         = each.value.elb_elb_5xx_error_alret_rcy
  elb_elb_5xx_error_warn              = each.value.elb_elb_5xx_error_warn
  elb_elb_5xx_error_warn_rcy          = each.value.elb_elb_5xx_error_warn_rcy
  elb_target_5xx_error_alret          = each.value.elb_target_5xx_error_alret
  elb_target_5xx_error_alret_rcy      = each.value.elb_target_5xx_error_alret_rcy
  elb_target_5xx_error_warn           = each.value.elb_target_5xx_error_warn
  elb_target_5xx_error_warn_rcy       = each.value.elb_target_5xx_error_warn_rcy
}

module "ecs" {
  source  = "../../modules/monitor/ecs"
  
  notice_slack_channel = var.notice_slack_infra_channel
  ecs_param_list = local.ecs_param_list
  
  for_each = { for i in local.ecs_param_list : i.ecs_cluster_name => i }
  ecs_cluster_name                     = each.value.ecs_cluster_name
  ecs_services_alret                   = each.value.ecs_services_alret
  ecs_services_alret_rcy               = each.value.ecs_services_alret_rcy
  ecs_services_running_alret           = each.value.ecs_services_running_alret
  ecs_services_running_alret_rcy       = each.value.ecs_services_running_alret_rcy
  ecs_service_name                     = each.value.ecs_service_name
  ecs_services_cpu_alret               = each.value.ecs_services_cpu_alret
  ecs_services_cpu_alret_rcy           = each.value.ecs_services_cpu_alret_rcy
  ecs_services_cpu_warn                = each.value.ecs_services_cpu_warn
  ecs_services_cpu_warn_rcy            = each.value.ecs_services_cpu_warn_rcy
  ecs_services_mem_alret               = each.value.ecs_services_mem_alret
  ecs_services_mem_alret_rcy           = each.value.ecs_services_mem_alret_rcy
  ecs_services_mem_warn                = each.value.ecs_services_mem_warn
  ecs_services_mem_warn_rcy            = each.value.ecs_services_mem_warn_rcy
}

module "url" {
  source  = "../../modules/synthetics"
  
  notice_slack_channel = var.notice_slack_url_channel
  env = var.env

  basic_username = var.basic_username
  basic_password = var.basic_password

  url_param_list = local.url_param_list

  for_each = { for i in local.url_param_list : i.api_test_url => i }
  api_test_url                         = each.value.api_test_url
  redirect_path                        = each.value.redirect_path
  url_service_name                     = each.value.url_service_name
  assertion_statuscode                 = each.value.assertion_statuscode
  polling_interval                     = each.value.polling_interval
}