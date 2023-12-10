# Replication 

I am having a physical host with the following resources:

```bash
cpus: 32
memory: 40960Mi
```

The OCPv4.14.5 CAS consumption its:

```bash
[root@INBACRNRDL0101 ~]# export KUBECONFIG=.kcli/clusters/someone-test/auth/kubeconfig 
[root@INBACRNRDL0101 ~]# oc get nodes
NAME                                  STATUS   ROLES                         AGE    VERSION
someone-test-ctlplane-0.test414.com   Ready    control-plane,master,worker   125m   v1.27.6+d548052
[root@INBACRNRDL0101 ~]# oc adm top nodes someone-test-ctlplane-0.test414.com
NAME                                  CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
someone-test-ctlplane-0.test414.com   830m         2%     12051Mi         30%       
[root@INBACRNRDL0101 ~]# oc describe nodes someone-test-ctlplane-0.test414.com
Name:               someone-test-ctlplane-0.test414.com
Roles:              control-plane,master,worker
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=someone-test-ctlplane-0.test414.com
                    kubernetes.io/os=linux
                    node-role.kubernetes.io/control-plane=
                    node-role.kubernetes.io/master=
                    node-role.kubernetes.io/worker=
                    node.openshift.io/os_id=rhcos
Annotations:        k8s.ovn.org/host-cidrs: ["192.168.122.159/24","192.168.122.253/24"]
                    k8s.ovn.org/l3-gateway-config:
                      {"default":{"mode":"shared","interface-id":"br-ex_someone-test-ctlplane-0.test414.com","mac-address":"52:54:00:ab:67:26","ip-addresses":["...
                    k8s.ovn.org/network-ids: {"default":"0"}
                    k8s.ovn.org/node-chassis-id: c0dd603f-6fe1-4cda-be00-f3cf58d41ae6
                    k8s.ovn.org/node-gateway-router-lrp-ifaddr: {"ipv4":"100.64.0.2/16"}
                    k8s.ovn.org/node-id: 2
                    k8s.ovn.org/node-mgmt-port-mac-address: 52:d0:94:52:42:75
                    k8s.ovn.org/node-primary-ifaddr: {"ipv4":"192.168.122.159/24"}
                    k8s.ovn.org/node-subnets: {"default":["10.132.0.0/23"]}
                    k8s.ovn.org/node-transit-switch-port-ifaddr: {"ipv4":"100.88.0.2/16"}
                    k8s.ovn.org/remote-zone-migrated: someone-test-ctlplane-0.test414.com
                    k8s.ovn.org/zone-name: someone-test-ctlplane-0.test414.com
                    machineconfiguration.openshift.io/controlPlaneTopology: SingleReplica
                    machineconfiguration.openshift.io/currentConfig: rendered-master-27da15170559e4c4d5d5267557fe012b
                    machineconfiguration.openshift.io/desiredConfig: rendered-master-27da15170559e4c4d5d5267557fe012b
                    machineconfiguration.openshift.io/desiredDrain: uncordon-rendered-master-27da15170559e4c4d5d5267557fe012b
                    machineconfiguration.openshift.io/lastAppliedDrain: uncordon-rendered-master-27da15170559e4c4d5d5267557fe012b
                    machineconfiguration.openshift.io/lastSyncedControllerConfigResourceVersion: 14130
                    machineconfiguration.openshift.io/reason: 
                    machineconfiguration.openshift.io/state: Done
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Sun, 10 Dec 2023 10:28:38 -0500
Taints:             <none>
Unschedulable:      false
Lease:
  HolderIdentity:  someone-test-ctlplane-0.test414.com
  AcquireTime:     <unset>
  RenewTime:       Sun, 10 Dec 2023 12:35:25 -0500
Conditions:
  Type             Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----             ------  -----------------                 ------------------                ------                       -------
  MemoryPressure   False   Sun, 10 Dec 2023 12:31:43 -0500   Sun, 10 Dec 2023 10:28:38 -0500   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure     False   Sun, 10 Dec 2023 12:31:43 -0500   Sun, 10 Dec 2023 10:28:38 -0500   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure      False   Sun, 10 Dec 2023 12:31:43 -0500   Sun, 10 Dec 2023 10:28:38 -0500   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready            True    Sun, 10 Dec 2023 12:31:43 -0500   Sun, 10 Dec 2023 10:31:01 -0500   KubeletReady                 kubelet is posting ready status
Addresses:
  InternalIP:  192.168.122.159
  Hostname:    someone-test-ctlplane-0.test414.com
Capacity:
  cpu:                32
  ephemeral-storage:  104266732Ki
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             41057980Ki
  pods:               250
Allocatable:
  cpu:                31500m
  ephemeral-storage:  95018478229
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             39907004Ki
  pods:               250
System Info:
  Machine ID:                                       bbd0bd2fced84a6cbca6f883a824ab89
  System UUID:                                      bbd0bd2f-ced8-4a6c-bca6-f883a824ab89
  Boot ID:                                          14bcf09e-eded-4f1b-ad19-e92fece7a10b
  Kernel Version:                                   5.14.0-284.43.1.el9_2.x86_64
  OS Image:                                         Red Hat Enterprise Linux CoreOS 414.92.202311281318-0 (Plow)
  Operating System:                                 linux
  Architecture:                                     amd64
  Container Runtime Version:                        cri-o://1.27.2-2.rhaos4.14.git9d684e2.el9
  Kubelet Version:                                  v1.27.6+d548052
  Kube-Proxy Version:                               v1.27.6+d548052
Non-terminated Pods:                                (87 in total)
  Namespace                                         Name                                                            CPU Requests  CPU Limits  Memory Requests  Memory Limits  Age
  ---------                                         ----                                                            ------------  ----------  ---------------  -------------  ---
  kcli-infra                                        coredns-someone-test-ctlplane-0.test414.com                     150m (0%)     0 (0%)      512Mi (1%)       0 (0%)         126m
  kcli-infra                                        keepalived-someone-test-ctlplane-0.test414.com                  150m (0%)     0 (0%)      2Gi (5%)         0 (0%)         126m
  kcli-infra                                        mdns-someone-test-ctlplane-0.test414.com                        150m (0%)     0 (0%)      1Gi (2%)         0 (0%)         125m
  openshift-apiserver-operator                      openshift-apiserver-operator-6d76fbfbfc-4m8cp                   10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         125m
  openshift-apiserver                               apiserver-cf899f9d7-hvhqk                                       110m (0%)     0 (0%)      250Mi (0%)       0 (0%)         118m
  openshift-authentication-operator                 authentication-operator-7c8ccdbbc9-chz62                        20m (0%)      0 (0%)      200Mi (0%)       0 (0%)         125m
  openshift-authentication                          oauth-openshift-694949fd59-j46k6                                10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         111m
  openshift-cloud-controller-manager-operator       cluster-cloud-controller-manager-operator-cb5b599bf-w2968       20m (0%)      0 (0%)      75Mi (0%)        0 (0%)         126m
  openshift-cloud-credential-operator               cloud-credential-operator-75b5cbfcb7-q6sl7                      20m (0%)      0 (0%)      40Mi (0%)        0 (0%)         126m
  openshift-cluster-machine-approver                machine-approver-67c5fd4746-nsmd6                               20m (0%)      0 (0%)      70Mi (0%)        0 (0%)         126m
  openshift-cluster-node-tuning-operator            cluster-node-tuning-operator-84c6d79894-q4rbz                   10m (0%)      0 (0%)      20Mi (0%)        0 (0%)         126m
  openshift-cluster-node-tuning-operator            tuned-6zddd                                                     10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         123m
  openshift-cluster-samples-operator                cluster-samples-operator-64f49fbf5c-6kpq9                       20m (0%)      0 (0%)      100Mi (0%)       0 (0%)         121m
  openshift-cluster-storage-operator                cluster-storage-operator-549f6fd487-k26rz                       10m (0%)      0 (0%)      20Mi (0%)        0 (0%)         126m
  openshift-cluster-storage-operator                csi-snapshot-controller-5b95dcdfdc-9sz8q                        10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         124m
  openshift-cluster-storage-operator                csi-snapshot-controller-operator-c98695bf-9tsmr                 10m (0%)      0 (0%)      65Mi (0%)        0 (0%)         126m
  openshift-cluster-storage-operator                csi-snapshot-webhook-f976d76cd-8gkc8                            10m (0%)      0 (0%)      20Mi (0%)        0 (0%)         124m
  openshift-cluster-version                         cluster-version-operator-66c999bf59-srk2f                       20m (0%)      0 (0%)      50Mi (0%)        0 (0%)         126m
  openshift-config-operator                         openshift-config-operator-85c47889fb-7vmb4                      10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         126m
  openshift-console-operator                        console-operator-5b4445c66f-qmgdw                               20m (0%)      0 (0%)      200Mi (0%)       0 (0%)         111m
  openshift-console                                 console-fd4c547cb-hmrgx                                         10m (0%)      0 (0%)      100Mi (0%)       0 (0%)         110m
  openshift-console                                 downloads-68dfff7cbb-czbgx                                      10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         111m
  openshift-controller-manager-operator             openshift-controller-manager-operator-799fc47945-t45nc          10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         125m
  openshift-controller-manager                      controller-manager-7b5d47c54f-fvmcj                             100m (0%)     0 (0%)      100Mi (0%)       0 (0%)         118m
  openshift-dns-operator                            dns-operator-5dc97f5675-bdfsf                                   20m (0%)      0 (0%)      69Mi (0%)        0 (0%)         125m
  openshift-dns                                     dns-default-62zw2                                               60m (0%)      0 (0%)      110Mi (0%)       0 (0%)         123m
  openshift-dns                                     node-resolver-dq97j                                             5m (0%)       0 (0%)      21Mi (0%)        0 (0%)         123m
  openshift-etcd-operator                           etcd-operator-76b65c65c4-gcpdh                                  10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         125m
  openshift-etcd                                    etcd-someone-test-ctlplane-0.test414.com                        360m (1%)     0 (0%)      910Mi (2%)       0 (0%)         114m
  openshift-image-registry                          cluster-image-registry-operator-6cdf5787d5-rz2wn                10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         126m
  openshift-image-registry                          image-registry-dd546c546-94kvs                                  100m (0%)     0 (0%)      256Mi (0%)       0 (0%)         118m
  openshift-image-registry                          node-ca-5jrww                                                   10m (0%)      0 (0%)      10Mi (0%)        0 (0%)         123m
  openshift-ingress-canary                          ingress-canary-nhhvv                                            10m (0%)      0 (0%)      20Mi (0%)        0 (0%)         121m
  openshift-ingress-operator                        ingress-operator-56bc4f5b46-4lgss                               20m (0%)      0 (0%)      96Mi (0%)        0 (0%)         126m
  openshift-ingress                                 router-default-68cd456d89-s2fg2                                 100m (0%)     0 (0%)      256Mi (0%)       0 (0%)         123m
  openshift-insights                                insights-operator-549c8b65df-smrjs                              10m (0%)      0 (0%)      30Mi (0%)        0 (0%)         126m
  openshift-kube-apiserver-operator                 kube-apiserver-operator-586c7d7954-77n2c                        10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         126m
  openshift-kube-apiserver                          kube-apiserver-someone-test-ctlplane-0.test414.com              290m (0%)     0 (0%)      1224Mi (3%)      0 (0%)         113m
  openshift-kube-controller-manager-operator        kube-controller-manager-operator-848c49d997-pg25s               10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         125m
  openshift-kube-controller-manager                 kube-controller-manager-someone-test-ctlplane-0.test414.com     80m (0%)      0 (0%)      500Mi (1%)       0 (0%)         112m
  openshift-kube-scheduler-operator                 openshift-kube-scheduler-operator-7d48bdd466-8csdw              10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         125m
  openshift-kube-scheduler                          openshift-kube-scheduler-someone-test-ctlplane-0.test414.com    25m (0%)      0 (0%)      150Mi (0%)       0 (0%)         114m
  openshift-kube-storage-version-migrator-operator  kube-storage-version-migrator-operator-7b667446b7-7dxzs         10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         125m
  openshift-kube-storage-version-migrator           migrator-64c5f6f5b5-8n7vt                                       10m (0%)      0 (0%)      200Mi (0%)       0 (0%)         124m
  openshift-machine-api                             cluster-autoscaler-operator-5ddb9794f-vctmx                     30m (0%)      0 (0%)      70Mi (0%)        0 (0%)         126m
  openshift-machine-api                             cluster-baremetal-operator-7bb648ccbd-wdjrd                     20m (0%)      0 (0%)      70Mi (0%)        0 (0%)         126m
  openshift-machine-api                             control-plane-machine-set-operator-6498844bb4-wk8vj             10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         126m
  openshift-machine-api                             machine-api-operator-864854d966-vts6x                           20m (0%)      0 (0%)      70Mi (0%)        0 (0%)         126m
  openshift-machine-config-operator                 machine-config-controller-575d9796db-ksd42                      40m (0%)      0 (0%)      100Mi (0%)       0 (0%)         123m
  openshift-machine-config-operator                 machine-config-daemon-mlgjp                                     40m (0%)      0 (0%)      100Mi (0%)       0 (0%)         123m
  openshift-machine-config-operator                 machine-config-operator-75c68b8df4-4k7xg                        40m (0%)      0 (0%)      100Mi (0%)       0 (0%)         126m
  openshift-machine-config-operator                 machine-config-server-x44zr                                     20m (0%)      0 (0%)      50Mi (0%)        0 (0%)         123m
  openshift-marketplace                             certified-operators-8xw4h                                       10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         123m
  openshift-marketplace                             community-operators-hqscv                                       10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         123m
  openshift-marketplace                             marketplace-operator-7c6bcd9b8c-55ncr                           1m (0%)       0 (0%)      5Mi (0%)         0 (0%)         125m
  openshift-marketplace                             redhat-marketplace-w4qj7                                        10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         123m
  openshift-marketplace                             redhat-operators-wv6vw                                          10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         123m
  openshift-monitoring                              alertmanager-main-0                                             9m (0%)       0 (0%)      120Mi (0%)       0 (0%)         111m
  openshift-monitoring                              cluster-monitoring-operator-7f799f99c9-sdmjp                    10m (0%)      0 (0%)      75Mi (0%)        0 (0%)         126m
  openshift-monitoring                              kube-state-metrics-c7c8f4657-4xx9s                              4m (0%)       0 (0%)      110Mi (0%)       0 (0%)         123m
  openshift-monitoring                              monitoring-plugin-65d6f88b6-gzkls                               10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         111m
  openshift-monitoring                              node-exporter-qm2m8                                             9m (0%)       0 (0%)      47Mi (0%)        0 (0%)         123m
  openshift-monitoring                              openshift-state-metrics-7f8ff767bd-nvpll                        3m (0%)       0 (0%)      72Mi (0%)        0 (0%)         123m
  openshift-monitoring                              prometheus-adapter-688bb7dd6b-6gdgd                             1m (0%)       0 (0%)      40Mi (0%)        0 (0%)         118m
  openshift-monitoring                              prometheus-k8s-0                                                75m (0%)      0 (0%)      1104Mi (2%)      0 (0%)         111m
  openshift-monitoring                              prometheus-operator-5d6d65fbb8-p7wz2                            6m (0%)       0 (0%)      165Mi (0%)       0 (0%)         123m
  openshift-monitoring                              prometheus-operator-admission-webhook-6c9c7ff8dd-s82hp          5m (0%)       0 (0%)      30Mi (0%)        0 (0%)         123m
  openshift-monitoring                              telemeter-client-9bd6c9675-gn7bq                                3m (0%)       0 (0%)      70Mi (0%)        0 (0%)         118m
  openshift-monitoring                              thanos-querier-54b95c5d4f-mpb9k                                 15m (0%)      0 (0%)      92Mi (0%)        0 (0%)         113m
  openshift-multus                                  multus-additional-cni-plugins-cl8n9                             10m (0%)      0 (0%)      10Mi (0%)        0 (0%)         125m
  openshift-multus                                  multus-admission-controller-7fb5d769c-vkkg7                     20m (0%)      0 (0%)      70Mi (0%)        0 (0%)         122m
  openshift-multus                                  multus-ncxsj                                                    10m (0%)      0 (0%)      65Mi (0%)        0 (0%)         125m
  openshift-multus                                  network-metrics-daemon-m5hfb                                    20m (0%)      0 (0%)      120Mi (0%)       0 (0%)         125m
  openshift-network-diagnostics                     network-check-source-76c4795f-nq2m6                             10m (0%)      0 (0%)      40Mi (0%)        0 (0%)         125m
  openshift-network-diagnostics                     network-check-target-9x7qm                                      10m (0%)      0 (0%)      15Mi (0%)        0 (0%)         125m
  openshift-network-node-identity                   network-node-identity-ph5hq                                     20m (0%)      0 (0%)      100Mi (0%)       0 (0%)         125m
  openshift-network-operator                        network-operator-6f6868db46-dszs4                               10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         125m
  openshift-oauth-apiserver                         apiserver-65bd8fddcf-6kjr2                                      150m (0%)     0 (0%)      200Mi (0%)       0 (0%)         122m
  openshift-operator-lifecycle-manager              catalog-operator-797d57bd4f-zhp44                               10m (0%)      0 (0%)      80Mi (0%)        0 (0%)         126m
  openshift-operator-lifecycle-manager              olm-operator-7679d45868-9vljw                                   10m (0%)      0 (0%)      160Mi (0%)       0 (0%)         126m
  openshift-operator-lifecycle-manager              package-server-manager-b8f96cbd4-82tbl                          10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         126m
  openshift-operator-lifecycle-manager              packageserver-847ccc7789-nj8h7                                  10m (0%)      0 (0%)      50Mi (0%)        0 (0%)         123m
  openshift-ovn-kubernetes                          ovnkube-control-plane-8498775b9f-bbsq4                          20m (0%)      0 (0%)      320Mi (0%)       0 (0%)         125m
  openshift-ovn-kubernetes                          ovnkube-node-cdfr6                                              80m (0%)      0 (0%)      1630Mi (4%)      0 (0%)         124m
  openshift-route-controller-manager                route-controller-manager-5484b9b94d-wdzzp                       100m (0%)     0 (0%)      100Mi (0%)       0 (0%)         118m
  openshift-service-ca-operator                     service-ca-operator-76ddd45644-kmjrk                            10m (0%)      0 (0%)      80Mi (0%)        0 (0%)         125m
  openshift-service-ca                              service-ca-585c8dc78-tv2mh                                      10m (0%)      0 (0%)      120Mi (0%)       0 (0%)         124m
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource           Requests       Limits
  --------           --------       ------
  cpu                3011m (9%)     0 (0%)
  memory             15446Mi (39%)  0 (0%)
  ephemeral-storage  0 (0%)         0 (0%)
  hugepages-1Gi      0 (0%)         0 (0%)
  hugepages-2Mi      0 (0%)         0 (0%)
Events:
  Type    Reason          Age   From             Message
  ----    ------          ----  ----             -------
  Normal  RegisteredNode  126m  node-controller  Node someone-test-ctlplane-0.test414.com event: Registered Node someone-test-ctlplane-0.test414.com in Controller
  Normal  RegisteredNode  119m  node-controller  Node someone-test-ctlplane-0.test414.com event: Registered Node someone-test-ctlplane-0.test414.com in Controller
  Normal  RegisteredNode  118m  node-controller  Node someone-test-ctlplane-0.test414.com event: Registered Node someone-test-ctlplane-0.test414.com in Controller
  Normal  RegisteredNode  115m  node-controller  Node someone-test-ctlplane-0.test414.com event: Registered Node someone-test-ctlplane-0.test414.com in Controller
  Normal  RegisteredNode  113m  node-controller  Node someone-test-ctlplane-0.test414.com event: Registered Node someone-test-ctlplane-0.test414.com in Controller
  Normal  RegisteredNode  111m  node-controller  Node someone-test-ctlplane-0.test414.com event: Registered Node someone-test-ctlplane-0.test414.com in Controller
```

As it can be seen in the `description` of the node above:

```bash
Capacity:
  cpu:                32
  ephemeral-storage:  104266732Ki
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             41057980Ki
  pods:               250
Allocatable:
  cpu:                31500m
  ephemeral-storage:  95018478229
  hugepages-1Gi:      0
  hugepages-2Mi:      0
  memory:             39907004Ki
  pods:               250
```

The workload can be scheduled on the following `Allocable resources`.

In the following scenario, i would like to schedule a number of N `stress-ng` pod that its consuming 60% of the `Allocable resources` of the OCP SNO.

```bash
cpu: 31500m - 830m = 30670milicores --> 60% load of 30670milicores = 18402milicores
memory: 39907Mi - 12051Mi = 27856Mi --> 60% load of 27856Mi = 16713.6Mi
```


