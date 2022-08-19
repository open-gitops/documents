# Princípios de GitOps {{version}}

GitOps é um conjunto de princípios para operar e gerenciar sistemas de software.
Esses princípios são derivados de operações de software modernas, mas também estão enraizados em práticas recomendadas pré-existentes e amplamente adotadas.

O [estado desejado](./GLOSSARY_pt.md#estado-desejado) de um sistema gerenciado GitOps deve ser:

1. **Declarativo**

    Um [sistema](./GLOSSARY_pt.md#sistema-de-software) gerenciado por GitOps deve ter seu estado desejado expresso [declarativamente](./GLOSSARY_pt.md#descrição-declarativa).

2. **Versionado e Imutável**

    O estado desejado é [armazenado](./GLOSSARY_pt.md#armazenamento-de-estado) de uma forma que impõe imutabilidade, controle de versão e retém um histórico de versão completo.

3. **Puxado Automaticamente**

    Os agentes de software extraem automaticamente as declarações de estado desejadas da origem.

4. **Conciliação Contínua**

    Os agentes de software [continuamente](./GLOSSARY_pt.md#contínuo) observam o estado real do sistema e [tentam aplicar](./GLOSSARY_pt.md#reconciliação) o estado desejado.