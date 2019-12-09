resource "aws_cloudwatch_metric_alarm" "ec2-cpu-alarm" {
  alarm_name                = "aws_ec2_${var.SERVER_ID}_${local.tag}_cpu_utilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization for ${var.SERVER_ID} Instance"
  actions_enabled           = "true"
  alarm_actions             = [var.SNS_ARN]
  dimensions = {
    InstanceId = var.SERVER_ID
  }
}
