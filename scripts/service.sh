#!/bin/bash

# start the Go server as user 'go', discarding output. It internally uses log4j
# to log to /var/log/go-server/ and manages rotation and everything.
source /etc/container_environment.sh

cat > /etc/default/go-agent <<EOF
export GO_SERVER=${GO_SERVER:-127.0.0.1}
export GO_SERVER_PORT=${GO_SERVER_PORT:-8153}
export AGENT_WORK_DIR=/var/lib/go-agent
export DAEMON=N
export VNC=N
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64/jre/
EOF

exec /sbin/setuser go /usr/share/go-agent/agent.sh > /dev/null 2>&1
