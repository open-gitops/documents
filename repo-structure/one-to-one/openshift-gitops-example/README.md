# OpenShift GitOps Example

This is an example on how to structure a GitOps repo using the [1:1
method](../) and OpenShift. This is meant as a good starting point and
not what your final repo will look like.

Although OpenShift uses Argo CD,
this example was necissary because OpenShift uses
[OLM](https://docs.openshift.com/container-platform/latest/operators/understanding/olm/olm-understanding-olm.html)
for installation of it's component

# Structure

Below is an explanation on how this repo is laid out. You'll notice
that [Kustomize](https://kustomize.io/) is used heavily. This follows the
[DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) principal
when it comes to YAML files.

```shell
cluster-XXXX/ # 1
├── bootstrap # 2
│   ├── base
│   │   ├── kustomization.yaml
│   │   └── openshift-gitops-sub.yaml
│   └── overlays
│       └── default
│           ├── kustomization.yaml
│           ├── openshift-gitops-argocd.yaml
│           └── openshift-gitops-rbac-policy.yaml
├── components # 3
│   ├── applicationsets
│   │   ├── core-components-appset.yaml
│   │   ├── kustomization.yaml
│   │   └── tenants-appset.yaml
│   └── argocdproj
│       ├── kustomization.yaml
│       └── test-project.yaml
├── core # 4
│   ├── container-security-operator
│   │   ├── container-security-operator-sub.yaml
│   │   └── kustomization.yaml
│   └── gitops-controller
│       └── kustomization.yaml
└── tenants # 5
    ├── bgd-blue
    │   ├── bgd-deployment.yaml
    │   └── kustomization.yaml
    └── myapp
        ├── kustomization.yaml
        ├── myapp-deployment.yaml
        ├── myapp-ns.yaml
        ├── myapp-route.yaml
        └── myapp-service.yaml
```
|#|Directory Name|Description|
|---|----------------|-----------------|
| 1. |`cluster-XXXX`| This is the cluster name. This name should be unique to the specific cluster you're targeting. For OpenShift, use the output of `kubectl get infrastructure cluster -o jsonpath='{.status.infrastructureName}'`|
| 2. | `bootstrap` | This is where bootstrapping specifc configurations are stored. These are items that get the cluster/automation started. They are usually install manifests.<br /><br /> `base` is where are the "common" YAML would live and `overlays` are configurations specific to the cluster.<br /><br />The `kustomization.yaml` file in `default` overlay has `cluster-XXXX/components/applicationsets/` and `cluster-XXXX/components/argocdproj/` as a part of it's `bases` config.|
| 3. | `components` | This is where specific components for the GitOps Controller lives (in this case Argo CD).<br /><br />`applicationsets` is where all the ApplicationSets YAMLs live and `argocdproj` is where the ArgoAppProject YAMLs live.<br /><br />Other things that can live here are RBAC, Git repo, and other Argo CD specific configurations (each in their repsective directories).|
| 4. | `core` | This is where YAML for the core functionality of the cluster live. Here is where the Kubernetes administrator will put things that is necissary for the functionality of the cluster.<br /><br />Under `gitops-controller` is where you are using Argo CD to manage itself. The `kustomization.yaml` file uses `cluster-XXXX/bootstrap/overlays/default` in it's `bases` configuration. This `core` directory gets deployed as an applicationset which can be found under `cluster-XXXX/components/applicationsets/core-components-appset.yaml`.<br /><br />To add a new "core functionality" workload, one needs to add a directory with some yaml in the `core` directory. See the `container-security-operator` directory as an example.|
| 5. | `tenants` | This is where the workloads for this cluster live.<br /><br />Similar to `core`, the `tenants` directory gets loaded as part of an ApplicationSet that is under `cluster-XXXX/components/applicationsets/tenants-appset.yaml`.<br /><br />This is where Devlopers/Release Engineers do the work. They just need to commit a directory with some YAML and the applicationset takes care of creating the workload.<br /><br />**Note** that `bgd-blue/kustomization.yaml` file points to another Git repo. This is to show that you can host your YAML in one repo, or many repos.|

# Testing

Install OpenShift using:

```shell
openshift-install create cluster
```

Afer cloning this repo just apply the overlay directory

```shell
until kubectl apply -k repo-structure/one-to-one/openshift-gitops-example/cluster-XXXX/bootstrap/overlays/default/; do sleep 3; done
```

This should give you 4 applications

```shell
$ kubectl get applications -n openshift-gitops
NAME                          SYNC STATUS   HEALTH STATUS
bgd-blue                      Synced        Healthy
container-security-operator   Synced        Healthy
myapp                         Synced        Healthy
gitops-controller             Synced        Healthy
```

Backed by 2 applicationsets

```shell
$ kubectl get appsets -n openshift-gitops
NAME      AGE
cluster   110s
tenants   110s
```

Visit the Argo CD UI to see it visualized, get the route by running (use "LOG IN VIA OPENSHIFT"):

```shell
kubectl get route openshift-gitops-server -n openshift-gitops -o jsonpath='{.spec.host}{"\n"}'
```

# Enjoy

Fork and Enjoy

> :warning: Feel free to fork this and play around with it, but remember if you'll have to change the applicationsets configuration and where the bases are pointing to if you're chanigng names of things
