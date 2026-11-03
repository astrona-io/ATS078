#!/usr/bin/env bash
# Check: reader-sa can read configmaps in ward and cannot read or list Secrets
set -uo pipefail
fail=0

sa="system:serviceaccount:ward:reader-sa"
can() { kubectl auth can-i "$@" --as="$sa" 2>/dev/null || true; }
[ "$(can get configmaps -n ward)" = "yes" ] || { echo "FAIL: reader-sa cannot get configmaps"; fail=1; }
[ "$(can list configmaps -n ward)" = "yes" ] || { echo "FAIL: reader-sa cannot list configmaps"; fail=1; }
[ "$(can get secrets -n ward)" = "no" ] || { echo "FAIL: reader-sa can get secrets"; fail=1; }
[ "$(can list secrets -n ward)" = "no" ] || { echo "FAIL: reader-sa can list secrets"; fail=1; }

if [ "$fail" -eq 0 ]; then echo "PASS: reader-sa can read configmaps in ward and cannot read or list Secrets"; fi
exit "$fail"
