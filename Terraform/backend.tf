terraform {
    backend "s3" {
        bucket = "fantasyterraformstatebucket1"
        key = "state/terraform.tfstate"
        encrypt = true
    }
}