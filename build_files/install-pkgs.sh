#!/bin/bash
set -Eeuxo pipefail

{ export PS4='+( ${BASH_SOURCE}:${LINENO} ): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'; } 2>/dev/null

dnf5 remove -y docker-buildx docker-cli docker-compose

mapfile -t packages < <(cat /ctx/*-pkgs.txt)

dnf5 install -y \
    "${packages[@]}"
# vim: set ft=bash et tw=4 sw=4 sts=4:
