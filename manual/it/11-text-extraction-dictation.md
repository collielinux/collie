# Estrazione del testo e dettatura

### Estrazione del testo

Premi `Super + Ctrl + PrtScr` per selezionare un'area dello schermo da cui estrarre il testo. Il modello OCR open source tesseract convertirà poi rapidamente quella selezione in testo e la inserirà negli appunti. Poi ti basta premere `Super + V` per incollare.

È molto utile per recuperare indirizzi dai piè di pagina delle immagini o numeri di telefono incorporati nei titoli dei siti web.

 ![text-extraction](images/text-extraction.webp)

### Dettatura

Nelle nuove installazioni, [Superwhisper](https://superwhisper.com/) è il backend di dettatura predefinito, con elaborazione cloud senza download di modelli offline. Scegli Superwhisper, [Voxtype](https://voxtype.io/) o [Hex](https://anoma.ly/hex/) tramite _Setup > Defaults > Dictation_ nel menu di Collie. La selezione di un backend lo installa se necessario e lo imposta come predefinito per la dettatura. Voxtype carica un modello inglese di base da 150MB; cambia il modello con `voxtype setup model` e le altre impostazioni tramite `~/.config/voxtype/config.toml`. Superwhisper apre le sue impostazioni per scegliere l'elaborazione cloud o locale, e OPR mantiene aggiornata l'applicazione. Hex scarica il suo modello vocale on-device durante la configurazione e viene eseguito come servizio utente `hex.service`; apri la sua finestra dall'icona nella tray della barra o eseguendo `hex` per cambiare il modello e le altre impostazioni.

Detti tenendo premuto `Right Alt`, oppure attivando e disattivando la dettatura con `Alt + Space`, e il testo dettato apparirà nell'area di input attiva. Queste scorciatoie usano il backend selezionato. Right Alt avvia la dettatura anche quando viene usato in una combinazione con modificatori; usa Left Alt per quelle combinazioni. Sui layout di tastiera in cui Right Alt è AltGr, usa `Alt + Space` per mantenere AltGr disponibile per la digitazione. Le installazioni precedenti a quando Alt + Space è diventata l'impostazione predefinita mantengono `F9` per il push-to-talk e `Super + Ctrl + X` per attivare e disattivare, aggiunti a `~/.config/hypr/bindings.lua`; rimuovili da lì per restituire quei tasti alle applicazioni.

Le stesse scorciatoie funzionano con ogni backend. Seleziona il backend tramite Setup > Defaults > Dictation. L'installer del backend lo configura e salva la selezione. Esegui `collie default dictation` per vedere quale è selezionato. La selezione viene salvata in `~/.config/collie/defaults/dictation`. Le nuove installazioni selezionano Superwhisper automaticamente.

Collie carica automaticamente l'integrazione desktop del backend selezionato. Non è necessaria alcuna configurazione di Superwhisper in `~/.config/hypr/`.

Collegamenti e script personalizzati possono usare `collie dictation start`, `collie dictation stop` e `collie dictation toggle`. Il backend selezionato gestisce la registrazione e la trascrizione. La selezione di Superwhisper disabilita la sua scorciatoia nativa di mantenimento e imposta il suo toggle nativo su `Ctrl + Alt + Space`, mantenendolo separato dai tasti di registrazione di Collie. Superwhisper richiede almeno una scorciatoia di registrazione nativa, e la sua scorciatoia di annullamento resta disponibile.

Backend aggiuntivi possono integrarsi senza modificare Collie. Fornisci un eseguibile chiamato `collie-dictation-<backend>` in PATH che accetti `start`, `stop` e `toggle` e risponda prontamente, con uno stato diverso da zero in caso di errore. Il suo installer configura il provider e chiama `collie-dictation-use <backend>` dopo una configurazione riuscita. Questo arresta il backend precedente e salva la selezione in modo atomico; `stop` deve riuscire quando il provider è inattivo o non disponibile. I nomi dei backend usano lettere minuscole, cifre e trattini. Fornisci `collie-install-dictation-<backend>` per la configurazione; `collie default dictation <backend>` lo avvia. Aggiungi una voce al menu Defaults tramite un'estensione del menu di Collie per chiamare quel selettore. L'integrazione desktop opzionale può risiedere in `${XDG_CONFIG_HOME:-$HOME/.config}/<backend>/shortcuts.lua`.
