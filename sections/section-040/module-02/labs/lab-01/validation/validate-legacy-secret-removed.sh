#!/usr/bin/env bash
# Check: The legacy token Secret scout-sa-token is deleted
set -uo pipefail
fail=0

if kubectl -n bridge get secret scout-sa-token >/dev/null 2>&1; then echo "FAIL: Secret scout-sa-token still exists"; fail=1; fi

if [ "$fail" -eq 0 ]; then echo "PASS: The legacy token Secret scout-sa-token is deleted"; fi
exit "$fail"
