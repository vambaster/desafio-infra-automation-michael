@echo off

REM Verifica se o Docker está instalado
docker --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Docker não está instalado. Instalando Docker...
    REM Coloque aqui o comando de instalação do Docker no Windows
    REM Exemplo: baixe e execute o instalador do Docker Desktop
    REM Exemplo: https://hub.docker.com/editions/community/docker-ce-desktop-windows/
    REM Substitua o comando acima pelo procedimento real de instalação
)

REM Verifica se o Docker está em execução
docker info > nul 2>&1
if %errorlevel% neq 0 (
    echo Docker não está em execução. Iniciando Docker...
    REM Coloque aqui o comando para iniciar o Docker no Windows
    REM Exemplo: Inicie o Docker Desktop
    REM Substitua o comando acima pelo procedimento real para iniciar o Docker
)

REM Verifica se o Docker Compose está instalado
docker-compose --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Docker Compose não está instalado. Instalando Docker Compose...
    REM Coloque aqui o comando de instalação do Docker Compose no Windows
    REM Exemplo: baixe e instale o Docker Compose
    REM Exemplo: https://docs.docker.com/compose/install/
    REM Substitua o comando acima pelo procedimento real de instalação
)

REM Roda o docker-compose.yml se todas as verificações passarem
if exist docker-compose.yml (
    echo Rodando Docker Compose...
    docker-compose up -d
) else (
    echo Arquivo docker-compose.yml não encontrado.
)

REM Mensagem de conclusão
echo Ambiente Rundeck pronto para utilização.
pause > nul