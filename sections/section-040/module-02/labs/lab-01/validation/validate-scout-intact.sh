#!/usr/bin/env bash
# Check: scout still uses scout-sa and is available
set -uo pipefail
fail=0

sa="$(kubectl -n bridge get deployment scout -o jsonpath='{.spec.template.spec.serviceAccountName}' 2>/dev/null)"
ok="$(kubectl -n bridge get deployment scout -o jsonpath='{.status.availableReplicas}' 2>/dev/null)"
if [ "$sa" != "scout-sa" ]; then echo "FAIL: scout uses ServiceAccount '$sa'"; fail=1; fi
if [ "${ok:-0}" -lt 1 ]; then echo "FAIL: scout has no available replica"; fail=1; fi

if [ "$fail" -eq 0 ]; then echo "PASS: scout still uses scout-sa and is available"; fi
exit "$fail"
