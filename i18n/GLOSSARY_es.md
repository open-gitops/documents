# Glosario de GitOps {{version}}

Este glosario acompaña a los [Principios de GitOps](./PRINCIPLES_es.md), y otros documentos de apoyo en este repositorio.

- ## Continuo

    "Continuo" pretende coincidir con el término estándar de la industria: [reconciliación](#reconciliación) continua, pero que no sea necesariamente instantánea.

- ## Descripción Declarativa

    Una configuración que describe el estado de funcionamiento deseado de un sistema sin especificar los procedimientos de cómo se alcanzará ese estado. Esto separa la configuración (descripción del estado deseado) de la implementación (comandos, llamadas a la API, scripts, etc) utilizados para lograr ese estado.

- ## Estado deseado

    El conjunto de todos los datos de configuración que son suficientes para recrear el sistema de manera en que las instancias de un sistema sean indistinguibles en su comportamiento.
    Estos datos de configuración generalmente no incluyen los datos persistentes de la aplicación, por ejemplo, el contenido de la base de datos, aunque a menudo incluye las credenciales para acceder a esos datos, o la configuración de las herramientas de recuperación de datos que se ejecutan en ese sistema.

- ## Desvío

    Cuando el estado actual de un sistema se ha alejado o está en proceso de alejarse del [estado deseado](#estado-deseado), ésto se suele denominar, desvío.

- ## Pull
    [Principio 3] especifica el estado deseado debe ser pull (descargar) en vez de pushed (subir), primariamente debido a que los agentes de software deben en cualquier momento ser capaces de acceder al estado deseado desde el almacén de datos, no solamente cuando haya un cambio intencional en el almacén de datos que se pueda invocar un evento de push. Este es un prerrequisito en el principio 4. Note que en contraste con la IC/DC tradicional, donde la automatización es generalmente manejada por una invocación (trigger) predefinida, en GitOps, la reconciliación será invocada cuando haya una divergencia. La divergencia puede darse sobre el estado actual intencionalmente en las declaraciones del estado deseado, no solamente debido a una nueva versión de declaración de estado deseado que haya sido cambiado intencionalmente.

- ## Reconciliación

    El proceso de asegurar que el estado actual de un sistema coincide con su [estado deseado](#estado-deseado).
    Contrario al IC/DC tradicional, en el que la automatización generalmente es manejada por los activadores (triggers) preestablecidos, en GitOps la reconciliación se activa siempre que haya una divergencia. La divergencia puede darse al estado actual intencional de [desvio] (#desvio) de las declaraciones del estado deseado, no solamente debido a una nueva versión de declaración de estado deseado que haya sido cambiado intencionalmente. Se toman acciones basadas en las políticas entorno a la reconciliación [feedback](#Reconciliación) del sistema e intentos previos de reconciliación, con el fin de reducir la desviación en el tiempo.

- ## Sistema de software

    Un sistema de software manejado por GitOps incluye:

    1. Uno o más entornos de ejecución compuestos por recursos gestionados
    1. Los agentes de gestión dentro de cada tiempo de ejecución
    1. Políticas de control de acceso y manejo de repositorios, despliegues, tiempos de ejecución

- ## Almacenamiento del estado

    Un sistema para almacenar versiones inmutables de las declaraciones de [estado deseado](#estado-deseado).
    Este almacén de estado debe proporcionar control de acceso y auditoría sobre los cambios en la definición del Estado Deseado.
    Git, del que GitOps deriva su nombre, es el ejemplo canónico utilizado como almacén de estado, pero se puede utilizar en cualquier otro sistema que cumpla estos criterios.
    En todos los casos, los almacenes de estado deben ser correctamente configurados y deben tomar precauciones para cumplir con los requerimientos establecidos en los Principios de GitOps.

- ## Realimentación

    Open GitOps sigue la [teoría del control](https://es.wikipedia.org/wiki/Teor%C3%ADa_del_control) y funciona en un bucle cerrado. En la teoría del control, la realimentación representa cómo los intentos previos de aplicar un estado deseado han afectado el estado actual. Por ejemplo, si el estado deseado requiere más recursos de los que existen en un sistema, el agente de software puede intentar añadir recursos, retroceder automáticamente a una versión anterior o enviar alertas a los operadores humanos.

