# Frissítések

Az Collie és a csomagjaid naprakészen tartása az Collie menüben (`Super + Space`) található _Frissítés > Collie_ ponttal történik.

Az Collie maga szokásos pacman csomagokként települ az [Collie Package Repository](https://github.com/omacom-io/omarchy-pkgs) tárolóból, így egy frissítés telepíti [a legújabb Collie kiadást](https://github.com/embeputer/collie/releases), lefuttatja az összes függőben lévő migrációt, hogy a rendszered szinkronba kerüljön a legújabbal, és frissíti az összes rendszercsomagot az [Collie Arch Mirror](https://github.com/omacom-io/omarchy-mirror) tükörről és az [AUR](https://aur.archlinux.org/) tárolóból (ha telepítettél bármilyen AUR csomagot).

Amikor új kiadások érkeznek, egy kör alakú nyíl ikon jelenik meg az órád jobb oldalán. Kattints rá, és a frissítési folyamat elindul.

![update-available](images/update-available.webp)

### Négy csatorna

Az Collie négy csatornán frissül: stable, RC, edge és dev. Az új telepítések a stable csatornán indulnak, amely a [hivatalos kiadásokat](https://github.com/embeputer/collie/releases/) követi, valamint a [stable Collie Arch mirror](https://github.com/omacom-io/omarchy-mirror) tükröt, amely egy hónappal lemaradva követi a legújabbat, így még azelőtt elkaphatjuk az esetleges új inkompatibilitásokat, amelyek konfigurációs változtatásokat igényelnek, mielőtt problémát okoznának bárkinek.

De ha szívesen segítenél kiszúrni ezeket a lehetséges problémákat, futtathatod az edge csatornát. Így az Collie csomagjaid a legújabb fejlesztői buildeket követik, és a legújabb Arch csomagokra is frissíthetsz, amint elérhetővé válnak. Csak akkor tedd ezt, ha tapasztalt Linux-felhasználó vagy, és tudod, hogyan kell helyreállítani egy problémás rendszert.

Minden nagyobb új kiadás előtt az RC csatornán végezzük el a végső ellenőrzést. Ha szívesen segítenél az utolsó simításokban, gyere és lógj velünk a Discord #omarchy-release-candidates csatornáján.

Végül ott a dev csatorna, amely közvetlenül egy `~/collie` mappában lévő git checkouthoz köti az Colliet, az edge csomagokkal kombinálva. Csak akkor használd ezt a csatornát, ha tapasztalt Linux-felhasználó vagy, közvetlenül az Collien dolgozol, és hajlandó vagy elviselni, ha valami elromlik.

A csatornák között az Collie menü _Frissítés > Csatorna_ pontjával válthatsz (vagy terminálban az `collie-channel-set` paranccsal).

### Kernelváltás

Az Collie a saját `linux-omarchy` kernelével indul, de mellette más kerneleket is telepítve tarthatsz, például az alap Arch `linux` kernelt vagy egy általad tesztelt kísérleti buildet. Ha egynél több van, az Collie menü _Frissítés > Kernel_ pontja listázza őket, egy pipával az alapértelmezés szerint induló mellett. Válassz egy másikat, add meg egyszer a jelszavad, és a következő újraindítás után azzal fog indulni. A többi kernel megmarad a boot menüben, így kézzel is választhatsz egyet, ha az új alapértelmezett gondot okozna. Terminálban az `collie-kernel` mutatja a jelenlegi alapértelmezettet, az `collie-kernel list` a telepítetteket, az `collie-kernel set <kernel>` pedig a váltásra szolgál.

### Firmware-frissítések

Nem csak a csomagjaid avulhatnak el. Sok laptop és periféria a Linux Vendor Firmware Service-en keresztül kap BIOS-, SSD- és dokkoló-firmware-t, az Collie menü _Frissítés > Firmware_ pontja pedig letölti és telepíti, ami csak vár a hardveredre. Az első futtatáskor telepíti az `fwupd` csomagot. Rengeteg firmware csak újraindítás közben írható fel, úgyhogy ne lepődj meg, ha arra kér.

### Figyelmeztetés a közvetlen pacman/yay frissítésekről

Ha már ismered az Archot, csábító lehet egyszerűen magad futtatni a `pacman -Syu` vagy `yay -Syu` parancsot, de ha így teszel, lemaradsz a pillanatképről, a migrációkról és a konfigurációs frissítésekről, amelyeket az Collie az új csomagokkal együtt futtat. Ezért az Collie valójában leállít egy közvetlen rendszerfrissítést, és helyette az `collie update` felé terel. (Ha tényleg tudod, mit csinálsz, a védelmi mechanizmus elárulja, hogyan kerülheted meg egyetlen tranzakció erejéig.)

### Rossz frissítések visszaállítása

Ha egy frissítés után valaha problémád adódna, visszaállíthatod a rendszered a frissítés előtt készült pillanatképre. Csak indítsd újra a gépet, és válaszd ki a boot betöltő menüben azt a pillanatképet, amely a frissítés megkezdése előttről származik.

![bootloader](images/bootloader.webp)

Ha a konfigurációs fájljaid valahogy megsérültek volna, terminálban az `collie reinstall` paranccsal újratelepítheted az Colliet is. Ez újratelepíti az összes alapértelmezett Collie csomagot, a stable csatornára tesz, visszaminősít minden túl új csomagot, és visszaállítja az összes konfigurációs fájlt. Ne feledd, hogy ezzel az Collie alapértelmezéseihez fűződő összes saját konfigurációs módosításod felülíródik!
