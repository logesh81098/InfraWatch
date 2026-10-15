#############################################################################################################################
#                                              IAM Role
#############################################################################################################################

resource "aws_iam_role" "infrawatch-server-iam-role" {
  name = "InfraWatch-Server-Role"
  description = "IAM Role created for InfraWatch Server"
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
    Name = "InfraWatch-Server-Role"
    IAC = "Terraform"
  }
}



#############################################################################################################################
#                                               IAM Policy
#############################################################################################################################

resource "aws_iam_policy" "infrawatch-server-iam-policy" {
  name = "InfraWatch-Server-Policy"
  description = "IAM Policy created for InfraWatch Server"
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
    Name = "InfraWatch-Server-Policy"
    IAC ="Terraform"
  }
}



#############################################################################################################################
#                                           Role Policy Attachment
#############################################################################################################################

resource "aws_iam_role_policy_attachment" "infrawatch" {
  role = aws_iam_role.infrawatch-server-iam-role.id
  policy_arn = aws_iam_policy.infrawatch-server-iam-policy.arn
}


#############################################################################################################################
#                                           Instance Profile
#############################################################################################################################

resource "aws_iam_instance_profile" "infrawatch-iam-instance-profile" {
  role = aws_iam_role.infrawatch-server-iam-role.id
  name = "InfraWatch-Instance-Profile"
}

