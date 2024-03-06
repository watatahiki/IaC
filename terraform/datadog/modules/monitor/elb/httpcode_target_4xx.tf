resource "datadog_monitor" "elb_httpcode_target_4xx" {
  evaluation_delay     = 0
  include_tags         = true
  message              = <<-EOT
                            <!subteam^S05QRACSKCN>
                            ### アラート内容
                            {{#is_warning}}
                            [{{name}}] インスタンスによって生成された HTTP 4XX 応答コードの数が Warning の閾値を超過しました
                            {{/is_warning}}
                            {{#is_alert}}
                            [{{name}}] インスタンスによって生成された HTTP 4XX 応答コードの数が数閾値を超過しました
                            {{/is_alert}}
                            {{#is_recovery}}
                            [{{name}}] インスタンスによって生成された HTTP 4XX 応答コードの数が閾値を下回りました
                            {{/is_recovery}}

                            ### 対応
                            1. 該当URLを確認する
                            2. 不正アクセスであればblock対応を行う

                            ### 通知先
                            ${var.notice_slack_channel}
                          EOT
  name                 = "ELB HTTP 4xx コード数閾値監視 (${var.elb_name})"
  new_group_delay      = 0
  no_data_timeframe    = 0
  notify_audit         = false
  notify_by            = []
  notify_no_data       = false
  priority             = 0
  query                = "avg(last_5m):avg:aws.applicationelb.httpcode_elb_4xx{name:${var.elb_name}} by {name} > ${var.elb_target_4xx_error_alret}"
  renotify_interval    = 20
  renotify_occurrences = 0
  require_full_window  = true
  tags = [
    "service:<service_name>"
  ]
  timeout_h = 0
  type      = "query alert"
  monitor_thresholds {
    critical          = var.elb_target_4xx_error_alret
    critical_recovery = var.elb_target_4xx_error_alret_rcy
    warning           = var.elb_target_4xx_error_warn
    warning_recovery  = var.elb_target_4xx_error_warn_rcy
  }
}