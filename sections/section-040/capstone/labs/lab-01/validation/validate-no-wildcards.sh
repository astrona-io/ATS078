#!/usr/bin/env bash
# Check: No Role in ward uses a wildcard, bind, escalate or impersonate
set -uo pipefail
fail=0

bad="$(kubectl -n ward get roles -o json | jq -r '.items[] | select(any(.rules[]?; any((.verbs + .resources + .apiGroups)[]?; . == "*" or . == "bind" or . == "escalate" or . == "impersonate"))) | .metadata.name')"
if [ -n "$bad" ]; then echo "FAIL: Roles with wildcard or escalation verbs: $bad"; fail=1; fi

if [ "$fail" -eq 0 ]; then echo "PASS: No Role in ward uses a wildcard, bind, escalate or impersonate"; fi
exit "$fail"
