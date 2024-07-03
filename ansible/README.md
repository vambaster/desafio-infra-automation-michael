# Ansible Playbook

Este repositório contém um playbook Ansible para instalar e configurar o Docker em várias máquinas Linux.

## Estrutura do Projeto

Rundeck_Job/
│ └── job.yaml
Ansible_Playbook/
├── playbook.yaml
├── hosts
├── README.md
└── docker/
    ├── Dockerfile
    └── docker-compose.yml

## Instruções

### Executar o Playbook Ansible com Docker

1. Instale o Docker e Docker Compose em seu sistema.

2. Navegue até o diretório `Ansible_Playbook/docker/`:

```bash
cd Ansible_Playbook/docker/
Construa a imagem Docker:
bash
Copiar código
docker-compose build
Inicie o contêiner:
bash
Copiar código
docker-compose up -d
Execute o playbook Ansible dentro do contêiner:
bash
Copiar código
docker-compose exec ansible ansible-playbook -i hosts playbook.yaml
Descrição dos Arquivos
playbook.yaml: Playbook Ansible que instala e configura o Docker.
hosts: Arquivo de inventário com a lista de hosts.
docker/Dockerfile: Arquivo de configuração do Docker para criar a imagem.
docker/docker-compose.yml: Arquivo de configuração do Docker Compose para gerenciar o contêiner.
Notas
Certifique-se de que as máquinas provisionadas estejam acessíveis para o Ansible executar o playbook.

perl
Copiar código

### Conclusão

Com essa estrutura, você poderá usar Docker para configurar e executar o playbook Ansible no seu sistema Windows. Se precisar de mais alguma coisa, estarei aqui para ajudar!