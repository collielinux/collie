# Teksti ekstraheerimine ja dikteerimine

### Teksti ekstraheerimine

Ekraanilt piirkonna valimiseks teksti ekstraheerimiseks vajuta `Super + Ctrl + PrtScr`. Avatud lähtekoodiga OCR-mudel tesseract teisendab seejärel valiku kiiresti tekstiks ja asetab selle lõikelauale. Seejärel vajuta lihtsalt kleepimiseks `Super + V`.

See on väga kasulik aadresside haaramiseks piltide jalustest või veebisaitide pealkirjadesse manustatud telefoninumbritest.

 ![text-extraction](images/text-extraction.webp)

### Dikteerimine

Värsketel installidel on [Superwhisper](https://superwhisper.com/) vaikimisi dikteerimise taustsüsteem, mis kasutab pilvetöötlust ilma võrguühenduseta mudelite allalaadimiseta. Vali Collie menüüs _Setup > Defaults > Dictation_ kaudu Superwhisper, [Voxtype](https://voxtype.io/) või [Hex](https://anoma.ly/hex/). Taustsüsteemi valimine installib selle vajadusel ja muudab selle dikteerimise vaikeseadeks. Voxtype laadib inglise keele baasmudeli, mis võtab 150MB; muuda mudelit käsuga `voxtype setup model` ja muid seadeid faili `~/.config/voxtype/config.toml` kaudu. Superwhisper avab oma seaded pilve- või kohaliku töötluse valimiseks ja OPR hoiab rakenduse ajakohasena. Hex laadib seadistamise ajal alla oma seadmesisese kõnemudeli ja töötab kasutajateenusena `hex.service`; mudeli ja muude seadete muutmiseks ava selle aken riba salveikoonilt või käivitades käsu `hex`.

Dikteerid hoides all `Right Alt` või lülitades klahvikombinatsiooniga `Alt + Space` ja dikteeritud tekst ilmub fokuseeritud sisestusalasse. Need otseteed kasutavad valitud taustsüsteemi. Right Alt käivitab dikteerimise ka modifikaatoriakordis kasutamisel; nende akordide puhul kasuta Left Alt. Klaviatuuripaigutustel, kus Right Alt on AltGr, kasuta `Alt + Space`, et AltGr jääks tippimiseks kättesaadavaks. Installid ajast, mil Alt + Space veel vaikeseade polnud, säilitavad kõneks allhoidmiseks klahvi `F9` ja lülitamiseks klahvikombinatsiooni `Super + Ctrl + X`, mis on lisatud faili `~/.config/hypr/bindings.lua`; eemalda need sealt, et anda need klahvid rakendustele tagasi.

Samad otseteed töötavad iga taustsüsteemiga. Vali oma taustsüsteem Setup > Defaults > Dictation kaudu. Taustsüsteemi installer konfigureerib selle ja salvestab valiku. Käivita `collie default dictation`, et näha, milline on valitud. Valik salvestatakse faili `~/.config/collie/defaults/dictation`. Värsked installid valivad automaatselt Superwhisperi.

Collie laadib valitud taustsüsteemi töölauaintegratsiooni automaatselt. Superwhisperi konfigureerimine kaustas `~/.config/hypr/` pole vajalik.

Kohandatud seosed ja skriptid saavad kasutada käske `collie dictation start`, `collie dictation stop` ja `collie dictation toggle`. Valitud taustsüsteem tegeleb salvestamise ja transkriptsiooniga. Superwhisperi valimine keelab selle loomuliku allhoidmise otsetee ja määrab selle loomulikuks lülitiks `Ctrl + Alt + Space`, hoides selle Collie salvestusklahvidest eraldi. Superwhisper nõuab vähemalt ühte loomulikku salvestamise otseteed ja selle tühistamise otsetee jääb kättesaadavaks.

Täiendavad taustsüsteemid saavad integreeruda Colliet muutmata. Paku PATH-is käivitatavat faili nimega `collie-dictation-<backend>`, mis aktsepteerib käske `start`, `stop` ja `toggle` ning naaseb kohe, rikke korral nullist erineva olekuga. Selle installer konfigureerib teenusepakkuja ja kutsub pärast edukat seadistamist välja `collie-dictation-use <backend>`. See peatab eelmise taustsüsteemi ja salvestab valiku aatomiliselt; `stop` peab õnnestuma, kui teenusepakkuja on jõude või kättesaamatu. Taustsüsteemide nimed kasutavad väiketähti, numbreid ja sidekriipse. Paku seadistamiseks `collie-install-dictation-<backend>`; `collie default dictation <backend>` käivitab selle. Lisa Defaults menüükirje Collie menüülaienduse kaudu selle valija kutsumiseks. Valikuline töölauaintegratsioon võib asuda asukohas `${XDG_CONFIG_HOME:-$HOME/.config}/<backend>/shortcuts.lua`.
