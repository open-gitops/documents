# GitOps Principles {{version}}

GitOps is a set of principles for operating and managing software systems.
These principles are derived from modern software operations, but are also rooted in pre-existing and widely adopted best practices.

The [desired state](./GLOSSARY.md#desired-state) of a GitOps managed system must be:

1. **Declarative**

    A [system](./GLOSSARY.md#software-system) managed by GitOps must have its desired state expressed [declaratively](./GLOSSARY.md#declarative-description).

2. **Versioned and Immutable**

    Desired state is [stored](./GLOSSARY.md#state-store) in a way that enforces immutability, versioning and retains a complete version history.

3. **Pulled Automatically**

    Software agents automatically pull the desired state declarations from the source.

4. **Continuously Reconciled**

    Software agents [continuously](./GLOSSARY.md#continuous) observe actual system state and [attempt to apply](./GLOSSARY.md#reconciliation) the desired state.
    
