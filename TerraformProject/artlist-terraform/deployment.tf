variable "mysql_host" {
  type        = string
  description = ""
  default     = "10.100.102.7"
}

resource "kubernetes_deployment" "connect-to-mysql" {
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
            value = var.mysql_host
          }
          env {
            name = "MYSQL_USER"
            value = "root"
          }
          env {
            name = "MYSQL_PASS"
            value = "RootPass"
          }
          env {
            name = "MYSQL_DB"
            value = "mysql"
          }
          image = "vaknimusprime/node-to-mysql:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}