# Automatically find the root terragrunt.hcl and inherit its
# configuration
terraform {
  source = "../../../modules/frontend"
}

include {
  path = ../../terragrunt.hcl
}

inputs = {
#  iam_role = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
}
