# Речник на „GitOps“ {{version}}

Овој речник ги придружува [Принципите на „GitOps“](./PRINCIPLES_mk.md), како и другите придружни документи во ова складиште.

- ## Непрекинато

    „Непрекинато“ е наменето да одговара на стандардниот термин во индустријата: [хармонијата](#reconciliation) продолжува да се воспоставува, но не мора да се случи веднаш.

- ## Декларативен опис

    Конфигурација која ја опишува посакуваната оперативна состојба на системот без да специфицира процедури за тоа како ќе се постигне таа состојба. Ова ја одделува конфигурацијата (саканата состојба) од имплементацијата (наредби, повици до „API“, скрипти итн.) што се користат за постигнување на таа состојба.

- ## Посакувана состојба

    Агрегат од сите конфигурациски податоци што е доволен за повторно создавање на системот, така што инстанците на системот не се разликуваат по однесување.
    Овие податоци за конфигурација генерално не вклучуваат постојани податоци за апликацијата, како на пример содржината на базата на податоци, иако често вклучуваат ингеренции за пристап до тие податоци или конфигурација за алатки за обновување на податоци што работат на тој систем.

- ## Лизгање

    Кога вистинската состојба на системот е поместена или е во процес на оддалечување од [посакуваната состојба](#desired-state), ова често се нарекува лизгање.

- ## Повлекување

    [Принципот бр. 3](./PRINCIPLES_mk.md) (Повлечена автоматски) одредува дека [посакуваната состојба](#desired-state) мора да се „влече“ наместо да се „турка“, главно затоа што софтверските агенти мора да бидат во можност да пристапат до посакуваната состојба во т.н. [записник на состојби](#state-store) во било кое време, а не само кога има намерна промена во записникот што предизвикува некој настан на „туркање“.
    Ова е предуслов за [хармонијата](#reconciliation) да се воспоставува [непрекинато](#continuous), како што е предвидено во [принципот бр. 4](./PRINCIPLES_mk.md) (Постојано хармонична).
    Забележете дека - за разлика од традиционалните „CI/CD“, каде што автоматизацијата генерално е управувана од предефинирани активатори - во „GitOps“, [хармонијата](#reconciliation) се воспоставува _секогаш_ кога има дивергенција.
    Дивергенцијата може да се должи на ненамерното [лизгање](#drift) од посакуваната состојба - не само поради намерна промена на верзијата.

- ## Reconciliation

    The process of ensuring the actual state of a system matches its [desired state](#desired-state).
    Contrary to traditional CI/CD where automation is generally driven by pre-set triggers, in GitOps reconciliation is triggered whenever there is a divergence. Divergence could be due to the actual state unintentionally [drifting](#drift) from the desired state declarations, or a new desired state declaration version having been changed intentionally.
    Actions are taken based on policies around [feedback](./GLOSSARY.md#feedback) from the system and previous reconciliation attempts, in order to reduce deviation over time.

- ## Software System

    A software system managed by GitOps includes:

    1. One or more runtime environments consisting of resources under management
    2. The management agents within each runtime
    3. Policies for controlling access and management of repositories, deployments, runtimes

- ## State Store

    A system for storing immutable versions of [desired state](#desired-state) declarations.
    This state store should provide access control and auditing on the changes to the Desired State.
    Git, from which GitOps derives its name, is the canonical example used as this state store but any other system that meets these criteria may be used.
    In all cases, these state stores must be properly configured and precautions must be taken to comply with requirements set out in the GitOps Principles.

- ## Feedback

    Open GitOps follows [control-theory](https://en.wikipedia.org/wiki/Control_theory) and operates in a closed-loop. In control theory, feedback represents how previous attempts to apply a desired state have affected the actual state. For example if the desired state requires more resources than exist in a system, the software agent may make attempts to add resources, to automatically rollback to a previous version, or to send alerts to human operators.

