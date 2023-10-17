module "dynamodb_table_group" {
  source         = "../../base_resources/modules/dynamo-sem-gsi"
  name           = "${var.enviroment}-${var.api_core}-${var.api_endpoints_create_group}-table"
  hash_key       =  "id"
  write_capacity = 1
  read_capacity  = 1
  pk_name        = "id"
  pk_type        = "S"
  tags           = var.tags
}

module "parameter-ssm-table_name_table_group" {
  source         = "../../base_resources/modules/ssm"
  name           = "${var.enviroment}-parameter-${var.api_core}-table_name"
  type           = "String"     
  value          =  module.dynamodb_table_group.table_name
  tags           = var.tags
}