#!/bin/bash
set -Eeuxo pipefail

{ export PS4='+( ${BASH_SOURCE}:${LINENO} ): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'; } 2>/dev/null

/ctx/repos.sh
/ctx/install-pkgs.sh

/ctx/fangfrisch.sh

/ctx/firewalld.sh
/ctx/pam.sh
/ctx/postfix.sh

/ctx/systemd.sh

/ctx/cleanup.sh
