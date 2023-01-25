resource "aws_iam_role_policy" "EC2S3policy1" {
  name = "EC2S3policy1"
  role = aws_iam_role.EC2S3TF1.id


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
            "Sid": "Statement1",
            "Effect": "Allow",
        Action = [
                "ec2-instance-connect:SendSerialConsoleSSHPublicKey",
                "ec2-instance-connect:SendSSHPublicKey",
                "autoscaling:ExecutePolicy",
                "s3:CreateBucket",
                "s3:DeleteBucket"
        ]
        "Resource": [
                "*"
            ]
      }
    ]
  })
}

resource "aws_iam_role" "EC2S3TF1" {
  name = "EC2S3TF1"
  #input=file("$ec2policy.module"}/input.json)
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {

        "Effect": "Allow"
        "Principal": {
          "Service": "ec2.amazonaws.com"
        }
        "Action": "sts:AssumeRole"
      }

    ]
  })
}