resource "datadog_monitor" "elb_host_count" {
  evaluation_delay     = 0
  include_tags         = true
  message              = <<-EOT
                            <!subteam^S05QRACSKCN>
                            ### アラート内容
                            {{#is_alert}}
                            [{{name}}] の正常ホスト数監視の閾値を超過しました
                            {{/is_alert}}
                            {{#is_recovery}}
                            [{{name}}] の正常ホスト数監視が閾値を下回りました
                            {{/is_recovery}}

                            ### 対応
                            1. ELB の状態を確認する
                            2. 新規作成などの復旧を試みる

                            ### 通知先
                            ${var.notice_slack_channel}
                          EOT
  name                 = "ELB 正常ホスト数監視 (${var.elb_name})"
  new_group_delay      = 0
  no_data_timeframe    = 0
  notify_audit         = false
  notify_by            = []
  notify_no_data       = false
  priority             = 0
  query                = "avg(last_5m):avg:aws.applicationelb.healthy_host_count{name:${var.elb_name}} by {name} <= ${var.elb_host_count_error_alret}"
  renotify_interval    = 20
  renotify_occurrences = 0
  require_full_window  = true
  tags = [
    "service:<service_name>"
  ]
  timeout_h = 0
  type      = "query alert"
  monitor_thresholds {
    critical          = var.elb_host_count_error_alret
    critical_recovery = var.elb_host_count_error_alret_rcy
  }
}