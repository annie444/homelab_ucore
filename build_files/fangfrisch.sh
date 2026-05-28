#!/bin/bash
set -Eeuxo pipefail

{ export PS4='+( ${BASH_SOURCE}:${LINENO} ): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'; } 2>/dev/null

if ! [ -d /usr/local/share ]; then
  mkdir -p /usr/local/share
fi

python3 -m venv /usr/local/share/fangfrisch-venv
# shellcheck disable=SC1091
source /usr/local/share/fangfrisch-venv/bin/activate
pip install --upgrade pip
pip install fangfrisch
ln -s /usr/local/share/fangfrisch-venv/bin/fangfrisch /usr/local/bin/fangfrisch
deactivate
setsebool -P antivirus_can_scan_system 1
