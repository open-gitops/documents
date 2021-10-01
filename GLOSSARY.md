# GitOps Glossary

This glossary accompanies the [GitOps Principles](./PRINCIPLES.md), and other supporting documents in this repository.

- ## Continuous

    "Continuous" is intended to match the industry standard term: [reconciliation](#reconciliation) continues to happen, not that it must be instantaneous.

- ## Declarative Description

    A configuration that describes the desired operating state of a system without specifying procedures for how that state will be achieved. This separates configuration (the desired state) from the implementation (commands, API calls, scripts etc.) used to achieve that state.

- ## Desired State

    The aggregate of all configuration data for a system form its desired state which is defined as data sufficient to recreate the system so that instances of the system are behaviourally indistinguishable.
    This configuration data generally does not include persistent application data, eg. database contents, though often does include credentials for accessing that data, or configuration for data recovery tools running on that system.

- ## Drift

    When a system's actual state has moved or is in the process of moving away from the [desired state](#desired-state), this is often referred to as drift.

- ## Reconciliation

    The process of ensuring the actual state of a system matches its [desired state](#desired-state).
    Contrary to traditional CI/CD where automation is generally driven by pre-set triggers, in GitOps reconciliation is triggered whenever there is a divergence. Divergence could be due to the actual state unintentionally [drifting](#drift) from the desired state declarations, or a new desired state declaration version having been changed intentionally.

- ## Software System

    A software system managed by GitOps includes:

    1. One or more runtime environments consisting of resources under management
    1. The management agents within each runtime
    1. Policies for controlling access and management of repositories, deployments, runtimes

- ## State Store

    A system for storing immutable versions of [desired state](#desired-state) declarations.
    This state store should provide access control and auditing on the changes to the Desired State.
    Git, from which GitOps derives its name, is the canonical example used as this state store but any other system that meets these criteria may be used.
    In all cases, these state stores must be properly configured and precautions must be taken to comply with requirements set out in the GitOps Principles.
