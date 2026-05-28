#!/bin/bash

set -ouex pipefail
{ export PS4='+( ${BASH_SOURCE}:${LINENO} ): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'; } 2>/dev/null

source /etc/os-release

declare -a repos=(
  "copr:copr.fedorainfracloud.org:ublue-os:packages"
  "copr:copr.fedorainfracloud.org:ublue-os:staging"
  "fedora"
  "fedora-cisco-openh264"
  "tailscale-stable"
  "updates"
  "updates-archive"
)

if [[ "$NVIDIA" -eq 1 ]]; then
  repos+=("fedora-nvidia")
  repos+=("nvidia-container-toolkit")
fi

for repo in "${repos[@]}"; do
  dnf5 config-manager enable "$repo"
done

dnf5 install --nogpgcheck -y "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${VERSION_ID}.noarch.rpm" \
  "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${VERSION_ID}.noarch.rpm"
