#!/usr/bin/env bash
# Check: Deployment scout in ward is still available
set -uo pipefail
fail=0

ok="$(kubectl -n ward get deployment scout -o jsonpath='{.status.availableReplicas}' 2>/dev/null)"
if [ "${ok:-0}" -lt 1 ]; then echo "FAIL: scout in ward is not available"; fail=1; fi

if [ "$fail" -eq 0 ]; then echo "PASS: Deployment scout in ward is still available"; fi
exit "$fail"
