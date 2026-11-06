# Sistem uykusu

Collie, askıya almayı ve hazırda bekletmeyi varsayılan olarak etkinleştirir, ancak makinenizde ikisinden biriyle sorun yaşıyorsanız bunları kapatabilirsiniz.

DGX Spark ve ASUS Ascent GX10 gibi NVIDIA GB10 makinelerinde, NVIDIA'nın DGX OS'sinde olduğu gibi askıya alma ve hazırda bekletme kapalıdır, çünkü uykunun o donanımda çalıştığı henüz gösterilmemiştir. Askıya alma açma/kapama düğmesi ve hazırda bekletme kurulumu orada geçerli değildir. Uykuyu tekrar açmak için `/etc/systemd/sleep.conf.d/collie-sleep-disabled.conf` dosyasını `sudo rm` ile kaldırın; Suspend daha sonra menüye geri döner ve hazırda bekletme diğer makinelerdeki gibi kurulabilir. `sudo collie apply hardware --install-user "$USER"` komutunu çalıştırmak dosyayı geri koyar.

### Güç profilleri

Bir dizüstü bilgisayarda Collie, güç profilinizi prize takılı durum ve pilde çalışma durumu için ayrı ayrı hatırlar ve fişi takıp çıkardıkça ikisi arasında geçiş yapar. Kutudan çıktığı haliyle bu, AC üzerinde performance ve pilde balanced anlamına gelir.

Makinenizin neleri sunduğunu `collie powerprofiles list` ile görebilir ve şu anda içinde bulunduğunuz durum için istediğinizi `collie powerprofiles set autodetect power-saver` ile ayarlayabilirsiniz. Hiçbir şeyin fişini çekmeden diğer durumu ayarlamak için onu doğrudan adlandırın: `collie powerprofiles set battery power-saver`. Ne seçerseniz, bir sonraki sefer o durumda olduğunuzda geri alacağınız şey odur.

### Askıya almayı aç/kapat

Askıya almayı terminalden `collie toggle suspend` komutunu çalıştırarak açıp kapatırsınız. Bu, _System_ (veya `Super + Esc`) altındaki seçeneği yalnızca gösterir/gizler ve ardından sisteminizde tutarlı çalışıp çalışmadığını görebilirsiniz. Çalışmazsa aynı komutla tekrar gizleyebilirsiniz.

### Hazırda bekletmeyi aç/kapat

Hazırda bekletmeyi terminalden `collie hibernation setup` komutunu çalıştırarak kurarsınız. Hazırda bekletme, önyükleme sürücünüzde fiziksel RAM tahsisinizin boyutunda bir /swap alt birimi oluşturur, bu yüzden bolca boş alanınız olduğundan emin olun. 32GB'lık bir makinede bu birim için her zaman 32GB+ boş alana ihtiyacınız olacaktır. Hazırda bekletme ayrıca varsayılan Limine bootloader'ını gerektirir.

Kurulduğunda, hazırda bekletme seçeneğini _System_ (veya `Super + Esc`) altında görürsünüz ve ardından sisteminizde tutarlı çalışıp çalışmadığını görebilirsiniz. Çalışmazsa `collie hibernation remove` komutunu çalıştırarak tekrar kaldırabilirsiniz.
