terraform {
  backend "gcs" {
    bucket  = "gcs-backend-19"
    prefix  = "terraform/state"
  }
}