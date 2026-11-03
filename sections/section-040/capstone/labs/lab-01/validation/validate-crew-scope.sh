#!/usr/bin/env bash
# Check: crew has no cluster-admin binding, can list pods in ward and cannot read Secrets or list pods in kube-system
set -uo pipefail
fail=0

bad="$(kubectl get clusterrolebindings -o json | jq -r '.items[] | select(.roleRef.name == "cluster-admin") | select(any(.subjects[]?; .name == "crew")) | .metadata.name')"
if [ -n "$bad" ]; then echo "FAIL: group crew is still bound to cluster-admin through: $bad"; fail=1; fi
can() { kubectl auth can-i "$@" --as=someone --as-group=crew 2>/dev/null || true; }
[ "$(can list pods -n ward)" = "yes" ] || { echo "FAIL: crew cannot list pods in ward"; fail=1; }
[ "$(can get secrets -n ward)" = "no" ] || { echo "FAIL: crew can read secrets in ward"; fail=1; }
[ "$(can list pods -n kube-system)" = "no" ] || { echo "FAIL: crew can list pods in kube-system"; fail=1; }
[ "$(can delete pods -n ward)" = "no" ] || { echo "FAIL: crew can delete pods in ward"; fail=1; }

if [ "$fail" -eq 0 ]; then echo "PASS: crew has no cluster-admin binding, can list pods in ward and cannot read Secrets or list pods in kube-system"; fi
exit "$fail"
