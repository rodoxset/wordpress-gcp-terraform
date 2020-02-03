terraform {
  backend "gcs" {
    bucket = "composite-set-260200-tfstate"
    credentials = "../composite-set-260200-4d0af3f52dea.json"
  }
}
