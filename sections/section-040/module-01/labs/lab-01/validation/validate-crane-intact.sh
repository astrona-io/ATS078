#!/usr/bin/env bash
# Check: Deployment crane in deck is still available
set -uo pipefail
fail=0

ok="$(kubectl -n deck get deployment crane -o jsonpath='{.status.availableReplicas}' 2>/dev/null)"
if [ "${ok:-0}" -lt 1 ]; then echo "FAIL: crane in deck is not available"; fail=1; fi

if [ "$fail" -eq 0 ]; then echo "PASS: Deployment crane in deck is still available"; fi
exit "$fail"
