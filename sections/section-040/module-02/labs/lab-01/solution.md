# Solution

Solve this lab on `terminal`. Each step ends with `astrona submit`. This lab has not been run yet; the commands are checked statically only.

```sh
astrona run --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/module-02/labs/lab-01
```

## Step 1: Approve the request

Read the subject before you approve. The signer copies it into the certificate.

```sh
kubectl get csr mira-csr
kubectl get csr mira-csr -o jsonpath='{.spec.request}' | base64 -d | openssl req -noout -subject
kubectl certificate approve mira-csr
kubectl get csr mira-csr -o jsonpath='{.status.certificate}' | base64 -d | openssl x509 -noout -subject
astrona submit --keep --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/module-02/labs/lab-01
```

## Step 2: Disable automounting

```sh
kubectl -n bridge patch serviceaccount scout-sa --type=merge -p '{"automountServiceAccountToken":false}'
kubectl -n bridge rollout restart deployment/scout
kubectl -n bridge rollout status deployment/scout
astrona submit --keep --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/module-02/labs/lab-01
```

The restart is needed because a running pod keeps the volumes it was created with.

## Step 3: Delete the legacy Secret

```sh
kubectl -n bridge get secrets --field-selector type=kubernetes.io/service-account-token
kubectl -n bridge delete secret scout-sa-token
astrona submit --keep --git ssh://git@github.com/astrona-io/ATS078.git -c sections/section-040/module-02/labs/lab-01
```

Destroy the lab when you are done:

```sh
astrona destroy ats-078-lab-040-02
```
