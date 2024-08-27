# Glosariusz GitOps {{version}}

Ten glosariusz jest powiązany z [Zasady GitOps](./PRINCIPLES_pl.md) i innymi dokumentami pomocniczymi w tym repozytorium. 

- ## Ciągły (ang. Continuous)

"Ciągły" jest związany ze standardowym terminem: [Uzgadnianie](#Uzgadnianie) (ang. Reconciliation) co oznacza, że następuje to ciągle, ale nie oznacza to, że musi to nastąpic natychmiastowo.

- ## Opis Deklaratywny (ang. Declarative Description)

    Konfiguracja, która opisuje pożądanany stan systemu, bez podawania specyficznych procedur określających w jaki sposób ten stan będzie osiagniety. To oddziela konfigurację stanu pożądanego (pożądany-stan) od implementacji (commands, API calls, scripts etc.) używanej do osiągniecia tego stanu.

- ## Stan Pożądany (ang. Desired State)

Agregacja wszystkich danych dotyczących konfiguracji, które wystarczają żeby odtworzyć system w taki sposób, żeby instancje systemu były behawioralnie nie do odróżnienia.
Te dane konfiguracyjne generalnie nie zawieraja trwałych danych aplikacji, jak na przykład zawartość bazy danych, chociaż często zawiera poświadczenia dostępu do tych danych lub konfigurację narzędzi do odzyskiwania danych działających w tym systemie.
    
- ## Dryf 
(ang. Drift)

Kiedy rzeczywisty stan systemu przesunął się lub jest w trakcie oddalania się od [stanu pożądanego](#stan-pożądany), często określa się to jako dryf.

- ## Ściąganie (ang. Pull)

    [Zasada 3](./PRINCIPLES.md) (Pulled Automatycznie) określa, że ​​pożądany stan musi zostać ściągany (pulled), a nie wypchnięty (pushed), przede wszystkim dlatego, że agent musi mieć możliwość dostępu do [pożądanego stanu](#pożądany-stan) z [magazynu stanów](#magazyn-stanów) w dowolnym momencie, a nie tylko wtedy, gdy nastąpi celowa zmiana w magazynie stanów wyzwaląjca push event.
    Jest to warunek konieczny, aby [uzgadnianie](#uzgadnianie) odbywało się [ciągle](#Ciągły), jak określono w [zasadzie 4](./PRINCIPLES.md) (Ciągle uzgadniany).
    Należy pamiętać, że w przeciwieństwie do tradycyjnego CI/CD, gdzie automatyzacja jest zazwyczaj wyzwalana przez wstępnie ustawione triggery – w GitOps [uzgadnianie](#uzgadnianie) jest wyzwalane zawsze kiedy występuje rozbieżność.
    Rozbieżność może być spowodowana niezamierzonym [dryftem](#dryft) rzeczywistego stanu od deklaracji pożądanego stanu a nie tylko celową zmianą wersji deklaracji pożądanego stanu.

- ## Uzgadnianie (agn. Reconciliation)

    Proces mający na celu zapewnienie, że rzeczywisty stan systemu odpowiada [pożądanemu stanowi](#stan-pożądany).
    W przeciwieństwie do tradycyjnego CI/CD, gdzie automatyzacja jest zazwyczaj wyzwalana przez wstępnie ustawione triggery, w GitOps uzgadnianie jest inicjowane zawsze kiedy występuje rozbieżność. Rozbieżność może być spowodowana niezamierzonym [dryftem](#dryft) rzeczywistego stanu od deklaracji pożądanego stanu lub celową zmianą wersji deklaracji pożądanego stanu.
    Działania są podejmowane na podstawie zasad dotyczących [opinii](/GLOSSARY_pl.md-opinie) systemu oraz wcześniejszych prób uzgadniania, w celu zmniejszenia dewjacji w czasie.

- ## System (ang. Software System)

    System zarządzany przez GitOps zawiera:

    1. Jeden lub więcej środowisk wykonawczych składających się z zasobów podlegających zarządzaniu
    1. Agentów zarządzających każde środowisko wykonawcze
    1. Zasady kontrolowania dostępu i zarządzania repozytoriami, wdrożeniami i środowiskami wykonawczymi

- ## Maganzyn Stanów (ang. State Store)

    System służący do przechowywania niezmiennych wersji deklaracji [stanu pożądanego](#pożądany-stan).
    Magazyn stanów powinien umożliwiać kontrolę dostępu i audyt zmian stanu pożądanego.     
    Git, od którego GitOps wzięło swoją nazwę, jest kanonicznym przykładem używanym jako magazyn stanów, ale można użyć dowolnego innego systemu spełniającego te kryteria.
    We wszystkich przypadkach magazyny stanów muszą być prawidłowo skonfigurowane i należy podjąć środki ostrożności, aby spełnić wymagania określone w [Zasady GitOps].

- ## Opinie (ang. Feedback)

    Open GitOps przestrzega [control-theory](https://en.wikipedia.org/wiki/Control_theory) i operuje w pętli zamkniętej. W teorii kontroli, opinie określają, w jaki sposób     poprzednie próby zastosowania pożądanego stanu wpłynęły na stan rzeczywisty. Na przykład, jeśli pożądany stan wymaga więcej zasobów niż istnieje w systemie, agent może podjąć próby dodania zasobów, żeby automatycznie przywrócić poprzednią wersję lub wysłać ostrzeżenie do operatorów. 
