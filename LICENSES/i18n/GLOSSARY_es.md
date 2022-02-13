# Glosario de GitOps {{version}}

Este glosario acompaña a los [Principios de GitOps](./PRINCIPLES_es.md), y otros documentos de apoyo en este repositorio.

- ## Continuo

    "Continuo" pretende coincidir con el término estándar de la industria: [reconciliación](#reconciliación) continua, no que deba ser instantánea.

- ## Descripción Declarativa

    Una configuración que describe el estado de funcionamiento deseado de un sistema sin especificar los procedimientos de cómo se alcanzará ese estado. Esto separa la configuración (el estado deseado) de la implementación (comandos, llamadas a la API, scripts, etc.) utilizados para lograr ese estado.

- ## Estado deseado

    El conjunto de todos los datos de configuración que son suficientes para recrear el sistema de manera que las instancias del sistema sean indistinguibles en su comportamiento.
    Estos datos de configuración generalmente no incluyen los datos persistentes de la aplicación, por ejemplo, el contenido de la base de datos, aunque a menudo incluye las credenciales para acceder a esos datos, o la configuración de las herramientas de recuperación de datos que se ejecutan en ese sistema.

- ## Deriva

    Cuando el estado real de un sistema se ha alejado o está en proceso de alejarse del [estado deseado](##estado-deseado), esto se suele denominar deriva.

- ## Reconciliación

    El proceso de asegurar que el estado real de un sistema coincide con su [estado deseado](#estado-deseado).
    Al contrario que en el CI/CD tradicional, en el que la automatización suele estar dirigida por activadores preestablecidos, en GitOps la reconciliación se activa siempre que hay una divergencia. La divergencia puede deberse a que el estado real se aleja involuntariamente (#deriva) de las declaraciones del estado deseado, o a que se ha cambiado intencionadamente una nueva versión de la declaración del estado deseado.
    Se toman acciones basadas en las políticas en torno a la [retroalimentación](#retroalimentacion) del sistema y los intentos de reconciliación anteriores, con el fin de reducir la desviación en el tiempo.

- ## Sistema de software

    Un sistema de software gestionado por GitOps incluye:

    1. Uno o más entornos de ejecución compuestos por recursos gestionados
    1. Los agentes de gestión dentro de cada tiempo de ejecución
    1. Políticas de control de acceso y gestión de repositorios, despliegues, tiempos de ejecución

- ## Almacenamiento del estado

    Un sistema para almacenar versiones inmutables de las declaraciones de [estado deseado](#estado-deseado).
    Este almacén de estado debe proporcionar control de acceso y auditoría sobre los cambios en el estado deseado.
    Git, del que GitOps deriva su nombre, es el ejemplo canónico utilizado como este almacén de estado, pero se puede utilizar cualquier otro sistema que cumpla estos criterios.
    En todos los casos, estos almacenes de estado deben estar correctamente configurados y se deben tomar precauciones para cumplir con los requisitos establecidos en los Principios de GitOps.

- ## Retroalimentación

    Open GitOps sigue la [teoría del control](https://en.wikipedia.org/wiki/Control_theory) y funciona en bucle cerrado. En la teoría del control, la retroalimentación representa cómo los intentos anteriores de aplicar un estado deseado han afectado al estado real. Por ejemplo, si el estado deseado requiere más recursos de los que existen en un sistema, el agente de software puede intentar añadir recursos, retroceder automáticamente a una versión anterior o enviar alertas a los operadores humanos.
