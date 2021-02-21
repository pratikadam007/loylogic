
data "template_file" "shell-script-public" {
  template = file("userdata_public.sh")
  vars = {
    USER = var.LINUX_USER
    PASSWORD = var.LINUX_PASSWORD
  }
}

data "template_cloudinit_config" "cloudinit-spring-public" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.shell-script-public.rendered
  }
}