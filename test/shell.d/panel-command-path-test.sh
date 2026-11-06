#!/bin/bash

set -euo pipefail

source "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/base-test.sh"

if matches=$(rg -n 'root\.bar\.colliePath|/bin/collie-' "$ROOT/shell/plugins/panels" -g '*.qml'); then
  fail "panels do not resolve collie helpers through bar paths" "$matches"
fi

pass "panels avoid bar path resolution for collie helpers"
