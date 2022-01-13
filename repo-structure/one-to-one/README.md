# Flux Example

This is an example on how to structure a GitOps repo using the [1:1
method](../) and Argo CD. This is meant as a good starting point and
not what your final repo will look like.

# Structure

Below is an explanation on how this repo is laid out. You'll notice
[Kustomize](https://kustomize.io/) is used heavily. This is to follow the
[DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) principal
when it comes to YAML files.

```shell
cluster-XXXX/ #1
├── bootstrap #2
│   ├── base
│   └── overlays
│       └── default
├── components #3
│   ├── (applicationsets OR kustomizations)
│   └── (argocdproj OR gitrepositories)
├── core #4
│   ├── gitops-controller
│   └── sample-admin-workload
└── tenants
    ├── bgd-blue
    └── myapp
```

|#|Directory Name|Description|
|---|----------------|-----------------|
| 1. |`cluster-XXXX`| This is the cluster name and top level directory in your repo. This name should be unique to the specific cluster you're targeting. If you're using CAPI, this should be the name of your cluster, the output of `kubectl get cluster`|
| 2. | `bootstrap` | This is where bootstrapping specifc configurations are stored. These are items that get the cluster/automation started. They are usually install manifests of the GitOps controller.<br /><br />`base` is where are the "common" YAML would live and `overlays` are configurations specific to the cluster.<br /><br />The `kustomization.yaml` file in `default` has all the directories under `cluster-XXXX/components/` as a part of it's `bases` config.|
| 3. | `components` | This is where specific components for the GitOps Controller lives. The directories here depend on the GitOps controller you are using.<br /><br /> For example, if you're using Argo CD, `applicationsets` and `argocdproj` are possible directories (each in their repsective configurations). For Flux, this is where `gitrepositories` and `kustomizations` (with their repsective configurations) would be stored.|
| 4. | `core` | This is where YAML for the core functionality of the cluster live. These are things that are necissary for the cluster to run/be usable. Here is where the Kubernetes administrator will put things that is necissary for the functionality of the cluster (like cluster configs or cluster workloads).<br /><br />Under `gitops-controller` is where you are using the GitOps controller to manage itself. The `kustomization.yaml` file uses `cluster-XXXX/bootstrap/overlays/default` in it's `bases` configuration. This `core` directory gets deployed as a workload.<br /><br />To add a new "core functionality" workoad, one needs to add a directory with some yaml in the `core` directory. See the `sample-admin-config` directory as an example.|
| 5. | `tenants` | This is where the workloads for this cluster live.<br /><br />Similar to `core`, all directories under `tenants` gets deployed .<br /><br />This is where Devlopers/Release Engineers do the work. They just need to commit a directory with some YAML and the GitOps controller takes care of creating the workload.<br /><br /> **Note** that `bgd-blue/kustomization.yaml` file points to another Git repo. This is to show that you can host your YAML in one repo, or many repos, while still keeping one repo to manage the one cluster.|

# Noteworthy Things

Some of this layout may seem "overkill" for a single cluster, but there are reasons. 

* The `bootstrap` seems redundant as you are just referencing it in the `gitops-controller` directory. This is to "instill good habits" as the `bootstrap` directory comes in handly later when you're doing mono-repo (1 repo to many clusters).
* It may seem redundant to have `core` and `tenants`. You can fold this into one directory called `apps` because, functionally, `core` and `tenants` are the same thing. However, this is done (separating the two) as a way to set a demarcation between what "is needed in the cluster" and "what is using the cluster".
* There is an `overlays/default` directory for the same reason as there is `bootstrap` directory. Instilling good habits. This is, technically, unecissary for the functionality; but it's an important practice for other designs/implementations.

# Examples

You'll find the following examples using this structure in this repo:

* [Argo CD Example](argocd-example)
* [Flux Example](flux-example)
* [OpenShift GitOps Example](openshift-gitops-example)