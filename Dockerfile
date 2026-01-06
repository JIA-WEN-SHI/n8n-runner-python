# ---------- stage 1: build python runtime ----------
FROM python:3.11-alpine AS pybuilder

RUN pip install --no-cache-dir requests pandas numpy

# ---------- stage 2: n8n runner ----------
FROM n8nio/runners:2.1.5

USER root

COPY --from=pybuilder /usr/local /usr/local

COPY n8n-task-runners.json /etc/n8n-task-runners.json

USER node
