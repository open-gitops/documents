# Principios de GitOps {{version}}

GitOps es un conjunto de principios para operar y gestionar sistemas de software.
Estos principios se derivan de las operaciones de software modernas, pero también están arraigados en las mejores prácticas preexistentes y ampliamente adoptadas.

El [estado deseado](./GLOSSARY_es.md#estado-deseado) de un sistema gestionado por GitOps debe ser

1. **Declarativo**

    Un [sistema](./GLOSSARY_es.md#sistema-de-software) gestionado por GitOps debe tener su estado deseado expresado [declarativamente](./GLOSSARY_es.md#descripción-declarativa).

2. **Versionado e inmutable**

    El estado deseado se [almacena](./GLOSSARY_es.md#almacenamiento-del-estado) de forma que se aplique la inmutabilidad, el versionado y se conserve un historial de versiones completo.

3. **Se extrae automáticamente**

    Los agentes de software extraen automáticamente las declaraciones de estado deseadas de la fuente.

4. **Conciliación continua**

    Los agentes de software [continuamente](./GLOSSARY_es.md#continuo) observan el estado real del sistema y [intentan aplicar](./GLOSSARY_es.md#reconciliación) el estado deseado.