provider "aws" {
  profile = "phpnw17"
  region  = "${var.aws_region}"
  version = "~> 1.0"
}

provider "dnsimple" {
  account = "75963"
}
