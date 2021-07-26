# GitOps Principles v0.2.0

## Summary

GitOps is a set of principles for operating and managing software systems.

When using GitOps, the _Desired State_ of a system or subsystem is defined declaratively as versioned, immutable data, and the running system's configuration is continuously derived from this data.

These principles were derived from modern software operations but are rooted in pre-existing and widely adopted best practices.

## Principles

1. **Desired System State Is Declarative**

    A system managed by GitOps must have its _Desired State_ expressed declaratively as data in a format writable and readable by both humans and machines.

2. **Declarations Are Versioned and Immutable**

    _Desired State_ is stored in a way that supports versioning, immutability of versions, and retains a complete version history.

3. **State Reconciliation Is Continuous**

    Software agents continuously, and automatically, compare a system's state to its _Desired State_.
    If these states differ for any reason, automated actions to reconcile them are initiated.

4. **Intentional Changes Only Through Versioning**

    The only mechanism through which the system is intentionally changed is through new versions of the _Desired State_.

## Notes

### Principle 3 Notes

- These differences could be due to the actual state drifting from the desired state, or the desired state changing intentionally.
- The source of drift doesn't matter. Contrary to CIops, _any_ drift will trigger a reconciliation

### Principle 4 Notes

- We talk here about "regular operations." In an emergency, other modes of operations, e.g. manual intervention, should be considered - followed by a reconciliation of the "tainted" system with the declared state. → resolve the conflict between "GitOps principle" and "I need to deal with problems that GitOps doesn't cover"

## Glossary

- ### Continuous

    By "continuous" we adopt the industry standard term to mean reconciliation continues to happen, not that it must be instantaneous.

- ### Declarative Description

    Describing the desired state or behavior of a system without specifying how that state will be achieved, thereby separating between configuration - the desired state - and implementation - the commands, API calls, scripts ... that actually achieve the desired state described in the declarative description.

- ### Desired State

    The aggregate of all configuration data for a system form its _Desired State_ which is defined as data sufficient to recreate the system so that instances of the system are behaviourally indistinguishable.

- ### Software System

    One or more Runtime environments consisting of resources under management.
    In each Runtime, management Agents to act on resources according to security policies.
    One or more software Repositories for storing deployable artifacts that may be loaded into the runtime environments, eg. configuration files, code, binaries and packages.
    One or more Administrators who are responsible for operating the runtime environments ie. installing, starting, stopping and updating software, code, configuration, etc.
    A set of policies controlling access and management of repositories, deployments, runtimes.

- #### State Store

    A system for storing versioned, immutable Desired States that provides access control and auditing on the changes to the Desired State. Git may be configured as a State Store, but [special precautions must be taken](recipes/SETTING_UP_GIT.md).
