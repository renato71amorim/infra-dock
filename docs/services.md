```markdown
# 📦 Serviços — Infra-Dock

Este documento descreve os principais serviços que compõem a stack Infra-Dock, suas funções, tecnologias envolvidas e como se integram entre si.

---

## 🌐 Frontend

- **Função**: Interface web para o usuário final
- **Tecnologia**: React, Vue ou outro framework SPA
- **Porta padrão**: `3000`
- **Comunicação**: Conecta-se ao backend via HTTP
- **Monitoramento**: Métricas expostas via `/metrics` (se configurado)

---

## 🔧 Backend

- **Função**: API RESTful para lógica de negócio
- **Tecnologia**: Node.js, Django, Laravel, etc.
- **Porta padrão**: `5000`
- **Comunicação**:
  - PostgreSQL ou MySQL para persistência
  - Redis para cache
- **Monitoramento**: Métricas expostas via `/metrics`

---

## 🗄️ PostgreSQL

- **Função**: Banco de dados principal
- **Imagem**: `postgres:15`
- **Porta padrão**: `5432`
- **Scripts**: `databases/postgres/init.sql`
- **Configuração**: `databases/postgres/config.env`

---

## 🧮 MySQL

- **Função**: Suporte a sistemas legados
- **Imagem**: `mysql:8.0`
- **Porta padrão**: `3306`
- **Scripts**: `databases/mysql/init.sql`
- **Configuração**: `databases/mysql/config.env`

---

## ⚡ Redis

- **Função**: Cache de dados e sessões
- **Imagem**: `redis:latest`
- **Porta padrão**: `6379`
- **Uso típico**: Armazenamento temporário, filas, sessões

---

## 🌐 Nginx

- **Função**: Proxy reverso e roteamento
- **Imagem**: `nginx:latest`
- **Porta padrão**: `80` / `443`
- **Configuração**: `services/nginx/nginx.conf`
- **Integração**: Redireciona para frontend e backend

---

## 🔐 Certbot

- **Função**: Geração automática de certificados SSL
- **Imagem**: `certbot/certbot`
- **Execução**: Manual ou via script agendado
- **Renovação**: Automática com cron ou container agendado

---

## 📈 Prometheus

- **Função**: Coleta de métricas
- **Imagem**: `prom/prometheus`
- **Porta padrão**: `9090`
- **Configuração**: `monitoring/prometheus/prometheus.yml`
- **Targets**: Backend, frontend, bancos, exporters

---

## 📊 Grafana

- **Função**: Visualização de métricas e alertas
- **Imagem**: `grafana/grafana`
- **Porta padrão**: `3001`
- **Provisionamento**: Dashboards e datasources em `monitoring/grafana/provisioning`

---

## 🐳 Docker Swarm

- **Função**: Orquestração de serviços
- **Comandos principais**:
  - `docker swarm init`
  - `docker stack deploy -c stack.yml infra-dock`
- **Recursos**:
  - Auto-healing
  - Rolling updates
  - Secrets e configs
  - Overlay networks

---

Cada serviço é isolado em contêiner próprio, configurado para comunicação segura e eficiente dentro da rede Docker. A stack é modular, permitindo substituição ou expansão conforme necessidade do projeto.
```