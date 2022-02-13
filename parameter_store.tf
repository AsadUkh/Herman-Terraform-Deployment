resource "aws_ssm_parameter" "marklogic-hostname" {
  name  = "/marklogic.hostname"
  type  = "String"
  value = "bar"
}

resource "aws_ssm_parameter" "marklogic-user" {
  name  = "/marklogic.user"
  type  = "String"
  value = "bar"
}

resource "aws_ssm_parameter" "marklogic-pass" {
  name  = "/marklogic.password"
  type  = "String"
  value = "bar"
}

resource "aws_ssm_parameter" "ca-verfiy" {
  name  = "/ca.verify"
  type  = "String"
  value = var.ca_verify
}