resource "aws_s3_bucket" "marklogic-enterprise-api-elb-bucket" {
  bucket = "marklogic-enterprise-api-elb-bucket"

  tags = {
    Name        = "marklogic-enterprise-api-elb-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "marklogic-https-elb-bucket" {
  bucket = "marklogic-https-elb-bucket"

  tags = {
    Name        = "marklogic-https-elb-bucket"
    Environment = "Dev"
  }
}



data "aws_iam_policy_document" "policy-enterprise-bucket" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [data.aws_elb_service_account.default.arn]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::marklogic-enterprise-api-elb-bucket/*",

    ]
  }
}

data "aws_iam_policy_document" "https" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [data.aws_elb_service_account.default.arn]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::marklogic-https-elb-bucket/*"

    ]
  }
}

resource "aws_s3_bucket_policy" "enterprise" {
  bucket = aws_s3_bucket.marklogic-enterprise-api-elb-bucket.id
  policy = data.aws_iam_policy_document.policy-enterprise-bucket.json
}

resource "aws_s3_bucket_policy" "https" {
  bucket = aws_s3_bucket.marklogic-https-elb-bucket.id
  policy = data.aws_iam_policy_document.https.json
}

data "aws_elb_service_account" "default" {}


