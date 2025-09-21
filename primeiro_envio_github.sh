#!/bin/bash

# Configuração global do Git
git config --global user.name "Renato Amorim"
git config --global user.email "contato@renatoamorim.com"

# Mostra a chave pública SSH
echo "Chave pública SSH:"
cat ~/.ssh/id_ed25519.pub

# Testa conexão SSH com GitHub
echo "Testando conexão SSH com GitHub..."
ssh -T git@github.com

# Cria estrutura do projeto e faz o primeiro envio via SSH
mkdir -p frontend/src \
         backend/app \
         database \
         mysql \
         redis \
         nginx \
         certbot \
         monitoring/prometheus \
         monitoring/grafana/provisioning/dashboards \
         monitoring/grafana/provisioning/datasources \
&& touch .env \
         README.md \
         stack.yml \
         frontend/Dockerfile \
         backend/Dockerfile \
         database/init.sql \
         mysql/init.sql \
         nginx/nginx.conf \
         monitoring/prometheus/prometheus.yml

# Verifica se o comando ssh foi bem-sucedido
if [ $? -eq 1 ] || [ $? -eq 0 ]; then
    # 1 = Authenticated but no shell access (mensagem "Hi ...! You've successfully authenticated")
    # 0 = OK (pode aparecer em alguns sistemas)
    echo "Conexão SSH com GitHub OK. Continuando..."

    # Caminho do projeto
    NOME="infra-dock"
    PROJETO="/home/renato/Projetos/$NOME"
    REPO_SSH="git@github.com:renato71amorim/$NOME.git"

    echo "Removendo .git antigo se existir..."
    rm -rf "$PROJETO/.git"

    echo "Entrando no diretório do projeto..."
    cd "$PROJETO" || { echo "Diretório não encontrado!"; exit 1; }

    echo "Inicializando novo repositório git..."
    git init

    echo "Adicionando repositório remoto (SSH)..."
    git remote add origin "$REPO_SSH"

    echo "Adicionando todos os arquivos..."
    git add .

    echo "Criando primeiro commit..."
    git commit -m "Primeiro commit: estrutura inicial do projeto"

    echo "Renomeando branch principal para main..."
    git branch -M main

    echo "Enviando arquivos para o GitHub via SSH..."
    git push -u origin main

    echo "Processo concluído!"
else
    echo "Falha na conexão SSH com GitHub. Verifique sua chave ou configuração."
    exit 1
fi
