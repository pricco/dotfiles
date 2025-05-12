#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "${BASH_SOURCE[0]}")/../common.sh"

install_system() {
  source "$(dirname "${BASH_SOURCE[0]}")/system.sh"
}

install_system
