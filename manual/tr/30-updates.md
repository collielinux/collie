# Güncellemeler

Collie ve paketleriniz, Collie menüsündeki (`Super + Space`) _Update > Collie_ aracılığıyla güncel tutulur.

Collie'nin kendisi, [Collie Paket Deposu](https://github.com/omacom-io/omarchy-pkgs) üzerinden normal pacman paketleri olarak kurulur; dolayısıyla bir güncelleme [en son Collie sürümünü](https://github.com/embeputer/collie/releases) kurar, sisteminizi en son sürümle senkronize etmek için bekleyen tüm geçişleri çalıştırır ve [Collie Arch Yansısı](https://github.com/omacom-io/omarchy-mirror) ile [AUR](https://aur.archlinux.org/) üzerindeki tüm sistem paketlerini günceller (herhangi bir AUR paketi kurduysanız).

Yeni sürümler çıktığında, saatinizin sağında bir daire ok simgesi görünecektir. Ona tıklayın, güncelleme işlemi başlayacaktır.

![update-available](images/update-available.webp)

### Dört kanal

Collie dört kanal üzerinden güncellenir: stable, RC, edge ve dev. Yeni kurulumlar, [resmi sürümleri](https://github.com/embeputer/collie/releases/) takip eden stable kanalıyla başlar. Aynı zamanda bir ay geriden gelen [kararlı Collie Arch yansısını](https://github.com/omacom-io/omarchy-mirror) kullanır; böylece yapılandırma değişikliği gerektiren yeni uyumsuzlukları, insanlara sorun çıkarmadan önce yakalayabiliriz.

Ama bu olası sorunları tespit etmeye yardımcı olmak isterseniz, edge kanalında çalışabilirsiniz. Bu, Collie paketlerinizin en son geliştirme derlemelerini takip etmesini sağlar ve en son Arch paketlerine çıkar çıkmaz güncellemenize olanak tanır. Bunu yalnızca Linux konusunda deneyimliyseniz ve sorun yaşayan bir sistemi nasıl kurtaracağınızı biliyorsanız yapmalısınız.

Her yeni büyük sürümden önce, RC kanalını kullanarak son doğrulamayı yapacağız. Son rötuşlara yardımcı olmak isterseniz, Discord'daki #omarchy-release-candidates kanalına gelip takılın.

Son olarak, Collie'yi doğrudan `~/collie` içindeki kaynak kodun bir git checkout'una bağlayan ve edge paketleriyle birleştiren dev kanalı var. Bu kanalı yalnızca deneyimli bir Linux kullanıcısıysanız, doğrudan Collie üzerinde çalışıyorsanız ve bozulmalara katlanmaya razıysanız kullanmalısınız.

Collie menüsündeki _Update > Channel_ seçeneğini (veya terminalde `collie-channel-set` komutunu) kullanarak kanallar arasında geçiş yapabilirsiniz.

### Çekirdek değiştirme

Collie kendi `linux-omarchy` çekirdeğini önyükler, ancak standart Arch `linux` çekirdeği veya test ettiğiniz deneysel bir derleme gibi diğer çekirdekleri de yanında kurulu tutabilirsiniz. Birden fazla çekirdek olduğunda, Collie menüsündeki _Update > Kernel_, varsayılan olarak önyüklenen çekirdeğin yanında bir onay işaretiyle bunları listeler. Başka birini seçin, parolanızı bir kez girin, bir sonraki yeniden başlatmadan sonra o önyüklenir. Diğer çekirdekler önyükleme menüsünde kalır; böylece yeni varsayılan size sorun çıkarırsa yine de elle birini seçebilirsiniz. Terminalde, geçerli varsayılanı görmek için `collie-kernel`, kurulu olanlar için `collie-kernel list` ve geçiş yapmak için `collie-kernel set <kernel>` komutunu kullanın.

### Donanım yazılımı güncellemeleri

Eski hâle gelen tek şey paketleriniz değildir. Birçok dizüstü bilgisayar ve çevre birimi; BIOS, SSD ve dock donanım yazılımlarını Linux Vendor Firmware Service aracılığıyla sunar ve Collie menüsündeki _Update > Firmware_, donanımınız için bekleyen her şeyi getirip kurar. İlk çalıştırdığınızda `fwupd` paketini kurar. Birçok donanım yazılımı yalnızca yeniden başlatma sırasında yazılabilir, bu yüzden sizden yeniden başlatma istenirse şaşırmayın.

### Doğrudan pacman/yay güncellemeleri hakkında uyarı

Arch'e zaten aşinaysanız, kendiniz `pacman -Syu` veya `yay -Syu` çalıştırma isteği duyabilirsiniz, ancak bunu yaparsanız Collie'nin yeni paketlerle birlikte çalıştırdığı anlık görüntüyü, geçişleri ve yapılandırma güncellemelerini kaçırırsınız. Bu yüzden Collie doğrudan bir sistem yükseltmesini aslında durdurur ve sizi bunun yerine `collie update` komutuna yönlendirir. (Gerçekten ne yaptığınızı biliyorsanız, koruma size tek bir işlem için bunu nasıl atlayacağınızı söyler.)

### Bozuk güncellemeleri geri alma

Bir güncelleme yaptıktan sonra bir sorun yaşarsanız, sisteminizi güncellemeden önce alınan anlık görüntüye geri alabilirsiniz. Tek yapmanız gereken yeniden başlatmak ve önyükleme menüsünden güncellemeyi başlatmadan önceki anlık görüntüyü seçmek.

![bootloader](images/bootloader.webp)

Yapılandırma dosyalarınız bir şekilde bozulduysa, terminalde `collie reinstall` komutunu kullanarak Collie'yi yeniden de kurabilirsiniz. Bu, tüm varsayılan Collie paketlerini yeniden kurar, sizi stable kanalına alır ve çok yeni olan tüm paketlerin sürümünü düşürür, ayrıca tüm yapılandırma dosyalarını sıfırlar. Bunu yaparken Collie varsayılanlarına yaptığınız tüm kullanıcı yapılandırma değişikliklerinin üzerine yazılacağını unutmayın!
