# Utoaji wa Maandishi na Uandikaji wa Sauti

### Utoaji wa Maandishi

Bonyeza `Super + Ctrl + PrtScr` kuchagua eneo kwenye skrini kwa ajili ya utoaji wa maandishi. Kisha modeli ya OCR ya wazi ya tesseract itabadilisha uteuzi huo haraka kuwa maandishi na kuyaweka kwenye ubao wa kunakili. Kisha bonyeza tu `Super + V` kubandika.

Hii ni muhimu sana kwa kuchukua anwani kutoka kwenye vijachini vya picha au nambari za simu zilizopachikwa kwenye vichwa vya habari vya tovuti.

 ![text-extraction](images/text-extraction.webp)

### Uandikaji wa Sauti

Kwenye usakinishaji mpya, [Superwhisper](https://superwhisper.com/) ndiyo backend chaguomsingi ya uandikaji wa sauti, inayotumia uchakataji wa wingu bila kupakua modeli nje ya mtandao. Chagua Superwhisper, [Voxtype](https://voxtype.io/), au [Hex](https://anoma.ly/hex/) kupitia _Setup > Defaults > Dictation_ kwenye menyu ya Collie. Kuchagua backend huisakinisha ikihitajika na kuifanya kuwa chaguomsingi ya uandikaji wa sauti. Voxtype hupakia modeli ya msingi ya Kiingereza inayochukua 150MB; badilisha modeli kwa `voxtype setup model` na mipangilio mingine kupitia `~/.config/voxtype/config.toml`. Superwhisper hufungua mipangilio yake kuchagua uchakataji wa wingu au wa ndani, na OPR huweka programu hiyo ikisasishwa. Hex hupakua modeli yake ya usemi ya kwenye kifaa wakati wa usanidi na huendesha kama huduma ya mtumiaji ya `hex.service`; fungua dirisha lake kutoka kwenye ikoni ya trei ya upau au kwa kuendesha `hex` kubadilisha modeli na mipangilio mingine.

Unaandika kwa sauti kwa kushikilia `Right Alt`, au kwa kuwasha/kuzima kwa `Alt + Space`, na maandishi yaliyoandikwa yataonekana katika eneo la ingizo lililolengwa. Mikato hii hutumia backend iliyochaguliwa. Right Alt pia huanzisha uandikaji wa sauti inapotumika katika mchanganyiko wa virekebishaji; tumia Left Alt kwa michanganyiko hiyo. Kwenye mipangilio ya kibodi ambapo Right Alt ni AltGr, tumia `Alt + Space` ili AltGr ibaki inapatikana kwa kuandika. Usakinishaji wa kabla ya Alt + Space kuwa chaguomsingi hubaki na `F9` kwa bonyeza-ili-kuzungumza na `Super + Ctrl + X` kuwasha/kuzima, vilivyoongezwa kwenye `~/.config/hypr/bindings.lua`; viondoe hapo ili kuzirejesha funguo hizo kwa programu.

Mikato hiyo hiyo hufanya kazi na kila backend. Chagua backend yako kupitia Setup > Defaults > Dictation. Kisakinishi cha backend huisanidi na kuhifadhi chaguo. Endesha `collie default dictation` kuona ni ipi iliyochaguliwa. Chaguo huhifadhiwa katika `~/.config/collie/defaults/dictation`. Usakinishaji mpya huchagua Superwhisper kiotomatiki.

Collie hupakia kiotomatiki muunganiko wa eneo-kazi wa backend iliyochaguliwa. Hakuna usanidi wa Superwhisper unaohitajika katika `~/.config/hypr/`.

Vifungo na hati maalum vinaweza kutumia `collie dictation start`, `collie dictation stop`, na `collie dictation toggle`. Backend iliyochaguliwa hushughulikia kurekodi na unukuzi. Kuchagua Superwhisper huzima mkato wake asilia wa kushikilia na kuweka kigeuzi chake asilia kuwa `Ctrl + Alt + Space`, kukiweka tofauti na funguo za kurekodi za Collie. Superwhisper inahitaji angalau mkato mmoja asilia wa kurekodi, na mkato wake wa kughairi hubaki unapatikana.

Backend za ziada zinaweza kuunganishwa bila kubadilisha Collie. Toa programu inayoweza kutekelezwa yenye jina `collie-dictation-<backend>` kwenye PATH inayokubali `start`, `stop`, na `toggle` na kurudi mara moja, ikiwa na hali isiyo sifuri inaposhindwa. Kisakinishi chake humsanidi mtoa huduma na kuita `collie-dictation-use <backend>` baada ya usanidi kufaulu. Hii husimamisha backend iliyopita na kuhifadhi chaguo kwa njia ya atomiki; `stop` lazima ifaulu wakati mtoa huduma hana shughuli au haipatikani. Majina ya backend hutumia herufi ndogo, tarakimu, na kistariungio. Toa `collie-install-dictation-<backend>` kwa ajili ya usanidi; `collie default dictation <backend>` huizindua. Ongeza ingizo la menyu ya Defaults kupitia kiendelezi cha menyu ya Collie ili kuita kichaguzi hicho. Muunganiko wa hiari wa eneo-kazi unaweza kuwa katika `${XDG_CONFIG_HOME:-$HOME/.config}/<backend>/shortcuts.lua`.
