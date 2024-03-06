# resource "datadog_monitor" "rds_dml_latency" {
#   evaluation_delay     = 0
#   include_tags         = true
#   message              = <<-EOT
#                             <!subteam^S05QRACSKCN>
#                             ### アラート内容
#                             {{#is_warning}}
#                             [{{dbinstanceidentifier}}] の DML レイテンシーが Warning の閾値を超過しました
#                             {{/is_warning}}
#                             {{#is_alert}}
#                             [{{dbinstanceidentifier}}] の DML レイテンシーが Alert の閾値を超過しました
#                             {{/is_alert}}
#                             {{#is_recovery}}
#                             [{{dbinstanceidentifier}}] の DML レイテンシーが閾値を下回りました
#                             {{/is_recovery}}
# 
#                             ### 対応
#                             1. データベースの再起動を行う
# 
#                             ### 通知先
#                             ${var.notice_slack_channel}
#                           EOT
#   name                 = "DB DML レイテンシー監視 (${var.dbname})"
#   new_group_delay      = 0
#   no_data_timeframe    = 0
#   notify_audit         = false
#   notify_by            = []
#   notify_no_data       = false
#   priority             = 0
#   query                = "avg(last_5m):avg:aws.rds.select_latency{name:${var.dbname}} by {dbinstanceidentifier} > ${var.dml_latency_alret}"
#   renotify_interval    = 20
#   renotify_occurrences = 0
#   require_full_window  = true
#   tags = [
#     "service:<service_name>"
#   ]
#   timeout_h = 0
#   type      = "query alert"
#   monitor_thresholds {
#     critical          = var.dml_latency_alret
#     critical_recovery = var.dml_latency_alret_rcy
#     warning           = var.dml_latency_warn
#     warning_recovery  = var.dml_latency_warn_rcy
#   }
# }