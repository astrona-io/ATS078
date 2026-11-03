#!/usr/bin/env bash
# Applies the reference solution. Run only by `astrona test`.
set -euo pipefail
kubectl delete clusterrolebinding crew-admin
kubectl -n ward create rolebinding crew-view --clusterrole=view --group=crew
kubectl -n ward delete rolebinding public-pods
kubectl -n ward patch role rolemaker --type=json -p '[{"op":"replace","path":"/rules/0/verbs","value":["get","list","create","update"]}]'
kubectl -n ward patch role config-reader --type=json -p '[{"op":"replace","path":"/rules/0/resources","value":["configmaps"]}]'
echo "[solution] Applied."
