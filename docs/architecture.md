# Arquitetura da Infra-Dock

A Infra-Dock é uma stack modular baseada em Docker e Docker Swarm, composta por múltiplos serviços isolados:

- **Frontend**: Interface web (React/Vue)
- **Backend**: API (Node.js, Django, Laravel)
- **PostgreSQL e MySQL**: Bancos de dados para sistemas modernos e legados
- **Redis**: Cache para performance
- **Nginx**: Proxy reverso com suporte a HTTPS
- **Prometheus + Grafana**: Monitoramento e visualização
- **Certbot**: Certificados SSL automáticos

Todos os serviços se comunicam por meio de uma rede Docker personalizada (`app-network`) e são orquestrados via Docker Swarm.
