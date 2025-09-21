# Monitoramento com Prometheus e Grafana

- **Prometheus** coleta métricas dos serviços e do Swarm
- **Grafana** exibe dashboards com alertas configuráveis
- Exporters usados:
  - `mysqld_exporter` para MySQL
  - `node_exporter` para host
  - Métricas customizadas no backend via `/metrics`
