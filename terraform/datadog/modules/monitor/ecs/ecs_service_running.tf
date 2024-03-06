resource "datadog_monitor" "ecs_service_running" {
  evaluation_delay     = 0
  include_tags         = true
  message              = <<-EOT
                            <!subteam^S05QRACSKCN>
                            ### アラート内容
                            {{#is_warning}}
                            [{{clustername}}] のECS タスク数が Warning の閾値を超過しました
                            {{/is_warning}}
                            {{#is_alert}}
                            [{{clustername}}] のECS タスク数が Alert の閾値を超過しました
                            {{/is_alert}}
                            {{#is_recovery}}
                            [{{clustername}}] のECS タスク数が閾値を下回りました
                            {{/is_recovery}}

                            ### 対応
                            1. ECS タスクがストップした原因を調査する
                            2. ECS タスクを起動する

                            ### 通知先
                            ${var.notice_slack_channel}
                          EOT
  name                 = "ECS タスク数監視 (${var.ecs_cluster_name})"
  new_group_delay      = 0
  no_data_timeframe    = 0
  notify_audit         = false
  notify_by            = []
  notify_no_data       = false
  priority             = 0
  query                = "avg(last_5m):avg:aws.ecs.service.running{clustername:${var.ecs_cluster_name}} by {clustername} <= ${var.ecs_services_running_alret}"
  renotify_interval    = 20
  renotify_occurrences = 0
  require_full_window  = true
  tags = [
    "service:<service_name>"
  ]
  timeout_h = 0
  type      = "query alert"
  monitor_thresholds {
    critical          = var.ecs_services_running_alret
    critical_recovery = var.ecs_services_running_alret_rcy
  }
}