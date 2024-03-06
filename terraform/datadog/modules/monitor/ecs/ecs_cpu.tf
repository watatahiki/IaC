resource "datadog_monitor" "ecs_cpuutilization" {
  evaluation_delay     = 0
  include_tags         = true
  message              = <<-EOT
                            <!subteam^S05QRACSKCN>
                            ### アラート内容
                            {{#is_warning}}
                            [{{clustername}}] のECS サービスのCPU使用率が Warning の閾値を超過しました
                            {{/is_warning}}
                            {{#is_alert}}
                            [{{clustername}}] のECS サービスのCPU使用率が Alert の閾値を超過しました
                            {{/is_alert}}
                            {{#is_recovery}}
                            [{{clustername}}] のECS サービスのCPU使用率が閾値を下回りました
                            {{/is_recovery}}

                            ### 対応
                            1. 何が原因でCPU使用率を押し上げているか調査する

                            ### 通知先
                            ${var.notice_slack_channel}
                          EOT
  name                 = "ECS サービスCPU使用率監視 (${var.ecs_service_name})"
  new_group_delay      = 0
  no_data_timeframe    = 0
  notify_audit         = false
  notify_by            = []
  notify_no_data       = false
  priority             = 0
  query                = "avg(last_5m):avg:aws.ecs.services{servicename:${var.ecs_service_name}} by {servicename} > ${var.ecs_services_cpu_alret}"
  renotify_interval    = 20
  renotify_occurrences = 0
  require_full_window  = true
  tags = [
    "service:<service_name>"
  ]
  timeout_h = 0
  type      = "query alert"
  monitor_thresholds {
    critical          = var.ecs_services_cpu_alret
    critical_recovery = var.ecs_services_cpu_alret_rcy
    warning           = var.ecs_services_cpu_warn
    warning_recovery  = var.ecs_services_cpu_warn_rcy
  }
}