variable "mysql_host" {
  type        = string
  description = "mysql host passed in variable on terraform apply command"
  default     = ""
}

module "connect" {
  source = "./connect"

  host = var.mysql_host
}

output "connection_values"{
  value = module.connect.connection_values
}

resource "kubernetes_deployment" "connect-to-mysql" {
  depends_on = [
    null_resource.docker_build_and_publish
  ]
  metadata {
    name = "connect-to-mysql"
  }
  spec {
    selector {
      match_labels = {
        "app" = "connect-to-mysql"
      }
    }
    replicas = 2

    template {
      metadata {
        labels = {
          "app" = "connect-to-mysql"
        }
      }
      spec {
        container {
          name = "connect-to-mysql"
          env {
            name = "MYSQL_HOST"
            value = module.connect.connection_values.host
          }
          env {
            name = "MYSQL_USER"
            value = module.connect.connection_values.user
          }
          env {
            name = "MYSQL_PASS"
            value = module.connect.connection_values.pass
          }
          env {
            name = "MYSQL_DB"
            value = module.connect.connection_values.db
          }
          image = "vaknimusprime/node-to-mysql:v1"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

