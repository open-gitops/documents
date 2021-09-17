# GitOps Glossary

This glossary accompanies the [GitOps Principles](./PRINCIPLES.md), and other supporting documents in this repository.

- ## Break Glass

    The temporary suspension of GitOps principles, often accomplished by pausing automated [reconciliation](#reconciliation).
    While these principles apply to typical operations, it may at times be necessary to temporarily pause reconciliation, for example during incident management activities.
    In these cases, other modes of operations should be considered (e.g. manual intervention), followed by any necessary updates to the desired state declarations, and finally resuming reconciliation of the system with the updated declarations.
    Pragmatic exceptions to these guiding principles are expected from time to time during the journey toward a system being fully managed by GitOps.

- ## Continuous

    By "continuous" we adopt the industry standard to mean that [reconciliation](#reconciliation) continues to happen, not that it must be instantaneous.

- ## Declarative Description

    Describing the desired state or behavior of a system without specifying how that state will be achieved, thereby separating configuration (the desired state) from the implementation (commands, API calls, scripts etc.) that actually achieves the desired state described in the declarative description.

- ## Desired State

    The aggregate of all configuration data for a system form its desired state which is defined as data sufficient to recreate the system so that instances of the system are behaviourally indistinguishable, but do not include the state of any data stored within the system, eg. database contents. 

- ## Drift

    When a system's actual state changes for any reason other than its versioned [desired state](#desired-state) declarations having changed, we say that the system has drifted from its desired state.

- ## Reconciliation

    The process of ensuring that the actual state of a system matches its [desired state](#desired-state) declarations.
    Contrary to CIops, any divergence between the two will trigger reconciliation, regardless of where changes occured.
    Divergence could be due to the actual state unintentionally [drifting](#drift) from the desired state declarations, or a new desired state declaration version having been changed intentionally.

- ## Software System

  We currently understand a software system to include:

  - One or more runtime environments consisting of resources under management
  - In each runtime, the management agents which act on resources according to security policies
  - One or more software Repositories for storing deployable artifacts that may be loaded into the runtime environments, eg. configuration files, code, binaries and packages
  - One or more Administrators who are responsible for operating the runtime environments ie. installing, starting, stopping and updating software, code, configuration, etc
  - A set of policies controlling access and management of repositories, deployments, runtimes

- ## State Store

    A system for storing immutable versions of [Desired State](#desired-state) declarations.
    This state store should provide access control and auditing on the changes to the Desired State.
    Git, from which GitOps derives its name, is the canonical example used as this state store but any other system that meets these criteria may be used.
    In all cases, these state stores must be properly configured and special precautions must be taken to comply with requirements set out in the GitOps Principles.
