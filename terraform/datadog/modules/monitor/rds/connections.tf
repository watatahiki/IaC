resource "datadog_monitor" "rds_database_connections" {
  evaluation_delay     = 0
  include_tags         = true
  message              = <<-EOT
                            <!subteam^S05QRACSKCN>
                            ### アラート内容
                            {{#is_warning}}
                            [{{dbinstanceidentifier}}] のコネクション数が Warning の閾値を超過しました
                            {{/is_warning}}
                            {{#is_alert}}
                            [{{dbinstanceidentifier}}] のコネクション数が Alert の閾値を超過しました
                            {{/is_alert}}
                            {{#is_recovery}}
                            [{{dbinstanceidentifier}}] のコネクション数が閾値を下回りました
                            {{/is_recovery}}

                            ### 対応
                            1. phpMyadmin より processlist の状態を確認し必要であれば該当のプロセスを killする
                            2. サービスが止まっている場合は Aurora の再起動する

                            ### 通知先
                            ${var.notice_slack_channel}
                          EOT
  name                 = "DB 接続数監視 (${var.dbname})"
  new_group_delay      = 0
  no_data_timeframe    = 0
  notify_audit         = false
  notify_by            = []
  notify_no_data       = false
  priority             = 0
  query                = "avg(last_5m):avg:aws.rds.database_connections{name:${var.dbname}} by {dbinstanceidentifier} > ${var.conn_alret}"
  renotify_interval    = 20
  renotify_occurrences = 0
  require_full_window  = true
  tags = [
    "service:<service_name>"
  ]
  timeout_h = 0
  type      = "query alert"
  monitor_thresholds {
    critical          = var.conn_alret
    critical_recovery = var.conn_alret_rcy
    warning           = var.conn_warn
    warning_recovery  = var.conn_warn_rcy
  }
}