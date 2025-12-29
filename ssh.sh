#!/bin/bash
set -e
 
ANSIBLE_CTRL="ansible-control"
 
NODES=(
  kafka1 kafka2 kafka3
  connect
  schema-registry
  control-center
)
 
# Read public key once
PUB_KEY=$(docker compose exec -T $ANSIBLE_CTRL cat /root/.ssh/id_rsa.pub)
 
if [[ -z "$PUB_KEY" ]]; then
  echo "ERROR: Public key not found in ansible-control"
  exit 1
fi
 
for NODE in "${NODES[@]}"; do
  echo "Configuring SSH on $NODE..."
 
  docker compose exec -T "$NODE" bash -c "
    mkdir -p /root/.ssh &&
    chmod 700 /root/.ssh &&
    grep -qxF '$PUB_KEY' /root/.ssh/authorized_keys 2>/dev/null || echo '$PUB_KEY' >> /root/.ssh/authorized_keys &&
    chmod 600 /root/.ssh/authorized_keys &&
    mkdir -p /var/run/sshd &&
    /usr/sbin/sshd
  "
done
 
echo "Passwordless SSH configured successfully for all nodes."
