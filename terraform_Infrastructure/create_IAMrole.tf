###--- Create Jenkins IAM Role ---###
resource "aws_iam_role" "jenkins_access_role" {
  name = var.jenkins_role

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

  tags = var.IAM_role_tags
}

###--- Attach IAM Policy to IAM Role ---###
resource "aws_iam_role_policy_attachment" "jenkins-role-policy-attachment" {
  role       = aws_iam_role.jenkins_access_role.name
  count      = length(var.jenkins_iam_policy_arns)
  policy_arn = var.jenkins_iam_policy_arns[count.index]
}

resource "aws_iam_instance_profile" "jenkins_profile" {
  name = "jenkins_lads"
  role = aws_iam_role.jenkins_access_role.name
}

###--- Create Bastion IAM Role ---###
resource "aws_iam_role" "bastion_access_role" {
  name = var.bastion_role

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
}

###--- Attach IAM Policy to IAM Role ---###
resource "aws_iam_role_policy_attachment" "bastion-role-policy-attachment" {
  role       = aws_iam_role.bastion_access_role.name
  policy_arn = var.bastion_iam_policy_arn
}

resource "aws_iam_instance_profile" "bastion_profile" {
  name = "bastion_lads"
  role = aws_iam_role.bastion_access_role.name
}








# ###--- Creates Place to Hold IAM Role in ec2 Instance ---###
# resource "aws_iam_instance_profile" "ec2_profile" {
#   name = "ec2_profile"
#   role = aws_iam_role.s3_access_role.name
# }

###--- Gives IAM Role Complete s3 Bucket Access ---###
# resource "aws_iam_role_policy" "ec2_policy" {
#   name = "ec2_policy"
#   role = aws_iam_role.s3_access_role.id
#
#   policy = <<EOFcsss
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": [
#         "s3:*"
#       ],
#       "Effect": "Allow",
#       "Resource": "*"
#     }
#   ]
# }
# EOF
# }

# ###--- Gives IAM Role Complete s3 Bucket Access ---###
# resource "aws_iam_role_policy" "jenkins_policy" {
#   name = "jenkins_policy"
#   role = aws_iam_role.s3_access_role.id
#
#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": "s3:*",
#       "Resource": "*"
#     },
#     {
#       "Effect": "Allow",
#       "Action": "ec2:*",
#       "Resource": "*"
#     },
#     {
#       "Effect": "Allow",
#       "Action": "rds:*",
#       "Resource": "*"
#     }
#   ]
# }
# EOF
# }
