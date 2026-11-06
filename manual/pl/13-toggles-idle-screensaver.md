# Przełączniki, bezczynność i wygaszacz ekranu

Wiele z tego, co zmieniasz na co dzień, tak naprawdę nie jest ustawieniem. To tryb, który włączasz na godzinę i z powrotem wyłączasz: światło nocne, gdy pracujesz do późna, nie przeszkadzać, gdy prowadzisz prezentację, czuwanie, gdy coś oglądasz. Collie nazywa je przełącznikami i wszystkie działają w ten sam sposób — skrót klawiszowy, pozycja w menu i komenda, wszystkie trafiające w ten sam przełącznik.

### Menu przełączników

`Super + Ctrl + O` otwiera bezpośrednio _Trigger > Toggle_, albo możesz dojść tam z menu Collie (`Super + Space`). Wszystko na tej liście to przełącznik, który możesz przełączyć, nie zastanawiając się, gdzie przechowywany jest stan. Przełączniki dotyczące wyglądu pulpitu znajdują się tuż obok, w _Appearance_.

Z terminala te same przełączniki to `collie toggle <thing>`. Uruchom samo `collie toggle`, aby zobaczyć całą grupę.

| Przełącznik | Skrót klawiszowy | Komenda |
| ------ | ------ | ------- |
| Światło nocne | — | `collie toggle nightlight` |
| Wyciszenie powiadomień | `Super + Ctrl + Alt + ,` | `collie toggle notification silencing` |
| Czuwanie (brak blokady przy bezczynności) | `Super + Ctrl + I` | `collie toggle idle` |
| Przechwytywanie awarii | — | `collie toggle crash-capture` |
| Wygaszacz ekranu | — | `collie toggle screensaver` |
| [Herdr](https://herdr.dev) synchronizacja motywu | — | `collie toggle theme sync` |
| Pasek menu | `Super + Shift + Space` | `collie toggle bar` |
| Panel dotykowy | `XF86TouchpadToggle` | `collie toggle touchpad` |
| Ekran dotykowy | — | `collie toggle touchscreen` |
| Wstrzymanie | — | `collie toggle suspend` |
| Hybrydowy GPU | — | `collie toggle hybrid gpu` |

Przełączniki panelu dotykowego, ekranu dotykowego i hybrydowego GPU znajdują się w _Trigger > Hardware_ (`Super + Ctrl + H`), a nie w Toggle, bo pojawiają się tylko wtedy, gdy faktycznie masz taki sprzęt. Te od panelu dotykowego i ekranu dotykowego przetrwają przeładowanie Hyprland — nazwa wyłączonego urządzenia jest zapisywana w małym pliku stanu, który Hyprland odczytuje przy starcie, aby ponownie je wyłączyć.

_Appearance_ zawiera pasek menu i animacje, a także kilka rzeczy, które nie są komendami `collie toggle`, ale zachowują się tak samo: procent baterii na pasku, domyślny układ obszaru roboczego oraz, w _Windows_, odstępy okien (`Super + Shift + Backspace`) i proporcje kwadratu przy 1 oknie (`Super + Ctrl + Backspace`).

Gdy Hyprland nie ma GPU, na którym mógłby rysować, i renderuje zamiast tego na CPU (llvmpipe), jak na Macach, których GPU nie jest jeszcze obsługiwane, w większości maszyn wirtualnych lub gdy sterownik graficzny nie wczyta się, Collie wyłącza animacje, rozmycie i cienie na tę sesję i informuje cię o tym raz powiadomieniem. _Appearance > Animations On_ przywraca je, a Collie zapamiętuje to także na późniejsze sesje.

Większość z nich to po prostu plik flagi w `~/.local/state/collie/toggles/`. Jeśli chcesz rozgałęziać na podstawie któregoś z nich w skrypcie, `collie-toggle-enabled` zwraca ci kod wyjścia, zamiast zmuszać cię do szukania:

```bash
collie-toggle-enabled screensaver-off && echo "screensaver is off"
```

Flagi są nazwane od stanu wyłączonego — `screensaver-off`, `suspend-off`, `bar-off` — więc ich obecność oznacza, że funkcja jest wyłączona.

### Wskaźniki na pasku

Gdy tryb jest włączony, na środku górnego paska obok zegara pojawia się mały glif. To widżet wskaźników i obejmuje dyktowanie, nagrywanie ekranu, oczekujące przypomnienia, światło nocne, nie przeszkadzać oraz czuwanie.

Nieaktywne wskaźniki są ukryte. Najedź kursorem w dowolne miejsce na pasku, a pojawią się przyciemnione, więc możesz kliknąć jeden z nich, aby go włączyć, bez znajomości jego skrótu klawiszowego. Kliknięcie aktywnego wyłącza go z powrotem. Jeśli wolisz widzieć je wszystkie przez cały czas, ustaw `alwaysShow` na `true` we wpisie `collie.indicators` w `~/.config/collie/shell.json` — zobacz [górny pasek](05-the-top-bar.md), aby dowiedzieć się, jak konfiguruje się widżety paska.

### Światło nocne

Światło nocne ociepla ekran do 4000K, a ponowne przełączenie przywraca 6500K. Przełącz je z menu przełączników (`Super + Ctrl + O`) lub za pomocą `collie toggle nightlight`. Napędza je hyprsunset, który przełącznik uruchamia za ciebie, jeśli jeszcze nie działa.

Domyślnie hyprsunset w ogóle nic nie robi z twoim ekranem. `~/.config/hypr/hyprsunset.conf` jest dostarczany z profilem tożsamości właśnie po to, aby wyświetlacz pozostał nietknięty, dopóki nie poprosisz o ocieplenie. Jeśli wolisz, aby przełączał się według zegara, zamień go na profil czasowy:

```
profile {
    time = 20:00
    temperature = 4000
}
```

Następnie uruchamiaj hyprsunset przy logowaniu, dodając `o.launch_on_start("hyprsunset")` do `~/.config/hypr/autostart.lua`. Para 4000K/6500K używana przez przełącznik jest stała, więc jeśli chcesz innej temperatury, miejscem do zmiany jest plik konfiguracyjny.

### Nie przeszkadzać

`Super + Ctrl + Alt + ,` wycisza powiadomienia. Gdy jest włączone, nie wyskakują żadne powiadomienia, a wskaźnik przekreślonego dzwonka siedzi na pasku, aby przypominać ci, dlaczego na pulpicie zrobiło się cicho.

Nic jednak nie ginie. Wyciszone powiadomienia są wstrzymywane: przywróć kilka ostatnich na ekran za pomocą `Super + Shift + Alt + ,`. Resztę znajdziesz w [powiadomieniach](10-notices.md).

Dwa rodzaje wiadomości nadal się przedostają: własne powiadomienia potwierdzające Collie dla czegoś, co właśnie zrobiłeś ("Theme changed", "Screenshot saved"), oraz krytyczne alerty wysłane z wiersza poleceń. Aplikacje czatu, które oznaczają wszystko jako krytyczne, aby na siłę przebić się przed ciebie, się nie kwalifikują.

### Bezczynność

Powłoka Collie zarządza zachowaniem przy bezczynności, a czasy określa blok `idle` na najwyższym poziomie w `~/.config/collie/shell.json`:

```json
{
  "version": 1,
  "idle": {
    "screensaver": 150,
    "lock": 300
  }
}
```

Obie liczby to sekundy liczone od momentu przejścia w bezczynność — nie od siebie nawzajem. Przy ustawieniach domyślnych wygaszacz ekranu pojawia się więc po dwóch i pół minuty, a ekran blokady przejmuje kontrolę po pięciu minutach, niezależnie od tego, czy wygaszacz się uruchomił. Zapisz plik, a powłoka od razu przejmie nowe czasy.

Jeśli odrzucisz wygaszacz ekranu przed upływem czasu blokady, liczy się to jako aktywność i oczekująca blokada zostaje anulowana. Nie zostaniesz zablokowany za zerkanie na swoją maszynę.

Aby całkowicie wyłączyć blokowanie przy bezczynności, `Super + Ctrl + I` — lub `collie toggle idle` — włącza czuwanie, a na pasku pojawia się wskaźnik filiżanki kawy. To ten, który należy wcisnąć przed długą prezentacją albo kompilacją, którą chcesz obserwować. Wciśnij go ponownie, aby wrócić do normalnego trybu. `collie toggle idle status` wypisuje bieżący stan jako JSON, jeśli potrzebujesz go ze skryptu.

Chodzi tu o blokowanie i wygaszacz ekranu, nie o zasilanie. Wstrzymanie i hibernacja mają własną konfigurację w [uśpieniu systemu](36-system-sleep.md).

### Wygaszacz ekranu

Wygaszacz ekranu Collie to grafika ASCII przechodząca przez losowe efekty tekstowe, jedna instancja na monitor. Dowolny klawisz lub ruch myszy go wyłącza.

Możesz uruchomić go na żądanie z _System > Screensaver_ (`Super + Esc`), co wymusza jego pojawienie się, nawet jeśli wyłączyłeś wygaszacz przy bezczynności. Domyślnie nie jest do niego przypisany żaden skrót klawiszowy.

`collie toggle screensaver` wyłącza ten przy bezczynności, jeśli wolisz przechodzić prosto od pracy do blokady. Dowolny klawisz, kliknięcie, przewinięcie lub ruch myszy go zamyka.

Logo, które rysuje, możesz zmienić w _Appearance > Branding > Screensaver_. Prześlij png lub svg, a Collie przekształci je na ASCII. Zobacz [branding](41-branding.md).

### Ekran blokady

`Super + Ctrl + L` blokuje maszynę. Uruchamia to ekran blokady z powłoki Collie, wygasza wyświetlacz, resetuje układ klawiatury do pierwszego, abyś nie wpisywał hasła w złym alfabecie, oraz — jeśli masz go uruchomionego — blokuje po drodze 1Password.

Ekran blokady przyjmuje hasło, a przyjmie też odcisk palca, gdy już go skonfigurujesz. To oraz inne sposoby uwierzytelniania opisano w [uwierzytelnianiu sprzętowym](37-hardware-authentication.md).
