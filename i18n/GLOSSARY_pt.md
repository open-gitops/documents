# Glossário de GitOps {{version}}

Este glossário acompanha os [Princípios de GitOps](./PRINCIPLES_pt.md) e outros documentos de apoio neste repositório.

- ## Contínuo

    "Contínuo" destina-se a corresponder ao termo padrão da indústria: [reconciliação](#reconciliação) contínua, não que deva ser instantânea.

- ## Descrição Declarativa

    Uma configuração que descreve o estado operacional desejado de um sistema sem especificar procedimentos de como esse estado será alcançado. Isso separa a configuração (o estado desejado) da implementação (comandos, chamadas de API, scripts etc.) usada para atingir esse estado.

- ## Estado Desejado

    A agregação de todos os dados de configuração que são suficientes para recriar o sistema, de forma que as instâncias do sistema sejam indistinguíveis em seu comportamento.
    Esses dados de configuração geralmente não incluem dados de aplicativos persistentes, por exemplo, conteúdo do banco de dados, embora muitas vezes inclua credenciais para acessar esses dados ou configuração para ferramentas de recuperação de dados em execução nesse sistema.

- ## Desvio

    Quando o estado atual de um sistema se moveu ou está em processo de se afastar do [estado desejado](#estado-desejado), isso geralmente é chamado de desvio.

- ## Obter    

    O [Princípio 3](./PRINCIPLES_pt.md) (Obtido Automaticamente) especifica que o estado desejado deve ser "puxado" em vez de "empurrado", principalmente porque os agentes de software devem ser capazes de acessar o [estado desejado](#estado-desejado) a partir do [armazenamento de estado](#armazenamento-de-estado) a _qualquer_ momento, e não apenas quando houver uma mudança intencional no armazenamento de estado que aciona um evento de push. 
    Este é um pré-requisito para que a [reconciliação](#reconciliação) aconteça [continuamente](#contínuo), como especificado no [princípio 4](./PRINCIPLES_pt.md) (Conciliação Contínua). 
    Observe que – ao contrário do CI/CD tradicional, onde a automação é geralmente acionada por gatilhos predefinidos – no GitOps, a [reconciliação](#reconciliação) é acionada _sempre que_ houver uma divergência. 
    A divergência pode ser devido ao estado atual se desviar inadvertidamente do estado desejado – e não apenas devido a uma nova versão da declaração de estado desejado ter sido alterada intencionalmente.

- ## Reconciliação

    O processo de garantir que o estado real de um sistema corresponda ao seu [estado desejado](#estado-desejado).
    Ao contrário do CI/CD tradicional, onde a automação geralmente é acionada por gatilhos predefinidos, no GitOps a reconciliação é acionada sempre que há uma divergência. A divergência pode ser devido ao estado real não intencionalmente [desviar](#desvio) das declarações de estado desejadas, ou uma nova versão da declaração de estado desejada ter sido alterada intencionalmente.
    As ações são tomadas com base nas políticas sobre [retroalimentação](#retroalimentação) do sistema e tentativas anteriores de reconciliação, a fim de reduzir o desvio ao longo do tempo.

- ## Sistema de Software

    Um sistema de software gerenciado por GitOps inclui:

     1. Um ou mais ambientes de execução compostos por recursos gerenciados
     1. Os agentes de gerenciamento em cada ambiente de execução
     1. Políticas para controle de acesso e gerenciamento de repositórios, implantações, ambientes de execução

- ## Armazenamento de Estado

    Um sistema para armazenar versões imutáveis de declarações de [estado desejado](#estado-desejado).
    Esse armazenamento de estado deve fornecer controle de acesso e auditoria sobre as alterações no Estado Desejado.
    Git, do qual GitOps deriva seu nome, é o exemplo canônico usado como armazenamento de estado, mas qualquer outro sistema que atenda a esses critérios pode ser usado.
    Em todos os casos, esses armazenamentos de estado devem ser configurados adequadamente e devem ser tomadas precauções para cumprir os requisitos estabelecidos nos Princípios de GitOps.

- ## Retroalimentação

    Open GitOps segue a [teoria de controle](https://pt.wikipedia.org/wiki/Teoria_de_controle) e opera em circuito fechado. Na teoria de controle, a realimentação representa como as tentativas anteriores de aplicar um estado desejado afetaram o estado atual. Por exemplo, se o estado desejado exigir mais recursos do que os existentes em um sistema, o agente de software pode tentar adicionar recursos, reverter automaticamente para uma versão anterior ou enviar alertas para operadores humanos.