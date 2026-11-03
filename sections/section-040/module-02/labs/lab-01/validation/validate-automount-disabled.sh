#!/usr/bin/env bash
# Check: ServiceAccount scout-sa disables automounting
set -uo pipefail
fail=0

value="$(kubectl -n bridge get serviceaccount scout-sa -o jsonpath='{.automountServiceAccountToken}' 2>/dev/null)"
if [ "$value" != "false" ]; then echo "FAIL: automountServiceAccountToken on scout-sa is '$value', expected false"; fail=1; fi

if [ "$fail" -eq 0 ]; then echo "PASS: ServiceAccount scout-sa disables automounting"; fi
exit "$fail"
