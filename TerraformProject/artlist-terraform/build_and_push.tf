resource null_resource "docker_build_and_publish" {
  triggers = {
    policy_sha1 = sha1(file("app.js"))
  }
  provisioner "local-exec" {
      command     = <<EOT

docker build . -t vaknimusprime/node-to-mysql:v1
docker push vaknimusprime/node-to-mysql:v1
EOT
    interpreter = ["bash", "-c"]
  }
}
