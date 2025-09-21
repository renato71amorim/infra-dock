```markdown
# 🚀 Infra-Dock

Infra-Dock é uma stack Docker modular e escalável para desenvolvimento web moderno, com suporte a sistemas legados, orquestração via Docker Swarm e monitoramento integrado. Ideal para ambientes profissionais que exigem flexibilidade, segurança e visibilidade.

```
████████████████████████████████████████████████████████████████████████████████████████████████████████████████
█▄─▄▄─█─▄▄─█▄─▄█▄─▄▄─█─▄▄─█▄─▄▄─█▄─▄▄▀█─▄▄─█▄─▄▄─█▄─▄▄─█▄─▄▄▀█▄─▄█─▄▄─█▄─▄▄─█▄─▄▄▀█▄─▄▄─█▄─▄▄▀█▄─▄█▄─▄▄─█▄─▄▄▀█
██─▄█▀█─██─██─███─▄█▀█─██─██─▄█▀██─▄─▄█─██─██─▄█▀██─▄█▀██─▄─▄██─██─██─██─▄█▀██─▄─▄██─▄█▀██─▄─▄██─███─▄█▀██─▄─▄█
▀▄▄▄▄▄▀▄▄▄▄▀▄▄▄▀▄▄▄▄▄▀▄▄▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▄▄▀▄▄▄▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▄▀▄▄▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀
```

---

## 📦 Serviços

- **Frontend**: Interface web (React, Vue, etc.)
- **Backend**: API RESTful (Node.js, Django, Laravel)
- **PostgreSQL**: Banco de dados principal
- **MySQL**: Suporte a sistemas legados
- **Redis**: Cache para performance
- **Nginx**: Proxy reverso com HTTPS
- **Certbot**: Certificados SSL automáticos
- **Prometheus + Grafana**: Monitoramento e visualização
- **Docker Swarm**: Orquestração, replicação e auto-healing

---

## 🧱 Estrutura de Pastas

```plaintext
infra-dock/
├── services/                  # Contêineres isolados
│   ├── frontend/              # Interface web
│   ├── backend/               # API
│   ├── nginx/                 # Proxy reverso
│   ├── redis/                 # Cache
├── databases/                # Bancos de dados
│   ├── postgres/              # PostgreSQL
│   ├── mysql/                 # MySQL legado
├── monitoring/               # Prometheus + Grafana
├── certbot/                  # SSL automático
├── swarm/                    # Configuração de deploy
├── docs/                     # Documentação técnica
├── .env                      # Variáveis globais
└── stack.yml                 # Orquestração Swarm
```

---

## ⚙️ Como usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/seuusuario/infra-dock.git
   ```

2. Configure o `.env` com suas variáveis.

3. Inicialize o Swarm:
   ```bash
   docker swarm init
   ```

4. Faça o deploy:
   ```bash
   docker stack deploy -c stack.yml infra-dock
   ```

5. Acesse os serviços:
   - Frontend: `http://localhost`
   - Grafana: `http://localhost:3001`

---

## 📈 Monitoramento

- Métricas coletadas via Prometheus
- Dashboards e alertas configuráveis no Grafana
- Exporters incluídos:
  - `mysqld_exporter`
  - `node_exporter`
  - Métricas customizadas via `/metrics`

---

## 📚 Documentação

Toda a documentação técnica está na pasta [`docs/`](docs/), incluindo:

- `architecture.md`: Diagrama e estrutura da stack
- `setup.md`: Instruções de instalação e uso
- `services.md`: Detalhes de cada serviço
- `monitoring.md`: Métricas e alertas
- `swarm.md`: Orquestração e deploy
- `legacy-support.md`: Integração com sistemas legados

---

## 🛡️ Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

---

Infra-Dock é sua base sólida para desenvolvimento web com contêineres. Pronto para escalar, monitorar e integrar com o legado.
```