#!/usr/bin/env bash
# Check: kade cannot read Secrets, create or delete pods, or exec in deck
set -uo pipefail
fail=0

can() { kubectl auth can-i "$@" --as=kade 2>/dev/null || true; }
[ "$(can get secrets -n deck)" = "no" ] || { echo "FAIL: kade can read secrets in deck"; fail=1; }
[ "$(can list secrets -n deck)" = "no" ] || { echo "FAIL: kade can list secrets in deck"; fail=1; }
[ "$(can create pods -n deck)" = "no" ] || { echo "FAIL: kade can create pods in deck"; fail=1; }
[ "$(can delete pods -n deck)" = "no" ] || { echo "FAIL: kade can delete pods in deck"; fail=1; }
[ "$(can create pods --subresource=exec -n deck)" = "no" ] || { echo "FAIL: kade can exec into pods in deck"; fail=1; }
[ "$(can create rolebindings -n deck)" = "no" ] || { echo "FAIL: kade can create rolebindings in deck"; fail=1; }

if [ "$fail" -eq 0 ]; then echo "PASS: kade cannot read Secrets, create or delete pods, or exec in deck"; fi
exit "$fail"
