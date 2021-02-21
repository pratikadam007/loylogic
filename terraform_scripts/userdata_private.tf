
data "template_file" "shell-script-private" {
  template = file("userdata_private.sh")
  vars = {
    USER = var.LINUX_USER
    PASSWORD = var.LINUX_PASSWORD
  }
}

data "template_cloudinit_config" "cloudinit-spring-private" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.shell-script-private.rendered
  }
}