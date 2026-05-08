# Homelab Infrastructure

Infrastructure as Code (IaC) homelab built with Ansible, Docker and Traefik.

## Overview

This repository contains the automation, configuration and deployment logic for a self-hosted VPS environment focused on:

- Infrastructure automation
- Reverse proxying and HTTPS
- Containerized services
- VPN access
- Personal knowledge management
- DevOps learning and experimentation

The infrastructure is designed to be:

- Reproducible
- Modular
- Versioned
- Secure-by-default
- Easy to extend

---

# Current Stack

| Component | Purpose |
|---|---|
| Ansible | Infrastructure automation |
| Docker | Container runtime |
| Traefik | Reverse proxy and HTTPS |
| Portainer | Container management UI |
| WireGuard | Secure remote access VPN |
| PostgreSQL | Database backend |
| Wallabag | Self-hosted read-it-later / tech watch |

---

# Architecture

```text
Internet
    ↓
Traefik (HTTPS)
    ↓
Docker services
    ├── Portainer
    ├── Wallabag
    ├── PostgreSQL
    └── WireGuard
```

WireGuard is used to securely access internal administration services.

---

# Repository Structure

```text
.
├── ansible.cfg
├── inventories/
│   └── vps/
│       ├── group_vars/
│       │   └── all/
│       │       ├── main.yml
│       │       └── vault.yml
│       ├── hosts.yml
│       └── hosts.example.yml
├── playbooks/
├── roles/
└── tmp/
```

---

# Features

## Infrastructure Automation

- Modular Ansible roles
- Idempotent deployments
- Environment-based inventories
- Secret management with Ansible Vault

## Networking & Security

- HTTPS via Traefik + Let's Encrypt
- VPN-only access for sensitive services
- Docker network isolation
- Reverse proxy routing

## Persistence & Backups

- PostgreSQL persistent volumes
- Automated PostgreSQL backups
- Scheduled cron jobs

---

# Security Practices

Sensitive data is intentionally excluded from Git versioning:

- Ansible Vault secrets
- SSH private keys
- Real inventories
- VPN peer configurations
- Backup files

Git exclusions are managed through `.gitignore`.

---

# Ansible Vault

Secrets are encrypted using Ansible Vault.

Example:

```bash
ansible-vault edit inventories/vps/group_vars/all/vault.yml
```

---

# Deployment

Example playbook execution:

```bash
ansible-playbook playbooks/traefik.yml
```

Global deployment example:

```bash
ansible-playbook playbooks/site.yml
```

---

# Backups

PostgreSQL backups are generated automatically using cron.

Example manual backup:

```bash
docker exec postgres pg_dump -U wallabag wallabag > backup.sql
```

---

# Planned Improvements

- Shaarli deployment
- n8n automation workflows
- Automated Wallabag → Shaarli publishing
- Monitoring stack (Prometheus/Grafana)
- Centralized logging
- CI/CD pipeline
- Docker Swarm experimentation
- Infrastructure restoration workflow

---

# Learning Goals

This homelab is also used as a practical learning platform for:

- Linux administration
- Infrastructure as Code
- Networking
- Reverse proxies
- VPNs
- Container orchestration
- Security hardening
- DevOps workflows
- GitOps principles

---

# Notes

This repository intentionally avoids storing production secrets or sensitive infrastructure details.

Infrastructure-specific secrets are managed separately through encrypted vault files.

