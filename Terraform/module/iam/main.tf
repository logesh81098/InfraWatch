###############################################################################################################################
#                                                    IAM Role
###############################################################################################################################

resource "aws_iam_role" "infrawatch-role" {
  name = "Infrawatch-IAM-Role"
  description = "IAM Role for InfraWatch Server"
  assume_role_policy = <<EOF
  { 
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            }
        }
    ]
  }
  EOF
  tags = {
    Name = "Infrawatch-IAM-Role"
    IAC = "Terraform"
  }
}



###############################################################################################################################
#                                              IAM Policy
###############################################################################################################################

resource "aws_iam_policy" "infrawatch-server-policy" {
  name = "InfraWatch-Server-Policy"
  description = "IAM Policy for InfraWatch Server"
  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ReadCloudWatchLogMetrics",
            "Effect": "Allow",
            "Action": [
                "cloudwatch:GetMetricData",
                "cloudwatch:GetMetricStatistics",
                "cloudwatch:ListMetrics",
                "cloudwatch:DescribeAlarms",
                "cloudwatch:DescribeAlarmHistory"
            ],
            "Resource": "*"
        },
        {
            "Sid": "DiscoverEC2Instances",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:DescribeInstances",
                "ec2:DescribeRegions",
                "ec2:DescribeTags",
                "ec2:DescribeVolumes"
            ],
            "Resource": "*"
        }
    ]
  }
  EOF
  tags = {
    Name = "InfraWatch-IAM-Policy"
    IAC = "Terraform"
  }
}


###############################################################################################################################
#                                        IAM Role Policy Attachment
###############################################################################################################################

resource "aws_iam_role_policy_attachment" "infrawatch-role" {
  role = aws_iam_role.infrawatch-role.id
  policy_arn = aws_iam_policy.infrawatch-server-policy.arn
}


###############################################################################################################################
#                                          IAM Instance Profile
###############################################################################################################################

resource "aws_iam_instance_profile" "infrawatch-server" {
  name = "InfraWatch-Server-Instance-profile"
  role = aws_iam_role.infrawatch-role.id
}