# Dotfiles

Collie konfiguruje się przede wszystkim przez tzw. dotfiles, które mieszkają w `~/.config`. Są one uznawane za twoje pliki do twoich zmian. Pliki, które mieszkają w `/usr/share/collie`, należą do samego Collie i nie powinieneś przy nich grzebać. Jeśli musisz zmienić cokolwiek w `/usr/share/collie`, powinieneś zamiast tego nadpisać wartość w `~/.config`.

Najważniejsze konfiguracje możesz edytować prosto z menu Collie (`Super + Space`), na przykład _Setup > Keyboard > Keybindings_, _Setup > Input_ i _Setup > Config > [file]_. Gdy zrobisz to w ten sposób, każdy proces, który wymaga ponownego uruchomienia po edycji konfiguracji, zostanie automatycznie uruchomiony ponownie po wyjściu z edytora (domyślnie Neovim — `:wq`, pamiętaj! — ale możesz to zmienić przez _Setup > Defaults > Editor_).

Oto lista najważniejszych plików w `~/.config` i tego, czym sterują:

| Plik                  | Przeznaczenie              |
| ----------------------- | --------------------- |
| `~/.config/hypr/hyprland.lua` | Główna konfiguracja Hyprland. Wczytuje domyślne ustawienia Collie oraz twoje pliki nadpisujące poniżej. [Dowiedz się więcej o konfiguracjach Hyprland](https://wiki.hypr.land/Configuring/).  |
| `~/.config/hypr/bindings.lua` | Twoje własne skróty klawiszowe i nadpisania domyślnych. |
| `~/.config/hypr/monitors.lua` | Ustawienia monitora, których nie obejmuje panel monitorów, takie jak obrót, dodatkowe tryby lub pozostawienie monitora wyłączonego. |
| `~/.config/hypr/input.lua` | Steruje układem klawiatury oraz ustawieniami myszy i touchpada. |
| `~/.config/hypr/looknfeel.lua` | Steruje odstępami, ramkami, animacjami i resztą wyglądu. |
| `~/.config/hypr/autostart.lua` | Steruje dodatkowymi procesami uruchamianymi wraz z sesją. |
| `~/.config/collie/shell.json` | Steruje powłoką Collie: pozycją paska, układem i widżetami, a także czasami wygaszacza ekranu, blokady i bezczynności. |
| `~/.config/foot/foot.ini` | Steruje twoim terminalem (foot jest domyślny). |
| `~/.XCompose` | Definiuje twoje emoji do szybkiego dostępu oraz autouzupełnianie nazwy i adresu e-mail. Po wprowadzeniu zmian koniecznie uruchom `collie-restart-xcompose`. |

Jeśli ostatecznie wprowadzisz wiele zmian, aby dopracować własną konfigurację, dobrze jest zrobić kopię zapasową wszystkich tych dotfiles. [Stow to świetny sposób, aby to zrobić](https://www.youtube.com/watch?v=NoFiYOqnC4o).

### Uruchamianie własnych aplikacji wraz z sesją

Jeśli chcesz, aby coś uruchamiało się za każdym razem, gdy się logujesz — demon synchronizacji, aplikacja do czatu, twój własny skrypt — umieść to w `~/.config/hypr/autostart.lua`:

```lua
o.launch_on_start("my-service")
```

To uruchamia polecenie jako część sesji, więc zostanie ono poprawnie posprzątane, gdy ponownie się wylogujesz.

### Uruchamianie skryptów przy zdarzeniach systemowych

Collie odpala hooki w kilku momentach, a ty możesz podpiąć do nich własne skrypty. Mieszkają one w `~/.config/collie/hooks/<event>.d/`, jeden katalog na zdarzenie, a każdy plik wykonywalny w środku uruchamia się, gdy nastąpi dane zdarzenie:

| Zdarzenie | Kiedy się uruchamia |
| ----- | ------------ |
| `post-boot` | Zaraz po uruchomieniu pulpitu |
| `post-update` | Pod koniec `collie update`, po pakietach, migracjach i ponownych uruchomieniach usług, przed aktualizacją narzędzi mise |
| `pre-refresh-pacman` | Po tym, jak `collie refresh pacman` ponownie zsynchronizuje konfigurację pakietów, przed aktualizacją pakietów; przełączenie kanału uruchamia go podczas tego samego kroku odświeżania |
| `theme-set` | Po zmianie motywu (nazwa motywu w `$1`) |
| `font-set` | Po zmianie czcionki (nazwa czcionki w `$1`) |
| `battery-low` | Gdy poziom baterii jest niski (wartość procentowa w `$1`) |

Hook `pre-refresh-pacman` to miejsce, do którego należą własne repozytoria lub wiersze `IgnorePkg`, ponieważ uruchamia się przed transakcją pakietów. Oba hooki związane z aktualizacją działają jako twój użytkownik po tym, jak Collie wyczyści swoją zapamiętaną autoryzację sudo, więc hook używający `sudo` potrzebuje własnej autoryzacji i może poprosić cię o hasło.

Każdy z tych katalogów zawiera już plik `.sample` pokazujący kształt hooka — usuń `.sample` z nazwy, aby zaczął działać. Aby zainstalować skrypt napisany gdzie indziej, użyj `collie hook install post-boot ~/my-hook`, co skopiuje go na miejsce i nada mu uprawnienia do wykonywania.

### Dodawanie własnych pozycji menu

Menu Collie (`Super + Space`) możesz rozszerzyć o własne wiersze, edytując `~/.config/collie/extensions/collie-menu.jsonc`. Pozycje są kluczowane identyfikatorem z kropkami, a to właśnie identyfikator umieszcza je w drzewie, więc `personal` pojawia się w menu głównym, a `personal.notes` pojawia się wewnątrz niego:

```jsonc
"personal": {"icon":"","label":"Personal"},
"personal.notes": {"icon":"󰎞","label":"Notes","action":"collie-launch-editor ~/notes"},
```

Użyj ponownie istniejącego identyfikatora, a nadpiszesz ten wiersz zamiast dodać nowy. Plik jest dostarczany ze wszystkimi dostępnymi polami udokumentowanymi jako komentarze.

### Dodawanie własnych eksportów powłoki, funkcji i aliasów

Collie dostarcza zestaw ergonomicznych aliasów i pomocnych funkcji, ale bardzo często chcesz dodać własne. Zarówno aliasy, funkcje, jak i eksporty powinieneś dodawać w `~/.bashrc`. Ten plik nie zostanie nadpisany podczas aktualizacji. Jeśli chcesz zmienić dowolne domyślne ustawienia Collie, możesz je również bezpiecznie dodać tutaj.

### Ustawianie zmiennych środowiskowych dla pulpitu

Eksporty sesji pulpitu należą do `~/.config/uwsm/env.d/`. Pliki te działają przed uruchomieniem pulpitu, więc błąd powłoki może odesłać cię z powrotem na ekran logowania. Podczas ich edycji miej otwarty działający terminal. Aby wyłączyć nadpisanie, przenieś je poza `env.d`. Zobacz [odzyskiwanie logowania](45-troubleshooting.md#my-password-is-accepted-but-i-return-to-the-login-screen), jeśli zmiana uniemożliwia zalogowanie.

### Zmienianie wewnętrznych plików Collie

Słuchaj, to twój komputer. Możesz z nim robić, co tylko chcesz, ale odradzałbym wprowadzanie zmian bezpośrednio w plikach w `/usr/share/collie`. Należą one do pakietu pacman Collie, więc twoje zmiany zostaną po prostu nadpisane przy następnej aktualizacji. Zamiast tego lepiej po prostu nadpisać w folderze `~/.config/*` wszystkie domyślne wartości, które ci się nie podobają.

W ten sposób możesz zmienić prawie wszystko, na przykład domyślne skróty klawiszowe. Wystarczy edytować `~/.config/hypr/bindings.lua`, aby, powiedzmy, zastąpić [Obsidian](https://obsidian.md/) przez [Joplin](https://joplinapp.org/) (zainstaluj za pomocą `collie-pkg-add joplin-bin`):

```lua
o.rebind("SUPER + SHIFT + O", "Joplin", "joplin-desktop")
```

`o.rebind` usuwa istniejące przypisanie przed dodaniem jego zamiennika. Przyjmuje te same argumenty co `o.bind`, w tym funkcje pomocnicze do uruchamiania i opcje przypisań. Użyj `o.bind`, aby dodać przypisanie, lub `hl.unbind`, aby usunąć je bez zastępowania.

Jeśli upierasz się przy grzebaniu w wewnętrznych plikach Collie, przełącz się na kanał dev przez _Update > Channel > Dev_. To połączy Collie z kopią roboczą git kodu źródłowego w `~/collie`, którą możesz zmieniać do woli. Nikt tu nie będzie ci mówił, co masz robić!

### Resetowanie wszelkich zmian

Jeśli narobisz bałaganu w konfiguracjach, zawsze możesz przywrócić je do wartości domyślnych przez _Update > Config_ w menu Collie. Albo uruchamiając `collie reinstall configs`, aby zresetować wszystko.
