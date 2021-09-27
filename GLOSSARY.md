# GitOps Glossary

This glossary accompanies the [GitOps Principles](./PRINCIPLES.md), and other supporting documents in this repository.

- ## Continuous

    "Continuous" is intended to match the industry standard term: [reconciliation](#reconciliation) continues to happen, not that it must be instantaneous.

- ## Declarative Description

    A configuration that describes the desired operating state of a system without specifying procedures for how that state will be achieved. This separates configuration (the desired state) from the implementation (commands, API calls, scripts etc.) used to achieve that state.

- ## Desired State

    The aggregate of all configuration data needed to start, bootstrap, recreate, run, and recover a system. This does not include data stored within a system, eg. database contents.

- ## Drift

    When a system's actual state changes for any reason other than its [desired state](#desired-state)declarations having changed. When this occurs, the system has drifted from its desired state.

- ## Reconciliation

    The process of ensuring the actual state of a system matches its [desired state](#desired-state) declarations.
    Contrary to "CIops", any divergence between the two will trigger reconciliation, regardless of where changes occurred.
    Divergence could be due to the actual state unintentionally [drifting](#drift) from the desired state declarations, or a new desired state declaration version having been changed intentionally.

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
