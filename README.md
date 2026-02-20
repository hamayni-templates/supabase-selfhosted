# Supabase Self-Hosted — Hamayni Certified Template

> Full Supabase stack auto-hébergé avec PostgreSQL, GoTrue Auth, Storage, Kong API Gateway, Studio et Realtime.

## Quick Start

```bash
cp .env.example .env
# Edit .env with your values
docker compose up -d
```

## Services

| Service | Port | Description |
|---------|------|-------------|
| Kong API Gateway | 8000 | Main API entry point |
| Studio | 3100 | Dashboard UI |
| PostgreSQL | 5432 | Database |
| GoTrue | 9999 (internal) | Authentication |
| PostgREST | 3000 (internal) | REST API |
| Realtime | 4000 (internal) | WebSocket subscriptions |
| Storage | 5000 (internal) | File storage |
| Meta | 8080 (internal) | Database metadata |

## Health Checks

- Auth: `http://localhost:8000/auth/v1/health`
- REST: `http://localhost:8000/rest/v1/`
- Storage: `http://localhost:8000/storage/v1/`
- Studio: `http://localhost:3100`

## Hamayni Contract

This template follows the **hamayni.json v1.1.0** standard:
- ✅ Multi-service health checks (internal + external)
- ✅ Strict mode with version pinning
- ✅ `ban_latest` policy enforced
- ✅ Automatic recovery (2 rounds)
- ✅ Seed admin provisioning via GoTrue
- ✅ `ON_ERROR_STOP=1` for migrations

## Requirements

- **CPU**: 4 vCPU
- **RAM**: 8 GB
- **Disk**: 30 GB
- **Docker** + **Docker Compose**

## License

MIT
