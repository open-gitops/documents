## GitOps-Glossar {{version}}

Dieses Glossar begleitet die [GitOps-Prinzipien](./PRINCIPLES_de.md) und andere Dokumente dieses Repositorys.

- ## Kontinuierlich

    Mit "kontinuierlich" ist im Kontext der [Angleichung](#angleichung) gemeint, dass diese regelmäßig, aber nicht zwangsweise sofort erfolgt.

- ## Deklarative Beschreibung

    Eine Konfiguration, die den gewünschten [Soll-Zustand](#soll-zustand) eines Systems beschreibt, ohne Vorgehensweisen zu definieren wie dieser erreicht wird.
    Dies erzielt die Trennung der Konfiguration (Soll-Zustand) von der Implementierung (Befehle, API-Aufrufe, Skripte usw.), die verwendet wird, um den gewünschten Zustand zu erreichen.

- ## Soll-Zustand

    Die Gesamtheit aller Konfigurationen, die es braucht, um ein sich gleichverhaltendes System wiederherzustellen.
    Diese Konfigurationen enthalten im Allgemeinen keine gespeicherten Anwendungsdaten wie z.B. Datenbankinhalte, wohl aber die entsprechenden Zugangsdaten für den Zugriff darauf oder Einstellungen für Wiederherstellungs-Tools des Systems.

- ## Abweichung

    Abweichung bezeichnet eine (beginnende) Entfernung des Ist-Zustandes eines Systems vom gewünschten [Soll-Zustand](#soll-zustand).

- ## Angleichung

    Der Prozess, bei dem sichergestellt wird, dass der tatsächliche Zustand eines Systems mit seinem [Soll-Zustand](#soll-zustand) übereinstimmt.
    
    Im Gegensatz zur traditionellen CI/CD, bei der die Automatisierung im Allgemeinen durch voreingestellte Auslöser gesteuert wird, wird bei GitOps die Angleichung immer dann ausgelöst, wenn eine Abweichung vorliegt.

    Die [Abweichung](#abweichung) kann darauf zurückzuführen sein, dass sich der Ist-Zustand unbeabsichtigt geändert hat oder dass eine neue Version der Soll-Zustands-Beschreibung vorliegt.

    Auf der Grundlage von Richtlinien und [Feedback](#feedback) des Systems sowie früherer Angleichungsversuche werden Maßnahmen ergriffen, um die Abweichung im Laufe der Zeit zu verringern.

- ## Softwaresystem

    Ein mittels GitOps verwaltetes Softwaresystem beinhaltet:

    1. Eine oder mehrere Laufzeitumgebungen, die aus verwalteten Ressourcen bestehen
    1. Verwaltungs-Agenten innerhalb jeder einzelnen Laufzeitumgebung
    1. Richtlinien zur Steuerung des Zugriffs sowie der Verwaltung der Repositorys, Deployments und Laufzeitumgebungen

- ## Zustandsspeicher

    Ein System, um unveränderliche Versionen der Beschreibung des [Soll-Zustand](#soll-zustand) zu speichern.
    Dieser Speicher sollte Zugriffssteuerung und Audits der Änderungen des Soll-Zustands unterstützen.
    Git, von dem sich der Name GitOps ableitet, ist das kanonische Beispiel für diesen Speicher, aber jedes System das die genannten Bedingungen erfüllt, kann benutzt werden.
    In jedem Fall muss der Speicher ordnungsgemäß konfiguriert sein und Maßnahmen getroffen werden, um den Anforderungen der GitOps-Prinzipien gerecht zu werden.

- ## Feedback

    GitOps folgt der [Kontrolltheorie](https://de.wikipedia.org/wiki/Kontrolltheorie) und wird in einem geschlossenen Kreislauf betrieben.
    In der Kontrolltheorie beschreibt die Rückmeldung, wie frühere Versuche, einen [Soll-Zustand](#soll-zustand) anzuwenden, den tatsächlichen Zustand beeinflusst haben.
    Verlangt beispielsweise der Soll-Zustand mehr Ressourcen als in einem System vorhanden sind, könnte der Software-Agent versuchen, automatisch zu einer vorherigen Version zurückzurollen oder menschlichen Betreibern einen Alarm senden.
