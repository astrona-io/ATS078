#!/usr/bin/env bash
# Check: No binding grants a role to system:unauthenticated and anonymous cannot list pods
set -uo pipefail
fail=0

bad="$(kubectl get clusterrolebindings,rolebindings -A -o json | jq -r '.items[] | select(any(.subjects[]?; .name == "system:unauthenticated")) | .metadata.name' | grep -v '^system:' || true)"
if [ -n "$bad" ]; then echo "FAIL: bindings to system:unauthenticated remain: $bad"; fail=1; fi
r="$(kubectl auth can-i list pods -n deck --as=system:anonymous --as-group=system:unauthenticated 2>/dev/null || true)"
[ "$r" = "no" ] || { echo "FAIL: an anonymous caller can list pods in deck"; fail=1; }

if [ "$fail" -eq 0 ]; then echo "PASS: No binding grants a role to system:unauthenticated and anonymous cannot list pods"; fi
exit "$fail"
