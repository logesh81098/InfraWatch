###############################################################################################################################
#                                           IAM Role
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
