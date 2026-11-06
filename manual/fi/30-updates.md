# Päivitykset

Collie ja pakettisi pidetään ajan tasalla Collie-valikon kohdasta _Päivitä > Collie_ (`Super + Space`).

Collie itse asennetaan tavallisina pacman-paketteina [Collie-pakettivarastosta](https://github.com/omacom-io/omarchy-pkgs), joten päivitys asentaa [uusimman Collie-julkaisun](https://github.com/embeputer/collie/releases), suorittaa kaikki odottavat migraatiot järjestelmäsi synkronoimiseksi uusimman version kanssa ja päivittää kaikki järjestelmäpaketit [Collie Arch -peilistä](https://github.com/omacom-io/omarchy-mirror) ja [AUR:sta](https://aur.archlinux.org/) (jos olet asentanut AUR-paketteja).

Kun uusia julkaisuja ilmestyy, kellosi oikealle puolelle ilmestyy ympyränuolikuvake. Napsauta sitä, niin päivitysprosessi käynnistyy.

![update-available](images/update-available.webp)

### Neljä kanavaa

Collie päivitetään neljällä kanavalla: stable, RC, edge ja dev. Uudet asennukset alkavat stable-kanavalla, joka seuraa [virallisia julkaisuja](https://github.com/embeputer/collie/releases/) sekä [vakaata Collie Arch -peiliä](https://github.com/omacom-io/omarchy-mirror), joka kulkee kuukauden uusinta jäljessä, jotta voimme havaita kaikki uudet yhteensopimattomuudet, jotka vaativat määritysmuutoksia, ennen kuin ne aiheuttavat ongelmia ihmisille.

Mutta jos haluat auttaa havaitsemaan nuo mahdolliset ongelmat, voit käyttää edge-kanavaa. Se pitää Collie-pakettisi uusimpien kehitysversioiden tasalla ja antaa sinun päivittää uusimpiin Arch-paketteihin heti, kun ne ovat saatavilla. Tee näin vain, jos olet kokenut Linux-käyttäjä ja osaat palauttaa järjestelmän, jossa on ongelmia.

Ennen jokaista uutta suurta julkaisua teemme lopullisen validoinnin RC-kanavalla. Jos olet kiinnostunut auttamaan viimeistelyssä, tule viettämään aikaa Discordissa kanavalle #omarchy-release-candidates.

Lopuksi on dev-kanava, joka linkittää Collien suoraan lähdekoodin git-kopioon kansiossa `~/collie` yhdistettynä edge-paketteihin. Käytä tätä kanavaa vain, jos olet kokenut Linux-käyttäjä, työskentelet suoraan Collien parissa ja olet valmis sietämään rikkoutumisia.

Voit vaihtaa kanavaa Collie-valikon kohdasta _Päivitä > Kanava_ (tai komennolla `collie-channel-set` terminaalissa).

### Ytimen vaihtaminen

Collie käynnistää oman `linux-omarchy`-ytimensä, mutta voit pitää sen rinnalla muitakin asennettuina, kuten Archin vakioytimen `linux` tai kokeellisen version, jota testaat. Kun ytimiä on useampi kuin yksi, Collie-valikon _Päivitä > Ydin_ listaa ne ja näyttää valintamerkin sen vieressä, joka käynnistyy oletuksena. Valitse toinen, syötä salasanasi kerran, ja se käynnistyy seuraavan uudelleenkäynnistyksen jälkeen. Muut ytimet pysyvät käynnistysvalikossa, joten voit silti valita sellaisen käsin, jos uusi oletus aiheuttaa ongelmia. Terminaalissa `collie-kernel` näyttää nykyisen oletuksen, `collie-kernel list` asennetut ytimet ja `collie-kernel set <kernel>` vaihtaa ytimen.

### Laiteohjelmistopäivitykset

Pakettisi eivät ole ainoa asia, joka vanhenee. Monet kannettavat tietokoneet ja oheislaitteet toimittavat BIOS-, SSD- ja telakkalaiteohjelmistoja Linux Vendor Firmware Servicen kautta, ja Collie-valikon _Päivitä > Laiteohjelmisto_ hakee ja asentaa kaiken, mitä laitteistollesi on odottamassa. Se asentaa `fwupd`:n ensimmäisellä käyttökerralla. Paljon laiteohjelmistoja voidaan kirjoittaa vain uudelleenkäynnistyksen aikana, joten älä ylläty, jos sinua pyydetään käynnistämään uudelleen.

### Varoitus suorista pacman/yay-päivityksistä

Jos Arch on jo sinulle tuttu, saatat tuntea houkutusta ajaa itse vain `pacman -Syu` tai `yay -Syu`, mutta jos teet niin, ohitat tilannevedoksen, migraatiot ja määrityspäivitykset, jotka Collie ajaa yhdessä uusien pakettien kanssa. Siksi Collie itse asiassa pysäyttää suoran järjestelmäpäivityksen ja ohjaa sinut sen sijaan käyttämään komentoa `collie update`. (Jos todella tiedät, mitä olet tekemässä, suoja kertoo, miten sen voi ohittaa yhden tapahtuman ajaksi.)

### Huonojen päivitysten peruminen

Jos sinulla on koskaan ongelmia päivityksen tekemisen jälkeen, voit palauttaa järjestelmäsi päivitystä ennen otettuun tilannevedokseen. Käynnistä vain uudelleen ja valitse käynnistyslataimen valikosta tilannevedos ajalta ennen päivityksen aloittamista.

![bootloader](images/bootloader.webp)

Jos määritystiedostosi ovat jotenkin vioittuneet, voit myös asentaa Collien uudelleen komennolla `collie reinstall` terminaalissa. Tämä asentaa uudelleen kaikki Collien oletuspaketit, siirtää sinut stable-kanavalle ja alentaa liian uudet paketit vanhempiin versioihin sekä nollaa kaikki määritystiedostot. Huomaa, että kaikki Collien oletuksiin tekemäsi käyttäjämääritysten muutokset ylikirjoitetaan tämän aikana!
