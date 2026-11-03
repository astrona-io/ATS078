# Question

Solve this question on: `terminal`

A new officer, `mira`, needs a client certificate. She already created a CertificateSigningRequest named `mira-csr` for `CN=mira, O=crew`. In the namespace `bridge`, the Deployment `scout` runs as the ServiceAccount `scout-sa` and never calls the Kubernetes API. `kubectl` points at the cluster as the cluster administrator.

1. Read the request, confirm its subject is `CN=mira, O=crew`, and approve `mira-csr` so the cluster issues the certificate.
2. Stop `scout` from receiving a ServiceAccount token. Set the right field on the ServiceAccount `scout-sa` and make the running pods of `scout` drop the token volume.
3. Find the legacy token Secret that belongs to `scout-sa` and delete it.
4. Keep the Deployment `scout` and its ServiceAccount name unchanged. `scout` must be available at the end.
