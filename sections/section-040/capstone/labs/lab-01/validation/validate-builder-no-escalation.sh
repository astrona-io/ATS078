#!/usr/bin/env bash
# Check: builder-sa can create roles in ward but has no bind or escalate permission
set -uo pipefail
fail=0

sa="system:serviceaccount:ward:builder-sa"
can() { kubectl auth can-i "$@" --as="$sa" 2>/dev/null || true; }
[ "$(can create roles -n ward)" = "yes" ] || { echo "FAIL: builder-sa cannot create roles in ward"; fail=1; }
[ "$(can create rolebindings -n ward)" = "yes" ] || { echo "FAIL: builder-sa cannot create rolebindings in ward"; fail=1; }
[ "$(can escalate roles -n ward)" = "no" ] || { echo "FAIL: builder-sa can escalate roles"; fail=1; }
[ "$(can bind roles -n ward)" = "no" ] || { echo "FAIL: builder-sa can bind roles"; fail=1; }

if [ "$fail" -eq 0 ]; then echo "PASS: builder-sa can create roles in ward but has no bind or escalate permission"; fi
exit "$fail"
