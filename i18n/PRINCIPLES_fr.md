# Les Principes GitOps {{version}}

GitOps est un ensemble de principes pour l'exploitation et la gestion des systèmes logiciels.
Ces principes sont dérivés des opérations logicielles modernes, mais sont également ancrés dans les meilleures pratiques préexistantes et largement adoptées.

L'[état souhaité](./GLOSSARY_fr.md#etat-souhaite) d'un système géré par GitOps doit être :

1. **Déclaratif**

    Un [système](./GLOSSARY_fr.md#systeme-logiciel) géré par GitOps doit avoir son état souhaité exprimé [de manière déclarative](./GLOSSARY_fr.md#description-declarative).

2. **Versionné et Immuable**

    L'état souhaité est [stocké](./GLOSSARY_fr.md#stockage-d-etat) d'une manière qui renforce l'immuabilité, le versioning et conserve un historique complet des versions.

3. **"Pull" automatiquement**

    Les agents logiciels extraient, "Pull",  automatiquement les déclarations d'état souhaitées de la source.

4. **Reconcilié en permanence**

    Les agents logiciels observent [continuellement](./GLOSSARY_fr.md#continu) l'état présent du système et [tentent d'appliquer](./GLOSSARY_fr.md#reconciliation) l'état souhaité.