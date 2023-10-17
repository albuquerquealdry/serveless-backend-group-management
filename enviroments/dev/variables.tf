variable "api_core" {
  default = "backend-group"
  description = "Path da API a ser Desenvolvida"
}

variable "api_endpoints_create_group" {
  default =   "create"
}

variable "aws_region" {
  default = "us-east-1"
  description = "Região da AWS por Ambiente"
}

variable "enviroment" {
  default = "dev"
  description = "Ambiente da aplicação"
}

variable "tags" {
  default = {
    BU            = "serveless-BU"
    Environment   =  "development"
    Name          =  "backend-group-serveless-app"
    Department    = "groups"
    Owner         = "ayo"
    Workload      = "ayo_serveless"
  }
}