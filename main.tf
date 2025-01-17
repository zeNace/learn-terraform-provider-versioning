terraform{
  cloud {
    organization = "zenace-training"
    workspaces{
      name = "learn-terraform-provider-versioning"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id

  acl    = "public-read"
  region = "us-west-2"

  tags = {
    public_bucket = true
  }
}
