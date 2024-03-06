############################################################
# common
############################################################
variable notice_slack_channel {}

############################################################
# ELB parameters
############################################################
variable elb_param_list                         {}
variable elb_name                               {}
variable elb_host_count_error_alret             {}
variable elb_host_count_error_alret_rcy         {}
variable elb_elb_4xx_error_alret                {}
variable elb_elb_4xx_error_alret_rcy            {}
variable elb_elb_4xx_error_warn                 {}
variable elb_elb_4xx_error_warn_rcy             {}
variable elb_target_4xx_error_alret             {}
variable elb_target_4xx_error_alret_rcy         {}
variable elb_target_4xx_error_warn              {}
variable elb_target_4xx_error_warn_rcy          {}
variable elb_elb_5xx_error_alret                {}
variable elb_elb_5xx_error_alret_rcy            {}
variable elb_elb_5xx_error_warn                 {}
variable elb_elb_5xx_error_warn_rcy             {}
variable elb_target_5xx_error_alret             {}
variable elb_target_5xx_error_alret_rcy         {}
variable elb_target_5xx_error_warn              {}
variable elb_target_5xx_error_warn_rcy          {}