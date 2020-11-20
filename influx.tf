terraform {
  required_providers {
    influxdbv2-onboarding = {
      source  = "lancey-energy-storage/influxdbv2-onboarding"
      version = "0.2.0"
    }
    influxdbv2 = {
      source  = "lancey-energy-storage/influxdbv2"
      version = "0.3.0"
    }
    docker = {
      source = "terraform-providers/docker"
    }
  }
}

# Onboarding

provider "influxdbv2-onboarding" {
  url = "http://localhost:8086"
}

resource "influxdbv2-onboarding_setup" "setup" {
    username = "joe"
    password = "changeme"
    bucket = "defaultbucket"
    org = "company"
    retention_period = 4
}

provider "influxdbv2" {
    url = "http://localhost:8086/"
    token = influxdbv2-onboarding_setup.setup.token
}

data "influxdbv2_ready" "status" {}

output "influxdbv2_is_ready" {
    value = data.influxdbv2_ready.status.output["url"]
}

resource "influxdbv2_bucket" "temp" {
    depends_on = [influxdbv2-onboarding_setup.setup]
    name = "temp"
    org_id = influxdbv2-onboarding_setup.setup.org_id
    retention_rules {
        every_seconds = "3600"
        type = "expire"

    }
    rp = "temp"
}