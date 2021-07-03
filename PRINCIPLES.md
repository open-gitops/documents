# GitOps Principles v0.2.0

## Summary

GitOps is a set of principles for operating and managing software systems.

When using GitOps, the _Desired State_ of a system or subsystem is defined declaratively as versioned, immutable data, and the running system's configuration is continuously derived from this data.

These principles were derived from modern software operations but are rooted in pre-existing and widely adopted best practices.

## Principles

1. **The system's desired state described declaratively**

    A system managed by GitOps must have its _Desired State_ expressed declaratively as data in a format writable and readable by both humans and machines.

2. **Declaration change history stored as immutable versions**

    _Desired State_ declarations are stored in a way that supports versioning, immutability of versions, and retains a complete history of changes.

3. **System operation only through declaration changes**

    The only mechanism through which the system is intentionally operated on is through versioned mutation of the _Desired State_ declarations.

4. **State reconciliation automated and continuous**

    Software agents continuously, and automatically, compare a system's _Actual State_ to its versioned _Desired State_ declarations.
    If the actual and desired states differ for any reason, automated actions to reconcile them are initiated.

## Glossary

- ### Break Glass

    The temporary suspension of GitOps principles, most often pausing automated _Reconciliation_.
    While these principles apply to "regular operations," it may sometimes be necessary to pause or sidestep them during an emergency such as incident management.
    In these cases, other modes of operations should be considered (e.g. manual intervention), followed by any necessary updates to the desired state declarations, and finally resuming reconciliation of the manually changed system with the updated declarations again.
    Pragmatic exceptions to these guiding principles are expected from time to time during the journey toward a system being fully managed by GitOps.

- ### Continuous

    By "continuous" we adopt the industry standard term to mean _Reconciliation_ continues to happen, not that it must be instantaneous.

- ### Declarative Description

    Describing the desired state or behavior of a system without specifying how that state will be achieved, thereby separating between configuration (the desired state) and implementation (the commands, API calls, scripts etc.) that actually achieves the desired state described in the declarative description.

- ### Desired State

    The aggregate of all configuration data for a system form its _Desired State_ which is defined as data sufficient to recreate the system so that instances of the system are behaviourally indistinguishable.

- ### Drift

    When a system's _Actual State_ changes for any reason other than its versioned _Desired State_ declarations having changed, we say that the system has drifted from it's _Desired State_.

- ### Reconciliation

    The process of ensuring that the _Actual State_ of a sytem matches it's versioned _Desired State_ declarations.
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
    Git is most often used as this State Store, but other systems may be used.
    In all cases these must be properly configured, and special precautions must be taken, to comply with requirements set out in the GitOps Principles.
