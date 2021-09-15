# GitOps Principles v0.1.0

GitOps is a set of principles for operating and managing software systems.
These principles are derived from modern software operations, but are also rooted in pre-existing and widely adopted best practices.

The desired state of a GitOps managed system must be:

1. **Declarative**

    A system managed by GitOps must have its desired state expressed declaratively.

2. **Versioned and Immutable**

    Desired state is stored in a way that enforces immutability, versioning and retains a complete version history.

3. **Pulled Automatically**

    Software agents automatically pull the desired state declarations from the source.

4. **Continuously Reconciled**

    Software agents continuously observe actual system state and attempt to apply the desired state.

## Glossary

- ### Break Glass

    The temporary suspension of GitOps principles, often accomplished by pausing automated _Reconciliation_.
    While these principles apply to typical operations, it may at times be necessary to temporarily pause reconciliation, for example during incident management activities.
    In these cases, other modes of operations should be considered (e.g. manual intervention), followed by any necessary updates to the desired state declarations, and finally resuming reconciliation of the system with the updated declarations.
    Pragmatic exceptions to these guiding principles are expected from time to time during the journey toward a system being fully managed by GitOps.

- ### Continuous

    By "continuous" we adopt the industry standard to mean that _Reconciliation_ continues to happen, not that it must be instantaneous.

- ### Declarative Description

    Describing the desired state or behavior of a system without specifying how that state will be achieved, thereby separating configuration (the desired state) from the implementation (commands, API calls, scripts etc.) that actually achieves the desired state described in the declarative description.

- ### Desired State

    The aggregate of all configuration data for a system form its _Desired State_ which is defined as data sufficient to recreate the system so that instances of the system are behaviourally indistinguishable.

- ### Drift

    When a system's _Actual State_ changes for any reason other than its versioned _Desired State_ declarations having changed, we say that the system has drifted from its _Desired State_.

- ### Reconciliation

    The process of ensuring that the _Actual State_ of a sytem matches its versioned _Desired State_ declarations.
    Contrary to CIops, any divergence between the two will trigger reconciliation, regardless of where changes occured.
    Divergence could be due to the actual state unintentionally _Drifting_ from the desired state declarations, or a new desired state declaration version having been changed intentionally.

- ### Software System

    One or more Runtime environments consisting of resources under management.
    In each Runtime, management Agents to act on resources according to security policies.
    One or more software Repositories for storing deployable artifacts that may be loaded into the runtime environments, eg. configuration files, code, binaries and packages.
    One or more Administrators who are responsible for operating the runtime environments ie. installing, starting, stopping and updating software, code, configuration, etc.
    A set of policies controlling access and management of repositories, deployments, runtimes.

- ### State Store

    A system for storing immutable versions of _Desired State_ declarations.
    This state store should provide access control and auditing on the changes to the Desired State.
    Git is the canonical example used as this State Store, and where GitOps derived its name, but but any other system that meets this criteria may be used.
    In all cases these must be properly configured, and special precautions must be taken to comply with requirements set out in the GitOps Principles.
