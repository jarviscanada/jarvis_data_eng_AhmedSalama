# Linux Cluster Monitoring Agent
## Introduction
This project helps the Linux Cluster Administration (LCA) team monitor hardware and resource usage across Linux servers. It gathers host details and real-time CPU/memory metrics, storing them in a PostgreSQL database for reporting and capacity planning. It uses Bash for data collection, Docker for database deployment, PostgreSQL for storage.
# Quick Start
## 1. Start a PostgreSQL instance using docker
./scripts/psql_docker.sh create

## 2. Create database tables
psql -h localhost -U postgres -d host_agent -f sql/ddl.sql

## 3. Insert hardware specifications
./scripts/host_info.sh psql_host psql_port db_name psql_user psql_password

## 4. Insert real-time usage data
./scripts/host_usage.sh psql_host psql_port db_name psql_user psql_password

## 5. Set up crontab to run host_usage.sh every minute
crontab -e
#### * * * * * bash /path/to/host_usage.sh psql_host psql_port db_name psql_user psql_password

# Implemenation
## Architecture
Each Linux host runs two monitoring scripts. All hosts send their data to a single centralized PostgreSQL database running inside Docker.
## Scripts

```text
- psql_docker.sh --> manages the PostgreSQL container
- host_info.sh   --> collects static CPU/memory/disk info
- host_usage.sh  --> collects runtime CPU and memory usage
- Cron           --> schedules usage collection every minute
- PostgreSQL     --> stores all monitoring data
```

## Database Modeling

# Test

# Deployment

# Improvements
