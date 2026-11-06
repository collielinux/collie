# Prepínače, nečinnosť a šetrič obrazovky

Veľa z toho, čo meníte každý deň, vlastne nie je nastavenie. Je to režim, ktorý zapnete na hodinu a potom zase vypnete: nočné svetlo, keď pracujete do noci, režim nerušiť, keď prezentujete, zostať bdelý, keď niečo pozeráte. Collie ich nazýva prepínače a všetky fungujú rovnako — klávesová skratka, položka v menu a príkaz, všetky trafia ten istý prepínač.

### Menu prepínačov

`Super + Ctrl + O` otvorí priamo _Spúšťač > Prepínač_, alebo sa tam môžete dostať z menu Collie (`Super + Space`). Všetko v tom zozname je prepínač, ktorý môžete prepnúť bez premýšľania o tom, kde sa ukladá jeho stav. Prepínače toho, ako pracovná plocha vyzerá, nájdete hneď vedľa, pod _Vzhľad_.

Z terminálu sú tie isté prepínače `collie toggle <thing>`. Spustite `collie toggle` samostatne a uvidíte celú skupinu.

| Prepínač | Klávesová skratka | Príkaz |
| ------ | ------ | ------- |
| Nočné svetlo | — | `collie toggle nightlight` |
| Stíšenie oznámení | `Super + Ctrl + Alt + ,` | `collie toggle notification silencing` |
| Zostať bdelý (bez zamykania pri nečinnosti) | `Super + Ctrl + I` | `collie toggle idle` |
| Zachytávanie pádov | — | `collie toggle crash-capture` |
| Šetrič obrazovky | — | `collie toggle screensaver` |
| [Herdr](https://herdr.dev) synchronizácia témy | — | `collie toggle theme sync` |
| Lišta menu | `Super + Shift + Space` | `collie toggle bar` |
| Touchpad | `XF86TouchpadToggle` | `collie toggle touchpad` |
| Dotyková obrazovka | — | `collie toggle touchscreen` |
| Uspávanie | — | `collie toggle suspend` |
| Hybridná GPU | — | `collie toggle hybrid gpu` |

Prepínače touchpadu, dotykovej obrazovky a hybridnej GPU nájdete pod _Spúšťač > Hardvér_ (`Super + Ctrl + H`) namiesto pod Prepínač, pretože sa zobrazia len vtedy, keď taký hardvér skutočne máte. Prepínače touchpadu a dotykovej obrazovky prežijú opätovné načítanie Hyprland — názov vypnutého zariadenia sa uloží do malého súboru stavu, ktorý Hyprland pri spustení prečíta, aby ho znova vypol.

_Vzhľad_ obsahuje lištu menu a animácie plus niekoľko vecí, ktoré nie sú príkazmi `collie toggle`, ale správajú sa rovnako: percento batérie v lište, predvolené rozloženie pracovných plôch a pod _Okná_ medzery medzi oknami (`Super + Shift + Backspace`) a štvorcový pomer strán pri jednom okne (`Super + Ctrl + Backspace`).

Keď Hyprland nemá GPU, pomocou ktorej by kreslil, a vykresľuje namiesto toho na CPU (llvmpipe), ako na počítačoch Mac, ktorých GPU zatiaľ nie je podporovaná, vo väčšine virtuálnych počítačov alebo keď sa nepodarí načítať grafický ovládač, Collie pre danú reláciu vypne animácie, rozostrenie a tiene a raz vám to oznámi oznámením. _Vzhľad > Zapnúť animácie_ ich vráti späť a Collie si to zapamätá aj pre neskoršie relácie.

Väčšina z nich je len súbor s príznakom pod `~/.local/state/collie/toggles/`. Ak sa na niektorý chcete vo skripte vetviť, `collie-toggle-enabled` vám namiesto hľadania dá návratový kód:

```bash
collie-toggle-enabled screensaver-off && echo "screensaver is off"
```

Príznaky sú pomenované podľa vypnutého stavu — `screensaver-off`, `suspend-off`, `bar-off` — takže ich prítomnosť znamená, že funkcia je vypnutá.

### Indikátory v lište

Keď je režim zapnutý, v strede hornej lišty vedľa hodín sa zobrazí malý glyf. To je widget indikátorov a nesie diktovanie, nahrávanie obrazovky, čakajúce pripomienky, nočné svetlo, režim nerušiť a zostať bdelý.

Neaktívne indikátory sú skryté. Prejdite kurzorom kamkoľvek nad lištu a zobrazia sa stlmené, takže na niektorý môžete kliknúť a zapnúť ho bez toho, aby ste poznali jeho klávesovú skratku. Kliknutím na aktívny ho znova vypnete. Ak ich chcete radšej vidieť všetky stále, nastavte `alwaysShow` na `true` pri položke `collie.indicators` v `~/.config/collie/shell.json` — pozrite si [hornú lištu](05-the-top-bar.md), kde nájdete, ako sa widgety lišty konfigurujú.

### Nočné svetlo

Nočné svetlo zahreje obrazovku na 4000K a opätovným prepnutím ju vráti na 6500K. Prepnite ho z menu prepínačov (`Super + Ctrl + O`) alebo príkazom `collie toggle nightlight`. Poháňa ho hyprsunset, ktorý prepínač za vás spustí, ak ešte nebeží.

Predvolene hyprsunset s vašou obrazovkou nerobí vôbec nič. `~/.config/hypr/hyprsunset.conf` sa dodáva s profilom identity práve preto, aby displej zostal nedotknutý, kým nepožiadate o teplo. Ak chcete radšej, aby sa prepínal podľa hodín, nahraďte ho časovým profilom:

```
profile {
    time = 20:00
    temperature = 4000
}
```

Potom spustite hyprsunset pri prihlásení pridaním `o.launch_on_start("hyprsunset")` do `~/.config/hypr/autostart.lua`. Dvojica 4000K/6500K používaná prepínačom je pevná, takže ak chcete inú teplotu, musíte do konfiguračného súboru.

### Nerušiť

`Super + Ctrl + Alt + ,` stíši oznámenia. Kým je zapnuté, nevyskakujú žiadne toasty a prečiarknutý indikátor zvončeka sedí v lište, aby vám pripomínal, prečo pracovná plocha stíchla.

Nič sa však nestratí. Stíšené oznámenia sa podržia: posledných pár vrátite na obrazovku pomocou `Super + Shift + Alt + ,`. Zvyšok nájdete v [oznámeniach](10-notices.md).

Dva druhy správ aj tak prejdú: vlastné potvrdzovacie toasty Collie k niečomu, čo ste práve urobili ("Theme changed", "Screenshot saved"), a kritické upozornenia odoslané z príkazového riadka. Chatovacie aplikácie, ktoré označujú všetko za kritické, aby si vynútili cestu pred vás, sa nekvalifikujú.

### Nečinnosť

Správanie pri nečinnosti vlastní shell Collie a časy sú blokom `idle` na najvyššej úrovni v `~/.config/collie/shell.json`:

```json
{
  "version": 1,
  "idle": {
    "screensaver": 150,
    "lock": 300
  }
}
```

Obe čísla sú sekundy počítané od okamihu, keď ste prešli do nečinnosti — nie od seba navzájom. Takže s predvolenými hodnotami sa šetrič obrazovky objaví po dvoch a pol minútach a uzamknutá obrazovka prevezme miesto po piatich minútach, či už šetrič obrazovky bežal, alebo nie. Uložte súbor a shell si nové časy prevezme okamžite.

Ak šetrič obrazovky zrušíte pred termínom zamknutia, počíta sa to ako aktivita a čakajúce zamknutie sa zruší. Za letmý pohľad na počítač vás nevymkne.

Ak chcete zamykanie pri nečinnosti úplne zastaviť, `Super + Ctrl + I` — alebo `collie toggle idle` — zapne režim zostať bdelý a v lište sa objaví indikátor šálky kávy. Ten stlačte pred dlhou prezentáciou alebo buildom, ktorý chcete sledovať. Stlačte ho znova a vrátite sa do normálu. `collie toggle idle status` vypíše aktuálny stav ako JSON, ak ho potrebujete zo skriptu.

Toto sa týka zamykania a šetriča obrazovky, nie napájania. Uspávanie a hibernácia majú vlastné nastavenie v [spánku systému](36-system-sleep.md).

### Šetrič obrazovky

Šetrič obrazovky Collie je ASCII art prechádzajúci náhodnými textovými efektmi, jedna inštancia na monitor. Ukončí ho akákoľvek klávesa alebo pohyb myši.

Môžete ho spustiť na požiadanie zo _Systém > Šetrič obrazovky_ (`Super + Esc`), čo ho vynúti hore aj vtedy, ak ste šetrič obrazovky pri nečinnosti vypli. Predvolene k nemu nie je priradená žiadna klávesová skratka.

`collie toggle screensaver` je to, čo vypne ten pri nečinnosti, ak chcete ísť radšej rovno z práce na zamknutú obrazovku. Zatvorí ho akákoľvek klávesa, kliknutie, posun alebo pohyb myši.

Logo, ktoré kreslí, si môžete zmeniť pod _Vzhľad > Vizuálna identita > Šetrič obrazovky_. Nahrajte png alebo svg a Collie ho prevedie do ASCII. Pozrite si [vizuálnu identitu](41-branding.md).

### Uzamknutá obrazovka

`Super + Ctrl + L` zamkne počítač. Tým sa spustí uzamknutá obrazovka zo shellu Collie, vypne sa displej, rozloženie klávesnice sa resetuje na prvé, aby ste heslo nepísali v nesprávnej abecede, a — ak ho máte spustený — cestou von sa zamkne aj 1Password.

Uzamknutá obrazovka prijíma heslo a prijme aj odtlačok prsta, keď si ho nastavíte. To a ďalšie spôsoby overovania pokrýva [hardvérové overovanie](37-hardware-authentication.md).
