# Instruções para Executar ambiênte Rundeck em Docker ou ECS

Este guia fornece passos simples para configurar e iniciar o Rundeck usando Docker Compose. Certifique-se de ter o Docker e o Docker Compose instalados em seu sistema antes de começar.

...

## Deixamos caso não queira ter todo o trabalho um script Windows para facilitar e fazer tudo automatizado para você da criação de todo o ambiênte Rundeck start_rundeck.ps1

Rode o arquivo para que você possa deixar o scrip efetuar toda a instalação.

Windows com o final .bat apenas clicar para executar

Se for no linux rodar com o final .sh:

```bash
chmod +x setup_rundeck.sh
```

```bash
./setup_rundeck.sh
```

...

## Subindo o Ambiente Rundeck com Dados de Configuração

Pegamos a pasta que veio no projeto Rundeck_Job antes da conversão e adaptação para Ansible e outra técnologia e deixamos o ambiente mais prático para uso para subir com o  ambiênte novo

Este comando iniciará o ambiente Rundeck com os arquivos de configuração `job.yaml` e `nodes.xml` pré-carregados.

Primeiro, certifique-se de que os arquivos `job.yaml` e `nodes.xml` estejam no diretório `rundeck_data/job_data` conforme a estrutura abaixo:

```bash
Minsait-Rundock
.
├── docker-compose.yml
└── rundeck_data
    └── job_data
        ├── job.yaml
        └── nodes.xml
```

## Pré-requisitos

- Docker instalado: [Instruções de Instalação Docker](https://docs.docker.com/get-docker/)
- Docker Compose instalado: [Instruções de Instalação Docker Compose](https://docs.docker.com/compose/install/)

## Passos para Execução

1. **Clone caso esteja vendo o repo no Github**

   Depois de clonar vá e abra a pasta no github ou onde achar melhor para rodar os comandos

...

2. **Abra o Terminal do VSCODE**

   Será necessário para rodarmos os comandos, Ou poderá abrir com o comando .

   ```bash
   ctrl + j

...

3. **Acesse a pasta environments/Rundeck**

   só conseguirá subir o ambiênte se estiver na pasta do arquivo

   ```bash
   cd Envs/rundeck
...

4. **Subindo o Ambiente Rundeck com Dados de Configuração**

   No projeto veio a pasta Rundeck_Job então peguei e adaptei para subir junto toda a configuração no ambiênte Rundeck e iniciará o ambiente Rundeck com os arquivos de configuração job.yaml e nodes.xml pré-carregados.

...

5. **Rodando comando pro Docker-compose iniciar o Ambiente**

   O comando é para iniciar o ambiênte Rundeck, Este comando inicia o Rundeck em segundo plano (-d para modo daemon

   ```bash
   docker-compose up -d
...

6. **Encerrando o ambiente Rundeck**

   O comando para encerrar o Rundeck

   ```bash
   docker-compose down
...
