resource "aws_iam_role" "ec2-role" {
  name = "EC2-ROLE-${upper(var.tags["project_name"])}-PROJECT"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_instance_profile" "ec2-profile" {
  name = "EC2-ROLE-${upper(var.tags["project_name"])}-PROJECT"
  role = aws_iam_role.ec2-role.name
}

resource "aws_iam_role_policy" "cloudwatch-put-metrics" {
  name = "ec2-cloudwatch-put-metrics"
  role = aws_iam_role.ec2-role.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "cloudwatch:PutMetricData"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
