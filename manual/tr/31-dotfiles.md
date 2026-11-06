# Dotfiles

Collie öncelikle `~/.config` içinde yaşayan, dotfiles denen dosyalar üzerinden yapılandırılır. Bunlar, değişiklikleriniz için sizin dosyalarınız sayılır. `/usr/share/collie` içinde yaşayan dosyalar Collie'nin kendisine aittir ve onlarla oynamamalısınız. `/usr/share/collie` içindeki bir şeyi değiştirmeniz gerekirse, bunun yerine değeri `~/.config` içinde geçersiz kılmalısınız.

Temel yapılandırmalar doğrudan Collie menüsünden (`Super + Space`) düzenlenebilir; örneğin _Kurulum > Klavye > Tuş Atamaları_, _Kurulum > Girdi_ ve _Kurulum > Yapılandırma > [file]_. Bu şekilde yaptığınızda, yapılandırma düzenlemelerinden sonra yeniden başlatılması gereken her işlem, düzenleyiciyi kapattıktan sonra otomatik olarak yeniden başlatılır (varsayılan olarak Neovim — `:wq`, unutmayın! — ama bunu _Kurulum > Varsayılanlar > Düzenleyici_ üzerinden değiştirebilirsiniz).

İşte `~/.config` içindeki temel dosyaların ve neleri denetlediklerinin listesi:

