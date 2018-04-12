Operating System Preparation Utility
====================================
Narzędzie przygotowawcze dla alternatywnych systemów operacyjnych.

`osprep.sh` - wywołanie pełnoekranowego interfejsu interaktywnego

`osprep.sh <polecenie> <opcje>` - wywołanie polecenia

`osprep.sh --version`, `osprep.sh -v` - informacja o wersji

`osprep.sh --help`, `osprep.sh -h` - pomoc


Opcje wspólne dla wszystkich poleceń
------------------------------------
`--local`, `-l` - korzystanie już pobranych pakietów

`--format=<fmt>`, `-f<fmt>` - format wyjścia programu

* `text` - zwykły tekst

* `csv` - wartości oddzielone średnikami

`--verbose` - szczegółowe wyjście


update
------
Aktualizacja lokalnego repozytorium konfiguracji zestawów.

`osprep.sh update [<url>]`

`<url>` - opcjonalny adres nowego repozytorium zdalnego

bases
------------
Wyświetlenie listy dostępnych obrazów bazowych.

base
-------------
Wybór obrazu bazowego.

packages
-------------
Wyświetlenie listy dostępnych pakietów.

add
-------------
Dodanie pakietu.

remove
--------------
Usunięcie pakietu.

set
---
`osprep.sh set` - wyświetlenie ustawień

`osprep.sh set <nazwa>` - wyświetlenie wartości

`osprep.sh set <nazwa> <wartość>` - ustawienie wartości

apply
-----
Zastosowanie zmian.

1. Pobranie obrazu bazowego.

2. Pobranie wybranych pakietów.

3. Rozpakowanie obrazu.

4. Rozpakowanie pakietów.

5. Zastosowanie ustawień.

discard
-------
Anulowanie zmian.

image
-----
Utworzenie obrazu uruchomieniowego.

`osprep.sh image <dir>`

`<dir>` - katalog wyjściowy
