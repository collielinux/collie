# Kytkimet, käyttämättömyys ja näytönsäästäjä

Paljon siitä, mitä muutat päivittäin, ei oikeastaan ole asetus. Se on tila, jonka kytket päälle tunniksi ja sitten taas pois: yövalo, kun työskentelet myöhään, älä häiritse, kun esität, pysy valveilla, kun katsot jotain. Collie kutsuu niitä kytkimiksi, ja ne kaikki toimivat samalla tavalla — pikanäppäin, valikkokohta ja komento osuvat kaikki samaan kytkimeen.

### Kytkinvalikko

`Super + Ctrl + O` avaa suoraan _Trigger > Toggle_ -kohdan, tai sinne voi kulkea Collie-valikosta (`Super + Space`). Kaikki siinä luettelossa on kytkimiä, jotka voit kääntää miettimättä, missä tila sijaitsee. Kytkimet sille, miltä työpöytä näyttää, ovat sen vieressä _Appearance_-kohdan alla.

Päätteestä samat kytkimet ovat `collie toggle <thing>`. Suorita pelkkä `collie toggle` nähdäksesi koko ryhmän.

| Kytkin | Pikanäppäin | Komento |
| ------ | ------ | ------- |
| Yövalo | — | `collie toggle nightlight` |
| Hiljennä ilmoitukset | `Super + Ctrl + Alt + ,` | `collie toggle notification silencing` |
| Pysy valveilla (ei lukitusta käyttämättömänä) | `Super + Ctrl + I` | `collie toggle idle` |
| Kaatumistietojen tallennus | — | `collie toggle crash-capture` |
| Näytönsäästäjä | — | `collie toggle screensaver` |
| [Herdr](https://herdr.dev) -teeman synkronointi | — | `collie toggle theme sync` |
| Valikkopalkki | `Super + Shift + Space` | `collie toggle bar` |
| Kosketuslevy | `XF86TouchpadToggle` | `collie toggle touchpad` |
| Kosketusnäyttö | — | `collie toggle touchscreen` |
| Valmiustila | — | `collie toggle suspend` |
| Hybridi-GPU | — | `collie toggle hybrid gpu` |

Kosketuslevyn, kosketusnäytön ja hybridi-GPU:n kytkimet ovat _Trigger > Hardware_ -kohdan alla (`Super + Ctrl + H`) eivätkä Toggle-kohdan alla, koska ne näkyvät vain, kun sinulla todella on kyseinen laitteisto. Kosketuslevyn ja kosketusnäytön kytkimet säilyvät Hyprlandin uudelleenlatauksen yli — käytöstä poistetun laitteen nimi tallennetaan pieneen tilatiedostoon, jonka Hyprland lukee käynnistyksessä poistaakseen sen uudelleen käytöstä.

_Appearance_-kohdassa ovat valikkopalkki ja animaatiot sekä muutama asia, jotka eivät ole `collie toggle` -komentoja mutta käyttäytyvät samalla tavalla: akun prosenttiosuus palkissa, työtilojen oletusasettelu ja _Windows_-kohdan alla ikkunoiden välit (`Super + Shift + Backspace`) ja yhden ikkunan neliömäinen kuvasuhde (`Super + Ctrl + Backspace`).

Kun Hyprlandilla ei ole GPU:ta, jolla piirtää, ja se renderöi sen sijaan suorittimella (llvmpipe), kuten Maceilla, joiden GPU:ta ei vielä tueta, useimmissa virtuaalikoneissa tai kun grafiikka-ajurin lataus epäonnistuu, Collie kytkee animaatiot, sumennuksen ja varjot pois päältä kyseiseksi istunnoksi ja kertoo siitä kerran ilmoituksella. _Appearance > Animations On_ tuo ne takaisin, ja Collie muistaa sen myös myöhempiä istuntoja varten.

Useimmat näistä ovat vain lipp tiedosto hakemistossa `~/.local/state/collie/toggles/`. Jos haluat haarautua jonkin perusteella skriptissä, `collie-toggle-enabled` antaa sinulle poistumiskoodin sen sijaan, että sinun pitäisi mennä etsimään:

```bash
collie-toggle-enabled screensaver-off && echo "screensaver is off"
```

Liput on nimetty pois päältä -tilan mukaan — `screensaver-off`, `suspend-off`, `bar-off` — joten niiden olemassaolo tarkoittaa, että ominaisuus on poistettu käytöstä.

### Ilmaisimet palkissa

Kun tila on päällä, saat pienen kuvakkeen yläpalkin keskelle kellon viereen. Se on ilmaisimet-widget, ja se sisältää sanelun, näytön tallennuksen, odottavat muistutukset, yövalon, älä häiritse -tilan ja pysy valveilla -tilan.

Ei-aktiiviset ilmaisimet ovat piilossa. Vie osoitin minne tahansa palkin päälle, niin ne häivytetään näkyviin himmennettyinä, joten voit napsauttaa yhtä kytkeäksesi sen päälle tuntematta sen pikanäppäintä. Aktiivisen napsauttaminen kytkee sen takaisin pois päältä. Jos haluat mieluummin nähdä ne kaikki koko ajan, aseta `alwaysShow` arvoon `true` kohdassa `collie.indicators` tiedostossa `~/.config/collie/shell.json` — katso [yläpalkki](05-the-top-bar.md), miten palkin widgetit määritetään.

### Yövalo

Yövalo lämmittää näytön arvoon 4000K, ja sen kytkeminen uudelleen palauttaa sen arvoon 6500K. Käännä se kytkinvalikosta (`Super + Ctrl + O`) tai komennolla `collie toggle nightlight`. Sitä ohjaa hyprsunset, jonka kytkin käynnistää puolestasi, jos se ei ole jo käynnissä.

Oletuksena hyprsunset ei tee näytöllesi yhtään mitään. `~/.config/hypr/hyprsunset.conf` toimitetaan identity-profiililla juuri siksi, että näyttö pysyy koskemattomana, kunnes pyydät lämpöä. Jos haluat mieluummin sen vaihtuvan kellon mukaan, korvaa se aikaprofiililla:

```
profile {
    time = 20:00
    temperature = 4000
}
```

Käynnistä sitten hyprsunset kirjautumisen yhteydessä lisäämällä `o.launch_on_start("hyprsunset")` tiedostoon `~/.config/hypr/autostart.lua`. Kytkimen käyttämä 4000K/6500K-pari on kiinteä, joten määritystiedosto on paikka, jonne menet, jos haluat eri lämpötilan.

### Älä häiritse

`Super + Ctrl + Alt + ,` hiljentää ilmoitukset. Mitään ponnahdusilmoituksia ei ilmesty sen ollessa päällä, ja yliviivattu kelloilmaisin istuu palkissa muistuttamassa, miksi työpöytä on hiljentynyt.

Mitään ei kuitenkaan menetetä. Hiljennetyt ilmoitukset pidetään takana: laita viimeiset muutamat takaisin näytölle näppäimillä `Super + Shift + Alt + ,`. Katso loput kohdasta [ilmoitukset](10-notices.md).

Kahdenlaiset viestit pääsevät silti läpi: Collien omat vahvistusilmoitukset jostakin, jonka juuri teit ("Theme changed", "Screenshot saved"), ja komentoriviltä lähetetyt kriittiset hälytykset. Keskustelusovellukset, jotka merkitsevät kaiken kriittiseksi pakottaakseen itsensä eteesi, eivät kelpaa.

### Käyttämättömyys

Collie-kuori omistaa käyttämättömyyskäyttäytymisen, ja ajoitukset ovat ylätason `idle`-lohko tiedostossa `~/.config/collie/shell.json`:

```json
{
  "version": 1,
  "idle": {
    "screensaver": 150,
    "lock": 300
  }
}
```

Molemmat luvut ovat sekunteja, jotka lasketaan siitä hetkestä, kun siirryit käyttämättömäksi — eivät toisistaan. Joten oletuksilla näytönsäästäjä tulee esiin kahden ja puolen minuutin kuluttua ja lukitusnäyttö ottaa vallan viiden minuutin kohdalla riippumatta siitä, käynnistyikö näytönsäästäjä. Tallenna tiedosto, niin kuori ottaa uudet ajoitukset käyttöön heti.

Jos hylkäät näytönsäästäjän ennen lukituksen määräaikaa, se lasketaan toiminnaksi ja odottava lukitus perutaan. Et jää lukituksi ulos siitä, että vilkaisit konettasi.

Lopettaaksesi käyttämättömänä lukitsemisen kokonaan, `Super + Ctrl + I` — tai `collie toggle idle` — kytkee pysy valveilla -tilan päälle, ja kahvikuppi-ilmaisin ilmestyy palkkiin. Se on se, jota kannattaa painaa ennen pitkää esitystä tai koontia, jota haluat seurata. Paina sitä uudelleen palataksesi normaaliin. `collie toggle idle status` tulostaa nykyisen tilan JSON-muodossa, jos tarvitset sitä skriptistä.

Tämä koskee lukitsemista ja näytönsäästäjää, ei virtaa. Valmius- ja lepotilalla on oma määrityksensä kohdassa [järjestelmän lepotila](36-system-sleep.md).

### Näytönsäästäjä

Collien näytönsäästäjä on ASCII-taidetta, joka kulkee satunnaisten tekstitehosteiden läpi, yksi esiintymä näyttöä kohden. Mikä tahansa näppäin tai hiiren liike poistuu siitä.

Voit käynnistää sen pyynnöstä kohdasta _System > Screensaver_ (`Super + Esc`), mikä pakottaa sen esiin, vaikka olisit kytkenyt käyttämättömyyden näytönsäästäjän pois päältä. Sille ei ole oletuksena sidottu pikanäppäintä.

`collie toggle screensaver` on se, mikä kytkee käyttämättömyyden näytönsäästäjän pois päältä, jos haluat mieluummin siirtyä suoraan työskentelystä lukittuun tilaan. Mikä tahansa näppäin, napsautus, vieritys tai hiiren liike sulkee sen.

Sen piirtämä logo on sinun muutettavissasi kohdassa _Appearance > Branding > Screensaver_. Lataa png tai svg, niin Collie muuntaa sen ASCII-muotoon. Katso [brändäys](41-branding.md).

### Lukitusnäyttö

`Super + Ctrl + L` lukitsee koneen. Se käynnistää lukitusnäytön Collie-kuoresta, sammuttaa näytön, palauttaa näppäimistöasettelusi ensimmäiseen, jotta et kirjoita salasanaasi väärällä aakkostolla, ja — jos se on käynnissä — lukitsee 1Passwordin matkalla ulos.

Lukitusnäyttö ottaa salasanan, ja se ottaa myös sormenjäljen, kun olet määrittänyt sellaisen. Se ja muut todentamistavat käsitellään kohdassa [laitteistotodennus](37-hardware-authentication.md).
