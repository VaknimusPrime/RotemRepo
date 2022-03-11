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
          image = "node-to-mysql:first"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}