| File                  | Purpose              |
| ----------------------- | --------------------- |
| `~/.config/hypr/hyprland.lua` | Ana Hyprland yapılandırması. Collie varsayılanlarını ve aşağıdaki geçersiz kılma dosyalarınızı yükler. [Hyprland yapılandırmaları hakkında daha fazla bilgi edinin](https://wiki.hypr.land/Configuring/).  |
| `~/.config/hypr/bindings.lua` | Kendi tuş atamalarınız ve varsayılanlara yönelik geçersiz kılmalarınız. |
| `~/.config/hypr/monitors.lua` | Döndürme, ekstra modlar veya bir monitörü kapalı tutma gibi, monitör panelinin kapsamadığı monitör ayarları. |
| `~/.config/hypr/input.lua` | Klavye düzeninizi, fare ve izleme paneli ayarlarınızı denetler. |
| `~/.config/hypr/looknfeel.lua` | Boşlukları, kenarlıkları, animasyonları ve görünümün geri kalanını denetler. |
| `~/.config/hypr/autostart.lua` | Oturumla başlatılan ekstra işlemleri denetler. |
| `~/.config/collie/shell.json` | Collie kabuğunu denetler: çubuk konumu, düzen ve widget'lar, ayrıca ekran koruyucu, kilit ve boşta kalma zamanlamaları. |
| `~/.config/foot/foot.ini` | Terminalinizi denetler (foot varsayılandır). |
| `~/.XCompose` | Hızlı erişim emoji'lerinizi ve ad/e-posta otomatik tamamlama tanımlınızı belirler. Değişiklik yaptıktan sonra `collie-restart-xcompose` çalıştırmayı unutmayın. |

Sonunda kendi kurulumunuzu ince ayarla uğraşırken bir sürü değişiklik yaparsanız, tüm bu dotfiles'ı yedeklemek iyi bir fikirdir. [Stow bunu yapmanın harika bir yoludur](https://www.youtube.com/watch?v=NoFiYOqnC4o).

### Kendi uygulamalarınızı oturumla başlatma

Bir şeyin her giriş yaptığınızda çalışmasını istiyorsanız — bir eşitleme arka plan programı, bir sohbet uygulaması, kendi betiğiniz — onu `~/.config/hypr/autostart.lua` içine koyun:

```lua
o.launch_on_start("my-service")
```

Bu, komutu oturumun parçası olarak başlatır, böylece tekrar çıkış yaptığınızda düzgün şekilde temizlenir.

### Sistem olaylarında betik çalıştırma

Collie birkaç anda hook'lar tetikler ve kendi betiklerinizi bunlara bağlayabilirsiniz. Bunlar `~/.config/collie/hooks/<event>.d/` içinde yaşar; her olay için bir dizin vardır ve olay gerçekleştiğinde oradaki her çalıştırılabilir dosya çalışır:

| Event | When it runs |
| ----- | ------------ |
| `post-boot` | Masaüstü başladıktan hemen sonra |
| `post-update` | `collie update` işleminin sonuna doğru, paketler, geçişler ve hizmet yeniden başlatmalarından sonra, mise araçları güncellenmeden önce |
| `pre-refresh-pacman` | `collie refresh pacman` paket yapılandırmasını yeniden eşitledikten sonra, paketleri güncellemeden önce; kanal değişimi bunu aynı yenileme adımı sırasında çalıştırır |
| `theme-set` | Bir tema değişiminden sonra (tema adı `$1` içindedir) |
| `font-set` | Bir yazı tipi değişiminden sonra (yazı tipi adı `$1` içindedir) |
| `battery-low` | Pil azaldığında (yüzde `$1` içindedir) |

`pre-refresh-pacman` hook'u, paket işleminden önce çalıştığı için özel depoların veya `IgnorePkg` satırlarının ait olduğu yerdir. Güncellemeyle ilgili her iki hook da Collie önbelleğe alınmış sudo yetkisini temizledikten sonra sizin kullanıcınız olarak çalışır, bu yüzden `sudo` kullanan bir hook'un kendi yetkisine ihtiyacı olur ve parolanızı isteyebilir.

Bu dizinlerin her biri zaten bir hook'un şeklini gösteren bir `.sample` dosyası barındırır — işe koşmak için adındaki `.sample` kısmını kaldırın. Başka bir yerde yazdığınız bir betiği kurmak için `collie hook install post-boot ~/my-hook` kullanın; bu, onu içeri kopyalar ve çalıştırılabilir yapar.

### Kendi menü girdilerinizi ekleme

Collie menüsü (`Super + Space`), `~/.config/collie/extensions/collie-menu.jsonc` düzenlenerek kendi satırlarınızla genişletilebilir. Girdiler noktalı bir id ile anahtarlanır ve onları ağaca yerleştiren şey id'dir; yani `personal` kök menüde, `personal.notes` ise onun içinde görünür:

```jsonc
"personal": {"icon":"","label":"Personal"},
"personal.notes": {"icon":"󰎞","label":"Notes","action":"collie-launch-editor ~/notes"},
```

Mevcut bir id'yi yeniden kullanırsanız, yeni bir satır eklemek yerine o satırı geçersiz kılarsınız. Dosya, mevcut tüm alanların yorum olarak belgelendiği hâliyle gelir.

### Kendi shell export'larınızı, fonksiyonlarınızı ve alias'larınızı ekleme

Collie, bir sürü ergonomik alias ve yararlı fonksiyonla gelir, ama kendi eklemelerinizi istemeniz çok yaygındır. Hem alias'ları, fonksiyonları hem de export'ları `~/.bashrc` içine eklemelisiniz. Bu dosya güncellemelerde geçersiz kılınmaz. Collie varsayılanlarından herhangi birini değiştirmek isterseniz, onları da buraya güvenle ekleyebilirsiniz.

### Masaüstü için ortam değişkenleri ayarlama

Masaüstü oturumu export'ları `~/.config/uwsm/env.d/` içine aittir. Bu dosyalar masaüstünüz başlamadan önce çalışır, bu yüzden bir shell hatası sizi giriş ekranına geri gönderebilir. Bunları düzenlerken çalışır durumda bir terminali açık tutun. Bir geçersiz kılmayı devre dışı bırakmak için onu `env.d` dışına taşıyın. Bir değişiklik girişi engellerse bkz. [giriş kurtarma](45-troubleshooting.md#my-password-is-accepted-but-i-return-to-the-login-screen).

### Dahili Collie dosyalarını değiştirme

Bak, bu senin bilgisayarın. Onunla istediğin her şeyi yapabilirsin, ama `/usr/share/collie` içindeki dosyalarda doğrudan değişiklik yapmamanı tavsiye ederim. Bunlar Collie pacman paketine aittir, bu yüzden değişikliklerin bir sonraki güncellemede basitçe geçersiz kılınır. Bunun yerine, sevmediğin varsayılan değerleri `~/.config/*` klasöründe geçersiz kılman çok daha iyi olur.

Bu şekilde hemen hemen her şeyi değiştirebilirsin; varsayılan tuş atamaları gibi. Diyelim [Obsidian](https://obsidian.md/) yerine [Joplin](https://joplinapp.org/) kullanmak için `~/.config/hypr/bindings.lua` dosyasını düzenle ( `collie-pkg-add joplin-bin` ile kur):

```lua
o.rebind("SUPER + SHIFT + O", "Joplin", "joplin-desktop")
```

`o.rebind`, yerine geçecek atamayı eklemeden önce mevcut atamayı kaldırır. Başlatma yardımcıları ve atama seçenekleri dahil, `o.bind` ile aynı argümanları alır. Bir atama eklemek için `o.bind`, bir atamayı yerine bir şey koymadan kaldırmak için `hl.unbind` kullanın.

Dahili Collie dosyaları üzerinde kurcalamakta ısrar edersen, _Güncelle > Kanal > Dev_ üzerinden dev kanalına geç. Bu, Collie'yi `~/collie` içindeki kaynak kodun bir git kopyasına bağlar; onu gönlünce değiştirmekte özgürsün. Burada sana ne yapacağını söyleyecek kimse yok!

### Değişiklikleri sıfırlama

Yapılandırmaları sonunda batırırsan, onları Collie menüsündeki _Güncelle > Yapılandırma_ üzerinden her zaman varsayılanlara geri döndürebilirsin. Ya da her şeyi sıfırlamak için `collie reinstall configs` çalıştırarak.
