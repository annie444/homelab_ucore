#!/bin/bash

set -ouex pipefail

{ export PS4='+( ${BASH_SOURCE}:${LINENO} ): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'; } 2>/dev/null

/ctx/repos.sh

/ctx/install-pkgs.sh

systemctl enable podman.socket
