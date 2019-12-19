resource "aws_cloudwatch_metric_alarm" "ec2-cpu-alarm" {
  count                     = var.INSTANCE_COUNT
  alarm_name                = "aws_ec2_${element(var.SERVER_ID, count.index)}_${local.tag}_cpu_utilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization for ${element(var.SERVER_ID, count.index)} Instance"
  actions_enabled           = "true"
  alarm_actions             = [var.SNS_ARN]
  dimensions = {
    InstanceId = var.SERVER_ID
  }
}


resource "aws_cloudwatch_metric_alarm" "web-process-alert" {
  count                     = var.INSTANCE_COUNT
  alarm_name                = "aws_ec2_${element(var.SERVER_ID, count.index)}_${local.tag}_web_process_alert"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = 2
  threshold                 = 2
  metric_name               = "Web-Process"
  namespace                 = "System-Process"
  period                    = "60"
  alarm_description         = "This metric monitors web process in ec2 for ${element(var.SERVER_ID, count.index)} Instance"
  actions_enabled           = "true"
  alarm_actions             = [var.SNS_ARN]
  statistic                 = "Minimum"
}

resource "aws_cloudwatch_metric_alarm" "java-process-alert" {
  count                     = var.INSTANCE_COUNT
  alarm_name                = "aws_ec2_${element(var.SERVER_ID, count.index)}_${local.tag}_java_process_alert"
  comparison_operator       = "LessThanThreshold" 
  evaluation_periods        = 2
  threshold                 = 1
  metric_name               = "Java-Process"
  namespace                 = "System-Process"
  period                    = "60"
  alarm_description         = "This metric monitors Java process in ec2 for ${element(var.SERVER_ID, count.index)} Instance"
  actions_enabled           = "true"
  alarm_actions             = [var.SNS_ARN]
  statistic                 = "Minimum"
}
