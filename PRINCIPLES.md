# GitOps Principles {{version}}

GitOps is a set of principles for operating and managing software systems.
These principles are derived from modern software operations, but are also rooted in pre-existing and widely adopted best practices.

The [desired state](./GLOSSARY.md#desired-state) must be:

1. ## Declarative

    Desired state must be expressed [declaratively](./GLOSSARY.md#declarative-description).

2. ## Versioned and Immutable

    Desired state must be [stored](./GLOSSARY.md#state-store) with immutability, versioning, and history.

3. ## Pulled Automatically

    Software agents must automatically [pull](./GLOSSARY.md#pull) the desired state declarations from the source.

4. ## Continuously Reconciled

    Software agents must [continuously](./GLOSSARY.md#continuous) observe actual system state and [attempt to apply](./GLOSSARY.md#reconciliation) the desired state.
