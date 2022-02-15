resource "null_resource" "copy_script" {

  provisioner "local-exec" {
    command = "cp build_script.sh ../"
  }
}

resource "null_resource" "docker_runner" {

  provisioner "local-exec" {
    working_dir = "../"
    command     = "bash build_script.sh ${var.ambiente} ${data.aws_caller_identity.current.account_id} ${data.aws_region.current.name}"
  }

  depends_on = [
    null_resource.copy_script
  ]
}
