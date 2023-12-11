#!/bin/bash

# Number of times to generate the manifest
num_manifests=10

for ((i=1; i<=num_manifests; i++)); do
  cat <<EOF > "manifest_${i}.yaml"
apiVersion: v1
kind: Namespace
metadata:
  creationTimestamp: null
  name: stability${i}
spec: {}
status: {}
---
apiVersion: v1
kind: Pod
metadata:
  name: stress-ng-pod
  namespace: stability${i}
spec:
  containers:
  - name: stress-ng-container
    image: quay.io/midu/stress-ng:03676022
    command:
    - stress-ng
    args:
    - "--cpu"
    - "1"
    - "--vm"
    - "1"
    - "--vm-bytes"
    - "835.7M"
    - "--vm-method"
    - "prime-gray-0"
    - "--mmaphuge"
    - "1"
    - "--vm-keep"
    - "--metrics-brief"
    resources:
      limits:
        memory: "835.7M"   
        cpu: "920.1m"       
      requests:
        memory: "835.7k"
        cpu: "1m"
EOF
done

echo "Generated ${num_manifests} manifests."

