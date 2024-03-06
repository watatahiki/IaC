resource "datadog_synthetics_test" "url_check" {
  name      = "${var.api_test_url} (${var.url_service_name} : ${var.env})"
  type      = "api"
  subtype   = "http"
  status    = "live"
  locations = ["aws:ap-northeast-1"]

  request_definition {
    method = "GET"
    url    = "https://${var.api_test_url}${var.redirect_path}"
  }

  request_basicauth  {
    username = "${var.basic_username}"
    password = "${var.basic_password}"
  }

  assertion {
    type     = "statusCode"
    operator = "is"
    target   = "${var.assertion_statuscode}"
  }

  message              = <<-EOT
                            <!subteam^S05QRACSKCN>
                            ### アラート内容
                            ${var.api_test_url} が正常に稼働していない可能性があります

                            ### 対応
                            1. ECS/RDS/ELB などの各種AWSサービスに問題がないか確認する

                            ### 通知先
                            ${var.notice_slack_channel}
                          EOT

  options_list {
    tick_every = var.polling_interval
    monitor_name = "${var.url_service_name} : ${var.env}"
    retry {
      count    = 2
      interval = 300
    }
    monitor_options {
      renotify_interval = 120
    }
  }
}