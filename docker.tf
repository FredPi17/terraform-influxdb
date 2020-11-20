
# Create a container
resource "docker_container" "influx" {
  image = "${docker_image.influx.latest}"
  name  = "influx"
  hostname = "influx"
  ports {
      internal = 8086
      external = 8086
  }
}

resource "docker_image" "influx" {
  name = "quay.io/influxdb/influxdb:2.0.0-rc"
}