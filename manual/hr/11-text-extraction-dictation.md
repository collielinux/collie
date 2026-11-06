# Izdvajanje teksta i diktiranje

### Izdvajanje teksta

Pritisnite `Super + Ctrl + PrtScr` za odabir područja na zaslonu za izdvajanje teksta. OCR model otvorenog koda tesseract zatim će brzo pretvoriti taj odabir u tekst i smjestiti ga u međuspremnik. Zatim samo pritisnite `Super + V` za lijepljenje.

To je vrlo korisno za hvatanje adresa iz podnožja slika ili telefonskih brojeva ugrađenih u naslove web stranica.

 ![text-extraction](images/text-extraction.webp)

### Diktiranje

Na novim instalacijama, [Superwhisper](https://superwhisper.com/) je zadani pozadinski sustav za diktiranje, koji koristi obradu u oblaku bez preuzimanja izvanmrežnih modela. Odaberite Superwhisper, [Voxtype](https://voxtype.io/) ili [Hex](https://anoma.ly/hex/) putem _Setup > Defaults > Dictation_ u izborniku Collie. Odabir pozadinskog sustava instalira ga ako je potrebno i postavlja ga kao zadanog za diktiranje. Voxtype učitava osnovni engleski model koji zauzima 150MB; promijenite model naredbom `voxtype setup model` i ostale postavke putem `~/.config/voxtype/config.toml`. Superwhisper otvara svoje postavke za odabir obrade u oblaku ili lokalne obrade, a OPR održava aplikaciju ažuriranom. Hex preuzima svoj govorni model na uređaju tijekom postavljanja i radi kao korisnička usluga `hex.service`; otvorite njegov prozor putem ikone u paleti na traci ili pokretanjem naredbe `hex` za promjenu modela i ostalih postavki.

Diktirate tako da držite pritisnut `Right Alt` ili prebacujete pomoću `Alt + Space`, a izdiktirani tekst pojavit će se u fokusiranom području za unos. Ovi prečaci koriste odabrani pozadinski sustav. Right Alt također pokreće diktiranje kada se koristi u akordu modifikatora; za te akorde koristite Left Alt. Na rasporedima tipkovnice gdje je Right Alt AltGr, koristite `Alt + Space` kako bi AltGr ostao dostupan za tipkanje. Instalacije iz vremena prije nego što je Alt + Space postao zadani zadržavaju `F9` za push-to-talk i `Super + Ctrl + X` za prebacivanje, dodane u `~/.config/hypr/bindings.lua`; uklonite ih odatle kako biste te tipke vratili aplikacijama.

Isti prečaci rade sa svakim pozadinskim sustavom. Odaberite svoj pozadinski sustav putem Setup > Defaults > Dictation. Instalacijski program pozadinskog sustava konfigurira ga i sprema odabir. Pokrenite `collie default dictation` da vidite koji je odabran. Odabir se sprema u `~/.config/collie/defaults/dictation`. Nove instalacije automatski odabiru Superwhisper.

Collie automatski učitava integraciju s radnom površinom odabranog pozadinskog sustava. Nije potrebna nikakva konfiguracija Superwhispera u `~/.config/hypr/`.

Prilagođene tipkovničke veze i skripte mogu koristiti `collie dictation start`, `collie dictation stop` i `collie dictation toggle`. Odabrani pozadinski sustav upravlja snimanjem i transkripcijom. Odabir Superwhispera onemogućuje njegov izvorni prečac za držanje i postavlja njegovo izvorno prebacivanje na `Ctrl + Alt + Space`, čime ga drži odvojenim od Colliejevih tipki za snimanje. Superwhisper zahtijeva barem jedan izvorni prečac za snimanje, a njegov prečac za otkazivanje ostaje dostupan.

Dodatni pozadinski sustavi mogu se integrirati bez mijenjanja Collieja. Osigurajte izvršnu datoteku naziva `collie-dictation-<backend>` na PATH koja prihvaća `start`, `stop` i `toggle` te se odmah vraća, s nenultim statusom u slučaju neuspjeha. Njezin instalacijski program konfigurira pružatelja i poziva `collie-dictation-use <backend>` nakon uspješnog postavljanja. To zaustavlja prethodni pozadinski sustav i atomski sprema odabir; `stop` mora uspjeti kada je pružatelj neaktivan ili nedostupan. Nazivi pozadinskih sustava koriste mala slova, znamenke i crtice. Osigurajte `collie-install-dictation-<backend>` za postavljanje; `collie default dictation <backend>` ga pokreće. Dodajte stavku u izbornik Defaults putem proširenja izbornika Collie za pozivanje tog selektora. Opcijska integracija s radnom površinom može se nalaziti u `${XDG_CONFIG_HOME:-$HOME/.config}/<backend>/shortcuts.lua`.
