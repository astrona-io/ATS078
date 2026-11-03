#!/usr/bin/env bash
# Applies the reference solution. Run only by `astrona test`.
set -euo pipefail
kubectl certificate approve mira-csr
kubectl -n bridge patch serviceaccount scout-sa --type=merge -p '{"automountServiceAccountToken":false}'
kubectl -n bridge delete secret scout-sa-token
kubectl -n bridge rollout restart deployment/scout
kubectl -n bridge rollout status deployment/scout --timeout=180s
for _ in $(seq 1 30); do
  [ -n "$(kubectl get csr mira-csr -o jsonpath='{.status.certificate}')" ] && break
  sleep 2
done
echo "[solution] Applied."
