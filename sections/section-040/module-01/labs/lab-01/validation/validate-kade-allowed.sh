#!/usr/bin/env bash
# Check: kade can list pods, read pod logs and scale deployments in deck
set -uo pipefail
fail=0

can() { kubectl auth can-i "$@" --as=kade 2>/dev/null || true; }
[ "$(can list pods -n deck)" = "yes" ] || { echo "FAIL: kade cannot list pods in deck"; fail=1; }
[ "$(can get pods --subresource=log -n deck)" = "yes" ] || { echo "FAIL: kade cannot read pod logs in deck"; fail=1; }
[ "$(can patch deployments --subresource=scale -n deck)" = "yes" ] || { echo "FAIL: kade cannot scale deployments in deck"; fail=1; }

if [ "$fail" -eq 0 ]; then echo "PASS: kade can list pods, read pod logs and scale deployments in deck"; fi
exit "$fail"
