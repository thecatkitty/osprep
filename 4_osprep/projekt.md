Operating System Preparation Utility
====================================
Narzędzie przygotowawcze dla alternatywnych systemów operacyjnych. Operować będzie na plikach konfiguracyjnych będących skryptami GNU Make. Pakiety będą skompresowane formatem XZ/TXZ, zaś ich metadane będą zapisane w _polskim_ (stosującym średniki) formacie CSV.

`osprep.sh` - wywołanie pełnoekranowego interfejsu interaktywnego (opartego o `dialog`) będącego _opakowaniem_ dla wszystkich poleceń tekstowych

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

`<url>` - opcjonalny adres nowego repozytorium zdalnego (domyślnie `http://pkg.svc.celones.pl/osprep/`)

bases
------------
Wyświetlenie listy dostępnych obrazów bazowych.

`osprep.sh bases`

base
-------------
Wybór obrazu bazowego.

`osprep.sh base <nazwa>[~<wersja>]`

np. `osprep.sh base com.microsoft.ms-dos~8.0`

packages
-------------
Wyświetlenie listy pakietów dostępnych dla danego obrazu bazowego.

`osprep.sh packages`

add
-------------
Dodanie pakietu.

`osprep.sh add <nazwa>[~<wersja>]`

`osprep.sh add com.jelcyn.zdzich`

remove
--------------
Usunięcie pakietu.

`osprep.sh remove <nazwa>`

set
---
`osprep.sh set` - wyświetlenie ustawień

`osprep.sh set <nazwa>` - wyświetlenie wartości

`osprep.sh set <nazwa> <wartość>` - ustawienie wartości

np. `osprep.sh set keyboard pl`

apply
-----
Zastosowanie zmian (tzn. wygenerowanie katalogu wyjściowego w katalogu roboczym).

`osprep.sh apply <dir>` / `make apply`

1. Pobranie obrazu bazowego.

2. Pobranie wybranych pakietów.

3. Rozpakowanie obrazu.

4. Rozpakowanie pakietów.

5. Zastosowanie ustawień.

discard
-------
Anulowanie zmian (tzn. skasowanie generowanego skryptu dla `apply`).

`osprep.sh discard` / `make clean`

image
-----
Utworzenie obrazu uruchomieniowego (np. ISO, IMG, VFD).

`osprep.sh image <dir>` / `make image`

`<dir>` - katalog wyjściowy
