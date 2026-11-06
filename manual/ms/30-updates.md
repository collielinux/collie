# Kemas Kini

Collie dan pakej anda sentiasa dikemas kini melalui _Update > Collie_ dalam menu Collie (`Super + Space`).

Collie sendiri dipasang sebagai pakej pacman biasa daripada [Repositori Pakej Collie](https://github.com/omacom-io/omarchy-pkgs), jadi kemas kini akan memasang [keluaran Collie terkini](https://github.com/embeputer/collie/releases), menjalankan sebarang migrasi yang belum selesai untuk menyelaraskan sistem anda dengan versi terkini, dan mengemas kini semua pakej sistem daripada [Mirror Arch Collie](https://github.com/omacom-io/omarchy-mirror) dan [AUR](https://aur.archlinux.org/) (jika anda ada memasang sebarang pakej AUR).

Apabila keluaran baharu tersedia, ikon anak panah bulat akan muncul di sebelah kanan jam anda. Klik ikon tersebut dan proses kemas kini akan bermula.

![update-available](images/update-available.webp)

### Empat saluran

Collie dikemas kini melalui empat saluran: stable, RC, edge, dan dev. Pemasangan baharu bermula pada saluran stable, yang menjejaki [keluaran rasmi](https://github.com/embeputer/collie/releases/), serta [mirror Arch Collie stable](https://github.com/omacom-io/omarchy-mirror) yang ketinggalan sebulan di belakang versi terkini, supaya kami dapat mengesan sebarang ketidakserasian baharu yang memerlukan perubahan konfigurasi sebelum ia menimbulkan masalah kepada pengguna.

Tetapi jika anda ingin membantu mengesan potensi masalah tersebut, anda boleh menggunakan saluran edge. Saluran itu akan memastikan pakej Collie anda menjejaki binaan pembangunan terkini, dan membolehkan anda mengemas kini kepada pakej Arch terkini sebaik sahaja ia tersedia. Anda hanya patut melakukan ini jika anda berpengalaman dengan Linux, dan tahu cara memulihkan sistem yang bermasalah.

Sebelum setiap keluaran utama baharu, kami akan melakukan pengesahan akhir menggunakan saluran RC. Jika anda berminat untuk membantu dengan sentuhan akhir, mari sertai kami di #omarchy-release-candidates di Discord.

Akhir sekali, terdapat saluran dev, yang menghubungkan Collie terus kepada checkout git kod sumber di `~/collie`, digabungkan dengan pakej edge. Anda hanya patut menggunakan saluran ini jika anda pengguna Linux yang berpengalaman, bekerja secara langsung pada Collie, dan sanggup menanggung kerosakan.

Anda boleh bertukar antara saluran menggunakan _Update > Channel_ daripada menu Collie (atau `collie-channel-set` dalam terminal).

### Menukar kernel

Collie membut kernel `linux-omarchy` sendiri, tetapi anda boleh mengekalkan kernel lain yang dipasang bersebelahan dengannya, seperti kernel Arch standard `linux` atau binaan eksperimen yang sedang anda uji. Apabila terdapat lebih daripada satu kernel, _Update > Kernel_ dalam menu Collie akan menyenaraikannya dengan tanda semak di sebelah kernel yang membut secara lalai. Pilih kernel lain, masukkan kata laluan anda sekali, dan kernel tersebut akan membut selepas restart seterusnya. Kernel lain kekal dalam menu but, jadi anda masih boleh memilihnya secara manual jika kernel lalai baharu menimbulkan masalah. Dalam terminal, gunakan `collie-kernel` untuk melihat kernel lalai semasa, `collie-kernel list` untuk melihat kernel yang dipasang, dan `collie-kernel set <kernel>` untuk bertukar.

### Kemas kini firmware

Pakej anda bukan satu-satunya perkara yang akan menjadi lapuk. Banyak komputer riba dan peranti menghantar firmware BIOS, SSD, dan dok melalui Linux Vendor Firmware Service, dan _Update > Firmware_ dalam menu Collie akan mengambil dan memasang apa sahaja kemas kini yang tersedia untuk perkakasan anda. Ia akan memasang `fwupd` pada kali pertama anda menjalankannya. Kebanyakan firmware hanya boleh ditulis semasa reboot, jadi jangan terkejut jika anda diminta untuk melakukannya.

### Amaran tentang kemas kini pacman/yay secara langsung

Jika anda sudah biasa dengan Arch, anda mungkin teringin untuk hanya menjalankan `pacman -Syu` atau `yay -Syu` sendiri, tetapi jika anda berbuat demikian, anda akan terlepas snapshot, migrasi, dan kemas kini konfigurasi yang dijalankan oleh Collie bersama pakej baharu. Sebab itulah Collie sebenarnya akan menghentikan naik taraf sistem secara langsung dan sebaliknya mengarahkan anda kepada `collie update`. (Jika anda benar-benar tahu apa yang anda lakukan, pengawal tersebut akan memberitahu anda cara memintasnya untuk satu transaksi sahaja.)

### Mengembalikan kemas kini yang bermasalah

Jika anda menghadapi masalah selepas melakukan kemas kini, anda boleh mengembalikan sistem anda kepada snapshot yang diambil sebelum kemas kini tersebut. Hanya restart dan pilih snapshot dalam menu pemuatan but dari sebelum anda memulakan kemas kini.

![bootloader](images/bootloader.webp)

Jika entah bagaimana fail konfigurasi anda telah rosak, anda juga boleh melakukan pemasangan semula Collie menggunakan `collie reinstall` dalam terminal. Ini akan memasang semula semua pakej lalai Collie, meletakkan anda pada saluran stable dan menurunkan versi mana-mana pakej yang terlalu baharu, serta menetapkan semula semua fail konfigurasi. Ambil perhatian bahawa semua perubahan konfigurasi pengguna anda kepada tetapan lalai Collie akan ditindih apabila anda melakukan ini!
