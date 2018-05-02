Operating System Preparation Utility
====================================
Narzędzie przygotowawcze dla alternatywnych systemów operacyjnych. Operować będzie na plikach konfiguracyjnych będących skryptami GNU Make. Pakiety będą skompresowane formatem XZ/TXZ, zaś ich metadane będą zapisane w _polskim_ (stosującym średniki) formacie CSV.

`osprep` - wywołanie pełnoekranowego interfejsu interaktywnego (opartego o `dialog`) będącego _opakowaniem_ dla wszystkich poleceń tekstowych

`osprep <polecenie> <opcje>` - wywołanie polecenia

`osprep --version`, `osprep -v` - informacja o wersji

`osprep --help`, `osprep -h` - pomoc


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

`osprep update [<url>]`

`<url>` - opcjonalny adres nowego repozytorium zdalnego (domyślnie `http://pkg.svc.celones.pl/osprep/`)

bases
------------
Wyświetlenie listy dostępnych obrazów bazowych.

`osprep bases`

base
-------------
Wybór obrazu bazowego.

`osprep base <nazwa>[~<wersja>]`

np. `osprep base com.microsoft.ms-dos~8.0`

packages
-------------
Wyświetlenie listy pakietów dostępnych dla danego obrazu bazowego.

`osprep packages`

add
-------------
Dodanie pakietu.

`osprep add <nazwa>[~<wersja>]`

`osprep add com.jelcyn.zdzich`

list
-------------
Wyświetlenie listy wybranych pakietów.

`osprep list`

remove
--------------
Usunięcie pakietu.

`osprep remove <nazwa>`

set
---
`osprep set` - wyświetlenie ustawień

`osprep set <nazwa>` - wyświetlenie wartości

`osprep set <nazwa> <wartość>` - ustawienie wartości

np. `osprep set keyboard pl`

apply
-----
Zastosowanie zmian (tzn. wygenerowanie katalogu wyjściowego w katalogu roboczym).

`osprep apply <dir>` / `make apply`

1. Pobranie obrazu bazowego.

2. Pobranie wybranych pakietów.

3. Rozpakowanie obrazu.

4. Rozpakowanie pakietów.

5. Zastosowanie ustawień.

discard
-------
Anulowanie zmian (tzn. skasowanie generowanego skryptu dla `apply`).

`osprep discard` / `make clean`

image
-----
Utworzenie obrazu uruchomieniowego (np. ISO, IMG, VFD).

`osprep image <dir>` / `make image`

`<dir>` - katalog wyjściowy
