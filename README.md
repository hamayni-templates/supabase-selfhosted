# Supabase Self-Hosted — Hamayni Certified Template

[![Hamayni Certified](https://img.shields.io/badge/Hamayni-Certified%20v1.1.1-green)](https://hamayni.com)
[![Idempotency](https://img.shields.io/badge/Idempotency-Verified-blue)](https://hamayni.com)

## 📋 Overview

Deploy a complete Supabase instance on your own server with one click via the Hamayni platform.

### Services Included

| Service | Image | Version |
|---------|-------|---------|
| Studio | supabase/studio | 2024.12.18 |
| Auth (GoTrue) | supabase/gotrue | v2.164.0 |
| REST (PostgREST) | postgrest/postgrest | v12.2.3 |
| Realtime | supabase/realtime | v2.33.58 |
| Storage | supabase/storage-api | v1.11.13 |
| Meta | supabase/postgres-meta | v0.84.2 |
| Database | supabase/postgres | 15.8.1.060 |
| API Gateway | kong | 2.8.1 |

### Requirements

- **RAM**: 2 GB minimum (4 GB recommended)
- **Disk**: 10 GB minimum
- **Docker** + **Docker Compose** v2+

## 🚀 Quick Start

### Via Hamayni (Recommended)

1. Go to your Hamayni dashboard
2. Click **Deploy New** → Select **Supabase Self-Hosted**
3. Choose your server and configure variables
4. Deploy!

### Manual

```bash
cp .env.example .env
# Edit .env with your values
docker compose up -d
```

## 🔒 Security

- All sensitive values are auto-generated during deployment
- No `:latest` tags — all images use pinned, stable versions
- Health checks on all critical services
- SMTP configuration is optional but recommended for production

## 📜 Certification

- **Level**: 2 (Certified)
- **Idempotency**: ✅ Verified
- **Strict Mode**: ✅ Enabled
- **Ban Latest**: ✅ Enforced

See [CERTIFICATION.md](./CERTIFICATION.md) for full details.

## 📄 License

MIT
