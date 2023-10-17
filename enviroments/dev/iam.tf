module "createGroup_role" {
    source         = "../../base_resources/modules/iam-assume-role"
    name           = "${var.enviroment}-${var.api_core}-${var.api_endpoints_create_group}"
    tags           = var.tags
    policy_data    = data.aws_iam_policy_document.role_policy_dynamodb_createGroup.json
}

module "createGroup_policy" {
    source         = "../../base_resources/modules/iam-policy"
    name           = "${var.enviroment}-${var.api_core}-${var.api_endpoints_create_group}"
    policy         =  data.aws_iam_policy_document.policy_dynamodb_lambda_createGroup.json
    tags           = var.tags
}

module "createGroup_policy_attachement" {
    source         = "../../base_resources/modules/iam-policy-attachement"
    role_name      = module.createGroup_role.name
    policy_arn     = module.createGroup_policy.arn

}

module "createGroup_policy_attachement_policy_basic_createGroup" {
    source         = "../../base_resources/modules/iam-policy-attachement"
    role_name      = module.createGroup_role.name
    policy_arn     = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

module "parameter-ssm-createGroup-role-arn" {
  source         = "../../base_resources/modules/ssm"
  name           = "${var.enviroment}-parameter-${var.api_core}-${var.api_endpoints_create_group}-createGroup-role-arn"
  type           = "String"     
  value          =  module.createGroup_role.arn
tags             = var.tags
}
