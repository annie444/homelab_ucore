#!/bin/bash

set -ouex pipefail

{ export PS4='+( ${BASH_SOURCE}:${LINENO} ): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'; } 2>/dev/null

/ctx/repos.sh

dnf5 remove -y docker-buildx docker-cli docker-compose

dnf5 distro-sync -y

systemctl enable podman.socket
