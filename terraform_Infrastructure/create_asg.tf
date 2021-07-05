resource "aws_launch_configuration" "asg_first_launch_conf" {
  image_id        = var.ec2_image
  instance_type   = var.ec2_type
  security_groups = [aws_security_group.thelads.id, aws_security_group.theladsDB.id, aws_security_group.theladsPC.id]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "lads_asg" {
  name                      = var.lads_asg
  vpc_zone_identifier       = [aws_subnet.public[0].id, aws_subnet.public[1].id]
  health_check_grace_period = 300
  health_check_type         = "EC2"
  load_balancers            = [aws_elb.lb.id]
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = aws_launch_configuration.asg_first_launch_conf.name
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "agents-scale-up" {
  name                   = "agents-scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.lads_asg.name
}

resource "aws_autoscaling_policy" "agents-scale-down" {
  name                   = "agents-scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.lads_asg.name
}

resource "aws_cloudwatch_metric_alarm" "memory-high" {
  alarm_name          = "mem-util-high-agents"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors ec2 memory for high utilization on agent hosts"
  alarm_actions = [
    aws_autoscaling_policy.agents-scale-up.arn
  ]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.lads_asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "memory-low" {
  alarm_name          = "mem-util-low-agents"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "40"
  alarm_description   = "This metric monitors ec2 memory for low utilization on agent hosts"
  alarm_actions = [
    aws_autoscaling_policy.agents-scale-down.arn
  ]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.lads_asg.name
  }
}

resource "aws_autoscaling_schedule" "asg_sched_start" {
  scheduled_action_name  = "start autoscaling"
  min_size               = 1
  max_size               = 3
  desired_capacity       = 1
  recurrence             = "50 8 * * *"
  autoscaling_group_name = aws_autoscaling_group.lads_asg.name
}

resource "aws_autoscaling_schedule" "asg_sched_kill" {
  scheduled_action_name  = "kill autoscaling"
  min_size               = 0
  max_size               = 0
  desired_capacity       = 0
  recurrence             = "10 18 * * *"
  autoscaling_group_name = aws_autoscaling_group.lads_asg.name
}
