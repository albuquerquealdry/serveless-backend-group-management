# Infraestrutura como Código (IaC) com Terraform e Serverless Framework

Este repositório demonstra um exemplo de como criar uma infraestrutura como código (IaC) híbrida usando o Terraform e o Serverless Framework. Combinando essas duas ferramentas, você pode provisionar recursos em nuvens públicas, como a AWS, e implantar aplicativos serverless de maneira eficiente e escalável.

## Pré-requisitos

Antes de começar, certifique-se de que você tenha as seguintes ferramentas instaladas:

- [Terraform](https://www.terraform.io/)
- [Serverless Framework](https://www.serverless.com/)
- Conta AWS com credenciais configuradas

## Estrutura do Projeto

O projeto é organizado da seguinte maneira:

```
├── infra/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── serverless/
│   ├── serverless.yml
│   ├── handler.js
│   ├── package.json
├── README.md
```

- A pasta `infra/` contém os arquivos do Terraform para criar a infraestrutura necessária na AWS.
- A pasta `serverless/` contém os arquivos do Serverless Framework para implantar um serviço serverless na AWS.

## Instruções de Uso

Siga estas etapas para provisionar a infraestrutura e implantar o serviço serverless:

1. Clone este repositório:

   ```bash
   git clone https://github.com/seu-usuario/exemplo-iac-hibrido-terraform-serverless.git
   ```

2. Navegue para a pasta `infra/` e inicialize o Terraform:

   ```bash
   cd infra/
   terraform init
   ```

3. Personalize as configurações no arquivo `variables.tf` de acordo com suas necessidades.

4. Execute o plano do Terraform para revisar as mudanças planejadas:

   ```bash
   terraform plan
   ```

5. Se estiver satisfeito com o plano, aplique as mudanças para criar a infraestrutura:

   ```bash
   terraform apply
   ```

6. Navegue para a pasta `serverless/` e implante o serviço serverless usando o Serverless Framework:

   ```bash
   cd ../serverless/
   serverless deploy
   ```

7. Após a implantação, você receberá uma URL para acessar seu serviço serverless.

## Contribuição

Este exemplo é um projeto de código aberto e qualquer contribuição é bem-vinda. Sinta-se à vontade para criar issues, enviar solicitações de pull ou propor melhorias.

## Autor

Este exemplo foi desenvolvido por [Albuquerque Aldry](https://github.com/albuquerquealdry), também conhecido como "kidboo da FANA".

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).

---

Esperamos que este exemplo de infraestrutura como código híbrida com Terraform e Serverless Framework seja útil para você. Se tiver alguma dúvida ou precisar de assistência, sinta-se à vontade para entrar em contato. Aproveite a automação e a escalabilidade oferecidas por essa combinação de ferramentas!
