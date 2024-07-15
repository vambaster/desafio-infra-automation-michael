# Terraform Configuration

## Objetivo

Este código Terraform foi criado para provisionar 10 máquinas na AWS que serão usadas para instalar e configurar Docker.

## Como Executar

1. **Pré-requisitos**:
   - Tenha o Terraform instalado.
   - Configure suas credenciais AWS.

2. **Executando o Terraform**:
   - Inicialize o Terraform:
     ```bash
     terraform init
     ```
   - Aplique a configuração:
     ```bash
     terraform apply
     ```

## Estrutura do Projeto

- `main.tf`: Arquivo principal que define a infraestrutura.
- `variables.tf`: Define as variáveis usadas na configuração.
- `outputs.tf`: Define os outputs da configuração.

## Detalhes dos Arquivos

- **`main.tf`**:
  - Configura o provedor AWS e define os recursos de instância EC2.
  - Usa um provisioner `user_data` para instalar e configurar Docker nas instâncias EC2.
  - Define a conexão SSH usando a chave privada especificada.

- **`variables.tf`**:
  - Define variáveis como `region`, `ami`, `instance_type`, `key_name`, e `private_key_path`.

- **`outputs.tf`**:
  - Captura os endereços IP das instâncias EC2 criadas.

