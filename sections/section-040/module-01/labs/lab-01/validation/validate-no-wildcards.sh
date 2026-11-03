#!/usr/bin/env bash
# Check: Role ops in deck has no wildcard and still exists
set -uo pipefail
fail=0

role="$(kubectl -n deck get role ops -o json 2>/dev/null)"
if [ -z "$role" ]; then echo "FAIL: Role ops does not exist; kade is bound to it"; fail=1
else
  wild="$(echo "$role" | jq '[.rules[] | (.verbs + .resources + .apiGroups) | map(select(. == "*")) | length] | add // 0')"
  if [ "$wild" -ne 0 ]; then echo "FAIL: Role ops still contains a wildcard"; fail=1; fi
fi

if [ "$fail" -eq 0 ]; then echo "PASS: Role ops in deck has no wildcard and still exists"; fi
exit "$fail"
