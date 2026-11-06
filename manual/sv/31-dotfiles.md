# Dotfiles

Collie konfigureras främst genom de så kallade dotfiles som finns i `~/.config`. De betraktas som dina filer för dina ändringar. Filerna som finns i `/usr/share/collie` tillhör Collie självt, och du bör inte hålla på och ändra i dem. Om du behöver ändra något i `/usr/share/collie` bör du i stället skriva över värdet i `~/.config`.

De viktigaste konfigurationerna kan redigeras direkt från Collie-menyn (`Super + Space`), som _Inställningar > Tangentbord > Tangentbindningar_, _Inställningar > Inmatning_ och _Inställningar > Konfiguration > [fil]_. När du gör det på det här sättet kommer alla processer som behöver startas om efter konfigurationsändringar att automatiskt göra det när du stänger redigeraren (Neovim som standard — `:wq`, kom ihåg det! — men du kan ändra det via _Inställningar > Standardvärden > Redigerare_).

Här är en lista över de viktigaste filerna i `~/.config` och vad de styr:

| Fil | Syfte |
| ----------------------- | --------------------- |
| `~/.config/hypr/hyprland.lua` | Den huvudsakliga Hyprland-konfigurationen. Läser in Collies standardinställningar plus dina åsidosättande filer nedan. [Läs mer om Hyprland-konfigurationer](https://wiki.hypr.land/Configuring/).  |
| `~/.config/hypr/bindings.lua` | Dina egna tangentbindningar och åsidosättningar av standardinställningarna. |
| `~/.config/hypr/monitors.lua` | Skärminställningar som skärmpanelen inte täcker, som rotation, extra lägen eller att hålla en skärm avstängd. |
| `~/.config/hypr/input.lua` | Styr din tangentbordslayout, mus- och styrplatteinställningar. |
| `~/.config/hypr/looknfeel.lua` | Styr mellanrum, kanter, animationer och resten av utseendet. |
| `~/.config/hypr/autostart.lua` | Styr extra processer som startas med sessionen. |
| `~/.config/collie/shell.json` | Styr Collie-skalet: panelens position, layout och widgetar, plus tidsinställningar för skärmsläckare, lås och inaktivitet. |
| `~/.config/foot/foot.ini` | Styr din terminal (foot är standard). |
| `~/.XCompose` | Definierar din snabbåtkomst till emoji och autokomplettering av namn/e-post. Se till att köra `collie-restart-xcompose` efter att du har gjort ändringar. |

Om du till slut gör många ändringar för att finjustera din egen installation är det en bra idé att säkerhetskopiera alla dessa dotfiles. [Stow är ett utmärkt sätt att göra det på](https://www.youtube.com/watch?v=NoFiYOqnC4o).

### Starta dina egna appar med sessionen

Om du vill att något ska köras varje gång du loggar in — en synkroniseringsdemon, en chattapp, ditt eget skript — lägger du det i `~/.config/hypr/autostart.lua`:

```lua
o.launch_on_start("my-service")
```

Det startar kommandot som en del av sessionen, så att det städas upp ordentligt när du loggar ut igen.

### Köra skript vid systemhändelser

Collie utlöser hooks vid en handfull tillfällen, och du kan hänga på dina egna skript på dem. De finns i `~/.config/collie/hooks/<event>.d/`, en katalog per händelse, och varje körbar fil där inne körs när händelsen inträffar:

| Händelse | När den körs |
| ----- | ------------ |
| `post-boot` | Direkt efter att skrivbordet har startat |
| `post-update` | Nära slutet av `collie update`, efter paket, migreringar och omstarter av tjänster, innan mise-verktyg uppdateras |
| `pre-refresh-pacman` | Efter att `collie refresh pacman` har synkroniserat om paketkonfigurationen, innan den uppdaterar paket; ett kanalbyte kör den under samma uppdateringssteg |
| `theme-set` | Efter ett temabyte (temanamn i `$1`) |
| `font-set` | Efter ett typsnittsbyte (typsnittsnamn i `$1`) |
| `battery-low` | När batteriet blir lågt (procent i `$1`) |

`pre-refresh-pacman`-hooken är där anpassade förråd eller `IgnorePkg`-rader hör hemma, eftersom den körs före pakettransaktionen. Båda de uppdateringsrelaterade hookarna körs som din användare efter att Collie har rensat sin cachade sudo-auktorisering, så en hook som använder `sudo` behöver sin egen auktorisering och kan komma att fråga efter ditt lösenord.

Var och en av dessa kataloger innehåller redan en `.sample`-fil som visar hur en hook ska se ut — ta bort `.sample` från namnet för att börja använda den. För att installera ett skript som du har skrivit någon annanstans använder du `collie hook install post-boot ~/my-hook`, som kopierar in det och gör det körbart.

### Lägga till egna poster i menyn

Collie-menyn (`Super + Space`) kan utökas med dina egna rader genom att redigera `~/.config/collie/extensions/collie-menu.jsonc`. Poster nycklas med ett punktseparerat id, och det är id:t som placerar dem i trädet, så `personal` dyker upp i rotmenyn och `personal.notes` dyker upp inuti den:

```jsonc
"personal": {"icon":"","label":"Personal"},
"personal.notes": {"icon":"󰎞","label":"Notes","action":"collie-launch-editor ~/notes"},
```

Använder du ett befintligt id igen skriver du över den raden i stället för att lägga till en ny. Filen levereras med alla tillgängliga fält dokumenterade som kommentarer.

### Lägga till egna exporter, funktioner och alias i skalet

Collie levereras med en mängd ergonomiska alias och hjälpsamma funktioner, men det är mycket vanligt att vilja lägga till sina egna. Du bör lägga till både alias, funktioner och exporter i `~/.bashrc`. Den här filen kommer inte att skrivas över vid uppdateringar. Om du vill ändra några av Collies standardinställningar kan du också tryggt lägga till dem här.

### Ställa in miljövariabler för skrivbordet

Exporter för skrivbordssessionen hör hemma i `~/.config/uwsm/env.d/`. Dessa filer körs innan ditt skrivbord startar, så ett skalfel kan skicka dig tillbaka till inloggningsskärmen. Ha en fungerande terminal öppen medan du redigerar dem. För att inaktivera en åsidosättning flyttar du den ut ur `env.d`. Se [återställning av inloggning](45-troubleshooting.md#my-password-is-accepted-but-i-return-to-the-login-screen) om en ändring förhindrar inloggning.

### Ändra interna Collie-filer

Hör här, det här är din dator. Du kan göra vad du vill med den, men jag avråder från att göra ändringar direkt i filerna i `/usr/share/collie`. De tillhör Collie-paketet i pacman, så dina ändringar kommer helt enkelt att skrivas över vid nästa uppdatering. Det är bättre att bara skriva över de standardvärden du inte gillar i mappen `~/.config/*` i stället.

Du kan ändra nästan allt på det sättet, som standardtangentbindningarna. Redigera bara `~/.config/hypr/bindings.lua` för att till exempel ersätta [Obsidian](https://obsidian.md/) med [Joplin](https://joplinapp.org/) (installera med `collie-pkg-add joplin-bin`):

```lua
o.rebind("SUPER + SHIFT + O", "Joplin", "joplin-desktop")
```

`o.rebind` tar bort den befintliga bindningen innan den lägger till ersättningen. Den tar samma argument som `o.bind`, inklusive starthjälpare och bindningsalternativ. Använd `o.bind` för att lägga till en bindning, eller `hl.unbind` för att ta bort en utan att ersätta den.

Om du insisterar på att hacka på de interna Collie-filerna byter du till dev-kanalen via _Uppdatering > Kanal > Dev_. Det länkar Collie till en git-checkout av källkoden i `~/collie`, som du fritt kan ändra precis så mycket du vill. Ingen här ska tala om för dig vad du ska göra!

### Återställa alla ändringar

Om du till slut rör till konfigurationerna kan du alltid återställa dem till standardvärdena via _Uppdatering > Konfiguration_ i Collie-menyn. Eller genom att köra `collie reinstall configs` för att återställa allt.
