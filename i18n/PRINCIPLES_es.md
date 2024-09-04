# Principios de GitOps {{version}}

GitOps es un conjunto de principios para operar y manejar los sistemas de software.
Estos principios se derivan de las operaciones de software modernas y también de las preexistentes prácticas  aceptadas como estándares y buenas prácticas.

El [estado deseado](./GLOSSARY_es.md#estado-deseado) de un sistema manejado por GitOps debe ser:

1. **Declarativo**

    Un [sistema](./GLOSSARY_es.md#sistema-de-software) gestionado por GitOps debe tener su estado deseado expresado [declarativamente](./GLOSSARY_es.md#descripcion-declarativa).

2. **Versionado e inmutable**

    El estado deseado es [almacenado](./GLOSSARY_es.md#almacenamiento-del-estado) de forma que refuerza la inmutabilidad, el versionado y retiene una completa versión de su historial.

3. **Se extraen automáticamente**

    Los agentes de software, extraen automáticamente las declaraciones de estado deseadas desde el código fuente.

4. **Conciliación continua**

    Los agentes de software [continuamente](./GLOSSARY_es.md#continuamente) observan el estado actual del sistema e [intentan aplicar](./GLOSSARY_es.md#reconciliación) el estado deseado.