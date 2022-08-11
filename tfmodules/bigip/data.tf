data "template_file" "as3_declaration_file" {
  template = file("./modules/bigip/as3_template.json")
  vars = {
    "webserver_pool_members" = jsonencode(var.webserver_pool_nodes)
  }
}

data "aws_cloudformation_stack" "bigip_a_mgmt_ip" {
  name = "networking-stack"
}

data "aws_secretsmanager_secret_version" "bigip_pw_secret_current_version" {
  secret_id = var.bigip_pw_arn
}