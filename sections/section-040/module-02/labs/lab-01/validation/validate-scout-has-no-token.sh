#!/usr/bin/env bash
# Check: Running pods of scout have no ServiceAccount token volume
set -uo pipefail
fail=0

no_token_pods() {
  local ns="$1" app="$2" pods count bad
  pods="$(kubectl -n "$ns" get pods -l "app=$app" -o json 2>/dev/null)"
  count="$(echo "$pods" | jq "[.items[] | select(.metadata.deletionTimestamp == null and .status.phase == \"Running\")] | length")"
  if [ "${count:-0}" -lt 1 ]; then echo "FAIL: no running pod of $app in $ns"; return 1; fi
  bad="$(echo "$pods" | jq -r ".items[] | select(.metadata.deletionTimestamp == null) | select(any((.spec.volumes // [])[]; (.projected.sources // []) | any(.serviceAccountToken != null))) | .metadata.name")"
  if [ -n "$bad" ]; then echo "FAIL: pods of $app still mount a ServiceAccount token: $bad"; return 1; fi
  return 0
}
no_token_pods bridge scout || fail=1

if [ "$fail" -eq 0 ]; then echo "PASS: Running pods of scout have no ServiceAccount token volume"; fi
exit "$fail"
