# Zasady GitOps (ang. GitOps Principles) {{version}}

GitOps to zbiór zasad obsługi i zarządzania systemami oprogramowania.
Zasady te wywodzą się z nowoczesnych operacji programistycznych, ale są również zakorzenione w istniejących i powszechnie stosowanych najlepszych praktykach.

[Pożądany Stan](./GLOSSARY_pl.md#pożądany-stan) w systemie zarządzanym przez GitOps musi być: 

1. ## Deklaratywny (ang. Declarative)

    [System](./GLOSSARY_pl.md#system-oprogramowania) zarządzany przez GitOps musi mieć swój  pożądany stan określony [deklaratywnie](./GLOSSARY_pl.md#opis-deklaratywny).

2. ## Wersjonowany and Niezmienny (ang. Versioned and Immutable)

    Pożądany stan jest przechowywany w [magazynie stanow](./GLOSSARY_pl.md#magazyn-stanów) w sposób, który wymusza niezmienność, wersjonowanie i zachowuje pełną historię wersji.

3. ## Ściągany automatycznie (ang. Pulled Automatically)

    Agenci automatycznie [ściągają](./GLOSSARY_pl.md#ściąganie) pożądany stan z deklaracji źródłowej.

4. ## Stale uzgadniany (ang. Continuously Reconciled)

    Agenci [w sposób ciągły](./GLOSSARY_pl.md#ciągły) obserwują rzeczywisty stan systemu i [próbują zaaplikować](./GLOSSARY_pl.md#uzgadnianie) pożądany stan.
