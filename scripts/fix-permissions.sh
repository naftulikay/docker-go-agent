#!/bin/bash

# this script sets ownership of the library and log directories
# to the go user so that it is readable and modifiable by the Go agent.
chown -R go:go /etc/default/go-agent /var/lib/go-agent /var/log/go-agent/
