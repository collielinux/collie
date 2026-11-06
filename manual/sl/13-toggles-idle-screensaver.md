# Preklopi, nedejavnost in ohranjevalnik zaslona

Veliko tega, kar vsak dan spreminjaš, v resnici ni nastavitev. Je način, ki ga vklopiš za eno uro in nato spet izklopiš: nočna svetloba, ko delaš pozno, ne moti, ko predstavljaš, ostani buden, ko nekaj gledaš. Collie jim pravi preklopi in vsi delujejo enako — bližnjica na tipkovnici, vnos v meniju in ukaz, vsi sprožijo isto stikalo.

### Meni preklopov

`Super + Ctrl + O` neposredno odpre _Sprožilec > Preklop_, lahko pa prideš tja tudi iz menija Collie (`Super + Space`). Vse na tem seznamu je stikalo, ki ga lahko preklopiš, ne da bi razmišljal, kje je stanje shranjeno. Stikala za videz namizja so zraven, pod _Videz_.

Iz terminala so ista stikala `collie toggle <thing>`. Zaženi samo `collie toggle`, da vidiš celotno skupino.

| Preklop | Bližnjica | Ukaz |
| ------ | ------ | ------- |
| Nočna svetloba | — | `collie toggle nightlight` |
| Utišaj obvestila | `Super + Ctrl + Alt + ,` | `collie toggle notification silencing` |
| Ostani buden (brez zaklepanja ob nedejavnosti) | `Super + Ctrl + I` | `collie toggle idle` |
| Zajemanje ob zrušitvi | — | `collie toggle crash-capture` |
| Ohranjevalnik zaslona | — | `collie toggle screensaver` |
| Sinhronizacija teme [Herdr](https://herdr.dev) | — | `collie toggle theme sync` |
| Menijska vrstica | `Super + Shift + Space` | `collie toggle bar` |
| Sledilna ploščica | `XF86TouchpadToggle` | `collie toggle touchpad` |
| Zaslon na dotik | — | `collie toggle touchscreen` |
| Mirovanje | — | `collie toggle suspend` |
| Hibridni GPU | — | `collie toggle hybrid gpu` |

Stikala za sledilno ploščico, zaslon na dotik in hibridni GPU so pod _Sprožilec > Strojna oprema_ (`Super + Ctrl + H`) in ne pod Preklop, saj se prikažejo le, ko to strojno opremo dejansko imaš. Preklopa za sledilno ploščico in zaslon na dotik preživita ponovno nalaganje Hyprlanda — ime onemogočene naprave se shrani v majhno datoteko stanja, ki jo Hyprland prebere ob zagonu in napravo znova onemogoči.

_Videz_ vsebuje menijsko vrstico in animacije ter nekaj stvari, ki niso ukazi `collie toggle`, a se obnašajo enako: prikaz odstotka baterije v vrstici, privzeto postavitev delovnih površin ter pod _Okna_ razmike med okni (`Super + Shift + Backspace`) in kvadratno obliko pri enem oknu (`Super + Ctrl + Backspace`).

Ko Hyprland nima GPU-ja, s katerim bi risal, in namesto tega riše s CPU-jem (llvmpipe), kot na Macih, katerih GPU še ni podprt, v večini virtualnih strojev ali ko se grafični gonilnik ne naloži, Collie za to sejo izklopi animacije, zameglitev in sence ter ti to enkrat pove z obvestilom. _Videz > Vklopi animacije_ jih vrne nazaj in Collie si to zapomni tudi za kasnejše seje.

Večina teh je le datoteka z zastavico pod `~/.local/state/collie/toggles/`. Če želiš v skripti vejiti glede na eno od njih, ti `collie-toggle-enabled` vrne izhodno kodo, namesto da bi moral iti iskat:

```bash
collie-toggle-enabled screensaver-off && echo "screensaver is off"
```

Zastavice so poimenovane po izklopljenem stanju — `screensaver-off`, `suspend-off`, `bar-off` — zato njihova prisotnost pomeni, da je funkcija onemogočena.

### Kazalniki v vrstici

Ko je način vklopljen, dobiš majhen glif na sredini zgornje vrstice poleg ure. To je gradnik s kazalniki in vsebuje narekovanje, snemanje zaslona, čakajoče opomnike, nočno svetlobo, ne moti in ostani buden.

Neaktivni kazalniki so skriti. Z miško se pomakni kamorkoli nad vrstico in prikažejo se zatemnjeni, da lahko enega klikneš in ga vklopiš, ne da bi poznal njegovo bližnjico. Klik na aktivnega ga spet izklopi. Če jih želiš raje videti vse ves čas, nastavi `alwaysShow` na `true` pri vnosu `collie.indicators` v `~/.config/collie/shell.json` — glej [zgornjo vrstico](05-the-top-bar.md) za to, kako se konfigurirajo gradniki vrstice.

### Nočna svetloba

Nočna svetloba segreje zaslon na 4000K, ponovni preklop pa ga vrne na 6500K. Preklopiš jo iz menija preklopov (`Super + Ctrl + O`) ali z `collie toggle nightlight`. Poganja jo hyprsunset, ki ga preklop zažene zate, če še ne teče.

Privzeto hyprsunset tvojemu zaslonu sploh nič ne naredi. `~/.config/hypr/hyprsunset.conf` ima priložen identitetni profil prav zato, da zaslon ostane nedotaknjen, dokler ne zahtevaš topline. Če želiš raje, da preklaplja po uri, ga zamenjaj s časovnim profilom:

```
profile {
    time = 20:00
    temperature = 4000
}
```

Nato zaženi hyprsunset ob prijavi tako, da dodaš `o.launch_on_start("hyprsunset")` v `~/.config/hypr/autostart.lua`. Par 4000K/6500K, ki ga uporablja preklop, je fiksen, zato je konfiguracijska datoteka kraj, kamor greš, če želiš drugačno temperaturo.

### Ne moti

`Super + Ctrl + Alt + ,` utiša obvestila. Dokler je vklopljeno, se ne prikaže nobeno pojavno obvestilo, kazalnik prečrtanega zvonca v vrstici pa te spomni, zakaj je namizje utihnilo.

Vendar se nič ne izgubi. Utišana obvestila so zadržana: zadnjih nekaj jih vrni na zaslon s `Super + Shift + Alt + ,`. Za ostalo glej [obvestila](10-notices.md).

Vseeno prideta skozi dve vrsti sporočil: lastna potrditvena pojavna obvestila Collieja za nekaj, kar si pravkar naredil ("Tema spremenjena", "Posnetek zaslona shranjen"), in kritična opozorila, poslana iz ukazne vrstice. Klepetalne aplikacije, ki vse označijo kot kritično, da bi se ti vsilile v ospredje, ne pridejo v poštev.

### Nedejavnost

Obnašanje ob nedejavnosti upravlja lupina Collie, časovne nastavitve pa so blok `idle` na najvišji ravni v `~/.config/collie/shell.json`:

```json
{
  "version": 1,
  "idle": {
    "screensaver": 150,
    "lock": 300
  }
}
```

Obe številki sta sekunde, štete od trenutka, ko si postal nedejaven — ne ena od druge. Zato se s privzetima nastavitvama ohranjevalnik zaslona prikaže po dveh minutah in pol, zaklenjeni zaslon pa prevzame pri petih minutah, ne glede na to, ali se je ohranjevalnik zaslona zagnal ali ne. Shrani datoteko in lupina takoj prevzame nove časovne nastavitve.

Če ohranjevalnik zaslona zavržeš pred rokom za zaklepanje, to šteje kot dejavnost in čakajoče zaklepanje se prekliče. Ne bo te zaklenilo ven zato, ker si mimogrede pogledal svoj stroj.

Če želiš zaklepanje ob nedejavnosti popolnoma ustaviti, `Super + Ctrl + I` — ali `collie toggle idle` — vklopi ostani buden in v vrstici se prikaže kazalnik skodelice kave. Tega pritisni pred dolgo predstavitvijo ali gradnjo, ki jo želiš spremljati. Pritisni ga znova, da se vrneš v normalno stanje. `collie toggle idle status` izpiše trenutno stanje kot JSON, če ga potrebuješ iz skripte.

Tu gre za zaklepanje in ohranjevalnik zaslona, ne za napajanje. Mirovanje in hibernacija imata svojo nastavitev v [sistemskem spanju](36-system-sleep.md).

### Ohranjevalnik zaslona

Ohranjevalnik zaslona v Collieju je ASCII umetnost, ki teče skozi naključne besedilne učinke, en primerek na monitor. Vsaka tipka ali premik miške ga zapre.

Na zahtevo ga lahko zaženeš iz _Sistem > Ohranjevalnik zaslona_ (`Super + Esc`), kar ga prisilno prikaže, tudi če si ohranjevalnik zaslona ob nedejavnosti izklopil. Privzeto nanj ni vezana nobena bližnjica.

`collie toggle screensaver` izklopi tistega ob nedejavnosti, če greš raje naravnost od dela do zaklenjenega stanja. Vsaka tipka, klik, drsenje ali premik miške ga zapre.

Logotip, ki ga riše, lahko spremeniš pod _Videz > Grafična podoba > Ohranjevalnik zaslona_. Naloži png ali svg in Collie ga pretvori v ASCII. Glej [grafično podobo](41-branding.md).

### Zaklenjeni zaslon

`Super + Ctrl + L` zaklene stroj. To zažene zaklenjeni zaslon iz lupine Collie, zatemni zaslon, ponastavi postavitev tipkovnice na prvo, da gesla ne vnašaš v napačni abecedi, in — če ga imaš zagnanega — ob odhodu zaklene 1Password.

Zaklenjeni zaslon sprejme geslo, sprejel pa bo tudi prstni odtis, ko ga nastaviš. To in druge načine avtentikacije obravnava [strojna avtentikacija](37-hardware-authentication.md).
