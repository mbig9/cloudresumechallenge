locals {
  # Parse the file path we're in to read the env name: e.g., env 
  # will be "dev" in the dev folder, "stage" in the stage folder, 
  # etc.
  parsed = regex(".*/env/(?P<env>.*?)/.*", get_terragrunt_dir())
  env    = local.parsed.env
}

#Configure S3 as a backend
remote_state {
  backend = "s3"
  config = {
    bucket = "cloudresumechallenge-state-${local.env}"
    region = "us-east-1"
    key    = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "cloudresumechallenge-lock-table-${local.env}"
}
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
