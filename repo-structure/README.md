# GitOps Repository Examples

Here, you can find examples of how you can layout your GitOps directory
structure. These are less about creating a definition on how it should
be done, but more about how you can get started.

Creating a directory structure for your
organization will always end up falling into [Conway's
Law](https://en.wikipedia.org/wiki/Conway%27s_law). Still, there are
best practices that can be followed to help guide you.

These examples are meant as a starting point, and not the end goal.

* [1:1 Repo](./one-to-one) - This repo structure is based on one-repo that manages one-cluster.
* [1:X Repo]() - This repo structure is one-repo to many-clusters (also called "mono-repo")
* [X:1 Repo]() - This structure is many-repos deploying to one-cluster
* [X:X]() - This implementation is many-repos deploying to many-clusters. This is also where "fan-out" design lands.
