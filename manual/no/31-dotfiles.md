# Dotfiler

Collie konfigureres primært gjennom de såkalte dotfilene som ligger i `~/.config`. De regnes som dine filer til dine endringer. Filene som ligger i `/usr/share/collie`, tilhører selve Collie, og du bør ikke tukle med dem. Hvis du trenger å endre noe i `/usr/share/collie`, bør du i stedet overskrive verdien i `~/.config`.

De viktigste konfigurasjonene kan redigeres rett fra Collie-menyen (`Super + Space`), som _Oppsett > Tastatur > Tastebindinger_, _Oppsett > Inndata_ og _Oppsett > Konfigurasjon > [fil]_. Når du gjør det på denne måten, vil enhver prosess som må startes på nytt etter konfigurasjonsendringer, automatisk bli det etter at du lukker redigeringsprogrammet (Neovim som standard — `:wq`, husk det! — men du kan endre det via _Oppsett > Standarder > Redigeringsprogram_).

Her er en liste over de viktigste filene i `~/.config` og hva de styrer:

| Fil | Formål |
| ----------------------- | --------------------- |
| `~/.config/hypr/hyprland.lua` | Den viktigste Hyprland-konfigurasjonen. Laster Collie-standardene pluss overskrivingsfilene dine nedenfor. [Les mer om Hyprland-konfigurasjoner](https://wiki.hypr.land/Configuring/). |
| `~/.config/hypr/bindings.lua` | Dine egne tastebindinger og overskrivinger av standardene. |
| `~/.config/hypr/monitors.lua` | Skjerminnstillinger som skjermpanelet ikke dekker, som rotasjon, ekstra moduser eller å holde en skjerm avskrudd. |
| `~/.config/hypr/input.lua` | Styrer tastaturoppsettet, musen og styreflateinnstillingene dine. |
| `~/.config/hypr/looknfeel.lua` | Styrer mellomrom, kanter, animasjoner og resten av utseendet. |
| `~/.config/hypr/autostart.lua` | Styrer ekstra prosesser som startes med økten. |
| `~/.config/collie/shell.json` | Styrer Collie-skallet: linjens plassering, oppsett og widgeter, pluss tidsinnstillinger for skjermsparer, lås og inaktivitet. |
| `~/.config/foot/foot.ini` | Styrer terminalen din (foot er standarden). |
| `~/.XCompose` | Definerer hurtigtilgangs-emojiene dine og autofullføring av navn/e-post. Husk å kjøre `collie-restart-xcompose` etter at du har gjort endringer. |

Hvis du ender opp med å gjøre mange endringer for å tilpasse ditt eget oppsett, er det en god idé å sikkerhetskopiere alle disse dotfilene. [Stow er en flott måte å gjøre det på](https://www.youtube.com/watch?v=NoFiYOqnC4o).

### Starte dine egne apper med økten

Hvis du vil at noe skal kjøre hver gang du logger inn — en synkroniseringsdaemon, en chat-app, ditt eget skript — legg det i `~/.config/hypr/autostart.lua`:

```lua
o.launch_on_start("my-service")
```

Det starter kommandoen som en del av økten, så den ryddes ordentlig opp når du logger ut igjen.

### Kjøre skript ved systemhendelser

Collie fyrer av hooks ved en håndfull øyeblikk, og du kan henge dine egne skript på dem. De ligger i `~/.config/collie/hooks/<event>.d/`, én mappe per hendelse, og hver kjørbare fil der inne kjøres når hendelsen inntreffer:

| Hendelse | Når den kjøres |
| ----- | ------------ |
| `post-boot` | Rett etter at skrivebordet har startet |
| `post-update` | Nær slutten av `collie update`, etter pakker, migreringer og omstart av tjenester, før mise-verktøy oppdateres |
| `pre-refresh-pacman` | Etter at `collie refresh pacman` synkroniserer pakkekonfigurasjonen på nytt, før den oppdaterer pakker; et kanalbytte kjører den under det samme oppfriskningstrinnet |
| `theme-set` | Etter et temabytte (temanavn i `$1`) |
| `font-set` | Etter et skrifttypebytte (skrifttypenavn i `$1`) |
| `battery-low` | Når batteriet blir lavt (prosentandel i `$1`) |

`pre-refresh-pacman`-hooken er stedet der egendefinerte pakkebrønner eller `IgnorePkg`-linjer hører hjemme, siden den kjøres før pakketransaksjonen. Begge de oppdateringsrelaterte hookene kjøres som din bruker etter at Collie har fjernet sin bufrede sudo-autorisasjon, så en hook som bruker `sudo`, trenger sin egen autorisasjon og kan be om passordet ditt.

Hver av disse mappene inneholder allerede en `.sample`-fil som viser hvordan en hook ser ut — fjern `.sample` fra navnet for å ta den i bruk. For å installere et skript du har skrevet et annet sted, bruk `collie hook install post-boot ~/my-hook`, som kopierer det inn og gjør det kjørbart.

### Legge til dine egne menyelementer

Collie-menyen (`Super + Space`) kan utvides med dine egne rader ved å redigere `~/.config/collie/extensions/collie-menu.jsonc`. Oppføringer nøkles med en prikket id, og id-en er det som plasserer dem i treet, så `personal` vises på rotmenyen og `personal.notes` vises inni den:

```jsonc
"personal": {"icon":"","label":"Personal"},
"personal.notes": {"icon":"󰎞","label":"Notes","action":"collie-launch-editor ~/notes"},
```

Bruk en eksisterende id på nytt, og du overskriver den raden i stedet for å legge til en ny. Filen leveres med alle tilgjengelige felter dokumentert som kommentarer.

### Legge til dine egne shell-eksporter, funksjoner og aliaser

Collie leveres med en haug med ergonomiske aliaser og nyttige funksjoner, men det er svært vanlig å ville legge til sine egne. Du bør legge til både aliaser, funksjoner og eksporter i `~/.bashrc`. Denne filen vil ikke bli overskrevet ved oppdateringer. Hvis du vil endre noen av Collie-standardene, kan du også trygt legge dem til her.

### Angi miljøvariabler for skrivebordet

Eksporter for skrivebordsøkten hører hjemme i `~/.config/uwsm/env.d/`. Disse filene kjøres før skrivebordet ditt starter, så en shell-feil kan sende deg tilbake til innloggingsskjermen. Hold en fungerende terminal åpen mens du redigerer dem. For å deaktivere en overskriving, flytt den ut av `env.d`. Se [gjenoppretting av innlogging](45-troubleshooting.md#my-password-is-accepted-but-i-return-to-the-login-screen) hvis en endring hindrer innlogging.

### Endre interne Collie-filer

Hør her, dette er din datamaskin. Du kan gjøre hva du vil med den, men jeg vil fraråde å gjøre endringer direkte i filene i `/usr/share/collie`. De tilhører Collie pacman-pakken, så endringene dine vil ganske enkelt bli overskrevet ved neste oppdatering. Du har det bedre med å bare overskrive standardverdier du ikke liker, i `~/.config/*`-mappen i stedet.

Du kan endre omtrent alt på den måten, som standard tastebindinger. Bare rediger `~/.config/hypr/bindings.lua` for for eksempel å erstatte [Obsidian](https://obsidian.md/) med [Joplin](https://joplinapp.org/) (installer med `collie-pkg-add joplin-bin`):

```lua
o.rebind("SUPER + SHIFT + O", "Joplin", "joplin-desktop")
```

`o.rebind` fjerner den eksisterende bindingen før den legger til erstatningen. Den tar de samme argumentene som `o.bind`, inkludert oppstartshjelpere og bindingsalternativer. Bruk `o.bind` for å legge til en binding, eller `hl.unbind` for å fjerne en uten å erstatte den.

Hvis du insisterer på å hacke på de interne Collie-filene, bytt til dev-kanalen via _Oppdater > Kanal > Dev_. Det lenker Collie til en git-utsjekk av kildekoden i `~/collie`, som du fritt kan endre så mye du vil. Det er ingen her som skal fortelle deg hva du skal gjøre!

### Tilbakestille eventuelle endringer

Hvis du ender opp med å rote til konfigurasjonene, kan du alltid tilbakestille dem til standardene via _Oppdater > Konfigurasjon_ i Collie-menyen. Eller ved å kjøre `collie reinstall configs` for å tilbakestille alt.
