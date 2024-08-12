# GitOps Glossary {{version}}

Ce glossaire accompagne les [principes GitOps](./PRINCIPLES_fr.md), et autres documents de soutien dans ce dépôt Git.

- ## Continu

    « Continu » est destiné à correspondre au terme standard de l'industrie : la [réconciliation](#rconciliation) se produit en continu, sans obligation d'être instantanée.

- ## Description déclarative

    Une configuration qui décrit l'état de fonctionnement souhaité d'un système sans spécifier les procédures pour la réalisation de cet état. Cela sépare la configuration (l'état souhaité) de la mise en œuvre (commandes, appels API, scripts, etc.) utilisée pour atteindre cet état.

- ## État souhaité

    L'ensemble de toutes les données de configuration qui sont suffisantes pour recréer le système de sorte que les instances du système soient indiscernables du point de vue comportemental. 
    Cette configuration n'inclut généralement pas les données persistantes de l'application, par exemple le contenu de la base de données, mais comprennent souvent les informations d'identification permettant d'accéder à ces données, ou la configuration des outils de récupération des données fonctionnant sur ce système.

- ## Dérive

    Lorsque l'état réel d'un système s'est éloigné ou est en train de s'éloigner de [l'état souhaité](#etat-souhaite), on parle alors de dérive.

- ## Extraction ("Pull")

    [Principe 3](./PRINCIPLES_fr.md) (Extraction automatique) indique que l'état souhaité doit être extrait plutôt que poussé, principalement parce que les agents logiciels doivent être capable d'accéder à tout moment à [l'état souhaité](#etat-souhaite) dans le [stockage d'état](#stockage-d-etat), pas seulement lors d'un chagement intentionel dans le stockage d'état déclanchant un évėnement de type "push". C'est une condition préalable pour que la réconciliation se produise en continu, comme spécifié dans le [principe 4](./PRINCIPLES_fr.md) (Reconcilié en permanence). Notez que, contrairement au CI/CD traditionnel, où l'automatisation est généralement pilotée par des déclencheurs prédéfinis, dans GitOps, la réconciliation est déclenchée chaque fois qu'il y a une divergence. La divergence peut être due à l'état réel qui s'éloigne involontairement des déclarations d'état souhaitées, et pas seulement suite à une nouvelle version de déclaration d'état souhaitée modifiée intentionnellement.
  
- ## Réconciliation

    Le Processus consistant à s'assurer que l'état réel d'un système correspond à son [état souhaité](#etat-souhaite).
    Contrairement au CI/CD traditionnel où l'automatisation est généralement pilotée par des déclencheurs prédéfinis, dans GitOps la réconciliation est déclenchée dès qu'il y a une divergence. La divergence peut être due au fait que l'état présent s'écarte involontairement des déclarations d'état souhaité ([Dérive](#derive)), ou qu'une nouvelle version de déclaration d'état souhaité a été modifiée intentionnellement. 
    Des actions sont prises en fonction des politiques relatives au [retour d'information du système](#feedback) et des tentatives de réconciliation précédentes, afin de réduire la divergence au fil du temps.

- ## Système logiciel

    Un système logiciel géré par GitOps comprend :

    1. Un ou plusieurs environnements d'exécution constitués de ressources sous gestion
    2. Les agents de gestion au sein de chaque environnement d'exécution
    3. Des politiques pour contrôler l'accès et la gestion des dépôts, des déploiements et des environnements d'exécution

- ## Stockage d'état

    Un système pour stocker des versions immuables des déclarations [d'état souhaité](#etat-souhaite). Ce stockage d'états doit fournir un contrôle d'accès et un audit des modifications apportées à l'état souhaité. Git, dont GitOps tire son nom, est l'exemple canonique utilisé comme ce stockage d'état mais tout autre système répondant à ces critères peut être utilisé. Dans tous les cas, ces stockages d'état doivent être correctement configurés et des précautions doivent être prises pour se conformer aux exigences énoncées dans les principes GitOps.

- ## Feedback

    Open GitOps suit [la théorie du contrôle](https://fr.wikipedia.org/wiki/Th%C3%A9orie_du_contr%C3%B4le) et fonctionne en boucle fermée. Dans la théorie du contrôle, le feedback représente la façon dont les tentatives précédentes d'appliquer un état désiré ont affecté l'état réel. Par exemple, si l'état souhaité nécessite plus de ressources que celles qui existent dans un système, l'agent logiciel peut tenter d'ajouter des ressources, de revenir automatiquement à une version précédente ou d'envoyer des alertes aux opérateurs humains.
