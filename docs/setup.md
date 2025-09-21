```markdown
# ⚙️ Setup Inicial — Infra-Dock

Este guia descreve como configurar e iniciar o projeto Infra-Dock em sua máquina local usando Docker Swarm.

---

## 📁 Pré-requisitos

- Docker instalado
- Docker Compose (v2 ou superior)
- Git
- Acesso à internet para baixar imagens

---

## 🧱 Estrutura inicial

Clone o repositório e gere a estrutura de pastas e arquivos:

```bash
git clone https://github.com/seuusuario/infra-dock.git
cd infra-dock
bash primeiro_envio_github.sh
```

---

## 🔐 Configuração de variáveis

Edite o arquivo `.env` com suas credenciais e configurações:

```env
# Banco PostgreSQL
POSTGRES_USER=admin
POSTGRES_PASSWORD=adminpass
POSTGRES_DB=appdb

# Banco MySQL
MYSQL_USER=legacyuser
MYSQL_PASSWORD=legacypass
MYSQL_DATABASE=legacydb
MYSQL_ROOT_PASSWORD=rootpass

# Backend
API_PORT=5000

# Frontend
FRONTEND_PORT=3000
```

---

## 🐳 Inicializar Docker Swarm

```bash
docker swarm init
```

Se estiver em cluster, copie o token gerado para adicionar outros nós.

---

## 🚀 Deploy da stack

```bash
docker stack deploy -c stack.yml infra-dock
```

Isso criará todos os serviços definidos, incluindo frontend, backend, bancos, cache, proxy, monitoramento e certificados.

---

## 🔍 Acesso aos serviços

- Frontend: `http://localhost`
- Backend: `http://localhost:5000`
- Grafana: `http://localhost:3001`
- Prometheus: `http://localhost:9090`

---

## 📈 Monitoramento

- Acesse o Grafana e configure a fonte de dados Prometheus (`http://prometheus:9090`)
- Importe dashboards prontos ou use os da pasta `monitoring/grafana/provisioning`

---

## 🔄 Atualizações

Para atualizar a stack:

```bash
docker stack deploy -c stack.yml infra-dock
```

Para escalar serviços:

```bash
docker service scale infra-dock_backend=3
```

---

## 🧹 Limpeza

Para remover a stack:

```bash
docker stack rm infra-dock
```

Para resetar o Swarm:

```bash
docker swarm leave --force
```

---

Infra-Dock está pronto para escalar, monitorar e integrar com sistemas modernos e legados. Consulte os demais arquivos em `docs/` para detalhes técnicos e operacionais.
```