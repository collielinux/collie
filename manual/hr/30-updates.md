# Ažuriranja

Collie i vaše pakete održavate ažurnima putem _Ažuriranje > Collie_ u izborniku Collie (`Super + Space`).

Sam Collie instaliran je kao obični pacman paketi iz [Collie repozitorija paketa](https://github.com/omacom-io/omarchy-pkgs), pa ažuriranje instalira [najnovije izdanje Collieja](https://github.com/embeputer/collie/releases), pokreće sve migracije na čekanju kako bi vaš sustav uskladio s najnovijim stanjem i ažurira sve sistemske pakete iz [Collie Arch mirrora](https://github.com/omacom-io/omarchy-mirror) i [AUR](https://aur.archlinux.org/) (ako ste instalirali bilo kakve AUR pakete).

Kad budu objavljena nova izdanja, desno od vašeg sata pojavit će se ikona kružne strelice. Kliknite je i postupak ažuriranja će započeti.

![update-available](images/update-available.webp)

### Četiri kanala

Collie se ažurira kroz četiri kanala: stable, RC, edge i dev. Nove instalacije započinju na kanalu stable, koji prati [službena izdanja](https://github.com/embeputer/collie/releases/), kao i [stabilni Collie Arch mirror](https://github.com/omacom-io/omarchy-mirror) koji kasni mjesec dana za najnovijim, kako bismo mogli uhvatiti sve nove nekompatibilnosti koje zahtijevaju promjene konfiguracije prije nego što ljudima stvore probleme.

Ali ako želite pomoći u otkrivanju tih potencijalnih problema, možete koristiti kanal edge. Tako će vaši Collie paketi pratiti najnovije razvojne buildove i moći ćete ažurirati na najnovije Arch pakete čim postanu dostupni. To biste trebali raditi samo ako ste iskusni s Linuxom i znate kako oporaviti sustav koji ima probleme.

Prije svakog novog velikog izdanja završnu ćemo provjeru obavljati putem kanala RC. Ako ste zainteresirani za pomoć pri završnom dotjerivanju, dođite družiti se u #omarchy-release-candidates na Discordu.

Na kraju, tu je kanal dev, koji Collie povezuje izravno s git checkoutom izvornog koda u `~/collie`, u kombinaciji s edge paketima. Ovaj kanal trebali biste koristiti samo ako ste iskusni korisnik Linuxa, radite izravno na Collieju i spremni ste tolerirati lomove.

Između kanala možete se prebacivati putem _Ažuriranje > Kanal_ iz izbornika Collie (ili `collie-channel-set` u terminalu).

### Promjena kernela

Collie podiže vlastiti `linux-omarchy` kernel, ali uz njega možete držati instalirane i druge, poput standardnog Arch `linux` kernela ili eksperimentalnog builda koji testirate. Kad ih ima više od jednog, _Ažuriranje > Kernel_ u izborniku Collie navodi ih s kvačicom uz onaj koji se podiže prema zadanim postavkama. Odaberite drugi, jednom unesite lozinku i podići će se nakon sljedećeg ponovnog pokretanja. Ostali kerneli ostaju u izborniku za podizanje sustava, pa i dalje možete ručno odabrati jedan ako vam novi zadani stvori probleme. U terminalu, `collie-kernel` služi za prikaz trenutnog zadanog, `collie-kernel list` za ono što je instalirano, a `collie-kernel set <kernel>` za promjenu.

### Ažuriranja firmvera

Vaši paketi nisu jedino što zastarijeva. Mnogi prijenosnici i periferni uređaji isporučuju BIOS, SSD i firmver za priključne stanice putem Linux Vendor Firmware Servicea, a _Ažuriranje > Firmware_ u izborniku Collie dohvatit će i instalirati sve što čeka za vaš hardver. Pri prvom pokretanju instalira `fwupd`. Mnogo firmvera može se zapisati samo tijekom ponovnog pokretanja, pa se nemojte iznenaditi ako vas zatraži jedno.

### Upozorenje o izravnim pacman/yay ažuriranjima

Ako ste već upoznati s Archom, možda ćete doći u iskušenje da sami jednostavno pokrenete `pacman -Syu` ili `yay -Syu`, ali ako to učinite, propustit ćete snimku, migracije i ažuriranja konfiguracije koje Collie pokreće zajedno s novim paketima. Zato će Collie zapravo zaustaviti izravnu nadogradnju sustava i uputiti vas umjesto toga na `collie update`. (Ako doista znate što radite, zaštita će vam reći kako je zaobići za jednu transakciju.)

### Vraćanje loših ažuriranja

Ako ikada budete imali problem nakon što obavite ažuriranje, možete vratiti sustav na snimku napravljenu prije ažuriranja. Samo ponovno pokrenite sustav i u izborniku za podizanje sustava odaberite snimku od prije nego što ste započeli ažuriranje.

![bootloader](images/bootloader.webp)

Ako su vam se konfiguracijske datoteke nekako oštetile, možete i ponovno instalirati Collie pomoću `collie reinstall` u terminalu. Time ćete ponovno instalirati sve zadane Collie pakete, prebaciti se na stable i vratiti na stariju verziju sve pakete koji su previše novi te resetirati sve konfiguracijske datoteke. Imajte na umu da će vam pritom sve korisničke promjene konfiguracije u odnosu na zadane postavke Collieja biti prebrisane!
