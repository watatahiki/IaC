resource "datadog_monitor" "cloudfront_5xx_error_rate" {
  evaluation_delay     = 0
  include_tags         = true
  message              = <<-EOT
                            <!subteam^S05QRACSKCN>
                            ### アラート内容
                            {{#is_warning}}
                            [{{distributionid}}] のHTTPステータスコード 5xx レート割合が Warning の閾値を超過しました
                            {{/is_warning}}
                            {{#is_alert}}
                            [{{distributionid}}] のHTTPステータスコード 5xx レート割合の閾値を超過しました
                            {{/is_alert}}
                            {{#is_recovery}}
                            [{{distributionid}}] のHTTPステータスコード 5xx レート割合が閾値を下回りました
                            {{/is_recovery}}

                            ### 対応
                            1. エラー内容を確認後、概要箇所の対応を行う

                            ### 通知先
                            ${var.notice_slack_channel}
                          EOT
  name                 = "CloudFront HTTP 5xx レート監視 (${var.distr_id})"
  new_group_delay      = 0
  no_data_timeframe    = 0
  notify_audit         = false
  notify_by            = []
  notify_no_data       = false
  priority             = 0
  query                = "avg(last_5m):avg:aws.cloudfront.5xx_error_rate{distributionid:${var.distr_id}} by {distributionid} > ${var.cf_5xx_error_alret}"
  renotify_interval    = 20
  renotify_occurrences = 0
  require_full_window  = true
  tags = [
    "service:<service_name>"
  ]
  timeout_h = 0
  type      = "query alert"
  monitor_thresholds {
    critical          = var.cf_5xx_error_alret
    critical_recovery = var.cf_5xx_error_alret_rcy
    warning           = var.cf_5xx_error_warn
    warning_recovery  = var.cf_5xx_error_warn_rcy
  }
}