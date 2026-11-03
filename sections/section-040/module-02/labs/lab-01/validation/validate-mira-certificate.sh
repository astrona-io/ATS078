#!/usr/bin/env bash
# Check: CSR mira-csr is approved and issued a certificate for CN=mira, O=crew
set -uo pipefail
fail=0

cert="$(kubectl get csr mira-csr -o jsonpath='{.status.certificate}' 2>/dev/null)"
if [ -z "$cert" ]; then echo "FAIL: CSR mira-csr has no issued certificate; approve it"; fail=1
else
  subject="$(echo "$cert" | base64 -d | openssl x509 -noout -subject -nameopt compat 2>/dev/null)"
  echo "$subject" | grep -Eq 'CN *= *mira' || { echo "FAIL: certificate subject is '$subject'"; fail=1; }
  echo "$subject" | grep -Eq 'O *= *crew' || { echo "FAIL: certificate subject has no O=crew: '$subject'"; fail=1; }
fi

if [ "$fail" -eq 0 ]; then echo "PASS: CSR mira-csr is approved and issued a certificate for CN=mira, O=crew"; fi
exit "$fail"
