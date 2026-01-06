FROM n8nio/runners:2.1.5

USER root

RUN apt-get update 
 && apt-get install -y python3 python3-pip python3-venv 
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir requests pandas numpy

COPY n8n-task-runners.json /etc/n8n-task-runners.json

USER node
