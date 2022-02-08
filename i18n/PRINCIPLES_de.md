## GitOps-Prinzipien {{version}}

GitOps ist eine Sammlung von Prinzipien für den Betrieb und die Verwaltung von Softwaresystemen.
Diese Prinzipien sind aus dem modernen Softwarebetrieb abgeleitet, basieren aber auf existierenden und verbreiteten Best Practices.

Der [Soll-Zustand](./GLOSSARY_de.md#soll-zustand) eines mittels GitOps verwalteten Systems muss folgende Eigenschaften erfüllen:

1. **Deklarativ**

    Der Soll-Zustand eines durch GitOps verwalteten [Systems](./GLOSSARY_de.md#softwaresystem) muss [deklarativ](./GLOSSARY_de.md#deklarative-beschreibung) beschrieben sein.

2. **Versioniert und unveränderlich**

    Der Soll-Zustand wird in einer Weise [gespeichert](./GLOSSARY_de.md#zustandsspeicher), die Unveränderlichkeit sowie Versionierung erzwingt und die vollständige Historie erhält.

3. **Automatisch bezogen**

    Software-Agenten beziehen den beschriebenen Soll-Zustand automatisch.

4. **Kontinuierlich angeglichen**

    Software-Agenten beobachten den tatsächlichen Systemzustand und versuchen [kontinuierlich](./GLOSSARY_de.md#kontinuierlich), ihn dem Soll-Zustand [anzugleichen](./GLOSSARY_de.md#angleichung).
