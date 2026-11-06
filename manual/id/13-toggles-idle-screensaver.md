# Toggle, Idle & Screensaver

Banyak hal yang Anda ubah sehari-hari sebenarnya bukan sebuah pengaturan. Itu adalah mode yang Anda aktifkan selama satu jam lalu matikan lagi: lampu malam saat Anda bekerja hingga larut, jangan ganggu saat Anda presentasi, tetap terjaga saat Anda menonton sesuatu. Collie menyebutnya toggle, dan semuanya bekerja dengan cara yang sama — sebuah hotkey, entri menu, dan perintah, semuanya mengenai sakelar yang sama.

### Menu toggle

`Super + Ctrl + O` membuka _Trigger > Toggle_ secara langsung, atau Anda bisa menuju ke sana dari menu Collie (`Super + Space`). Semua yang ada di daftar itu adalah sakelar yang bisa Anda balik tanpa memikirkan di mana statusnya disimpan. Sakelar untuk tampilan desktop berada di sampingnya, di bawah _Appearance_.

Dari terminal, sakelar yang sama adalah `collie toggle <thing>`. Jalankan `collie toggle` sendiri untuk melihat seluruh grupnya.

| Toggle | Hotkey | Perintah |
| ------ | ------ | ------- |
| Lampu malam | — | `collie toggle nightlight` |
| Senyapkan notifikasi | `Super + Ctrl + Alt + ,` | `collie toggle notification silencing` |
| Tetap terjaga (tanpa kunci idle) | `Super + Ctrl + I` | `collie toggle idle` |
| Penangkapan crash | — | `collie toggle crash-capture` |
| Screensaver | — | `collie toggle screensaver` |
| [Herdr](https://herdr.dev) sinkronisasi tema | — | `collie toggle theme sync` |
| Bilah menu | `Super + Shift + Space` | `collie toggle bar` |
| Touchpad | `XF86TouchpadToggle` | `collie toggle touchpad` |
| Layar sentuh | — | `collie toggle touchscreen` |
| Suspend | — | `collie toggle suspend` |
| Hybrid GPU | — | `collie toggle hybrid gpu` |

Sakelar touchpad, layar sentuh, dan hybrid GPU berada di bawah _Trigger > Hardware_ (`Super + Ctrl + H`) bukan di bawah Toggle, karena hanya muncul saat Anda benar-benar memiliki perangkat keras tersebut. Sakelar touchpad dan layar sentuh tetap bertahan setelah Hyprland dimuat ulang — nama perangkat yang dinonaktifkan disimpan ke file status kecil yang dibaca Hyprland saat startup untuk menonaktifkannya lagi.

_Appearance_ menampung bilah menu dan animasi, plus beberapa hal yang bukan perintah `collie toggle` tetapi berperilaku sama: persentase baterai di bilah, tata letak workspace default, dan di bawah _Windows_, celah jendela (`Super + Shift + Backspace`) dan aspek persegi 1 jendela (`Super + Ctrl + Backspace`).

Saat Hyprland tidak memiliki GPU untuk menggambar dan merender menggunakan CPU sebagai gantinya (llvmpipe), seperti pada Mac yang GPU-nya belum didukung, di sebagian besar virtual machines, atau saat driver grafis gagal dimuat, Collie mematikan animasi, blur, dan bayangan untuk sesi tersebut dan memberi tahu Anda sekali melalui notifikasi. _Appearance > Animations On_ mengembalikannya, dan Collie mengingatnya juga untuk sesi-sesi berikutnya.

Sebagian besar ini hanyalah file flag di bawah `~/.local/state/collie/toggles/`. Jika Anda ingin bercabang berdasarkan salah satunya dalam skrip, `collie-toggle-enabled` memberi Anda kode keluar alih-alih membuat Anda mencarinya:

```bash
collie-toggle-enabled screensaver-off && echo "screensaver is off"
```

Flag-flag tersebut dinamai berdasarkan status nonaktif — `screensaver-off`, `suspend-off`, `bar-off` — jadi keberadaannya berarti fitur tersebut dinonaktifkan.

### Indikator di bilah

Saat sebuah mode aktif, Anda mendapatkan glif kecil di tengah bilah atas di samping jam. Itulah widget indikator, dan widget ini membawa dikte, perekaman layar, pengingat yang tertunda, lampu malam, jangan ganggu, dan tetap terjaga.

Indikator yang tidak aktif disembunyikan. Arahkan kursor ke mana saja di bilah dan indikator-indikator itu akan muncul memudar dalam keadaan redup, sehingga Anda bisa mengklik salah satu untuk mengaktifkannya tanpa mengetahui hotkey-nya. Mengklik indikator yang aktif akan mematikannya kembali. Jika Anda lebih suka melihat semuanya setiap saat, atur `alwaysShow` ke `true` pada entri `collie.indicators` di `~/.config/collie/shell.json` — lihat [bilah atas](05-the-top-bar.md) untuk cara widget bilah dikonfigurasi.

### Lampu malam

Lampu malam menghangatkan layar ke 4000K, dan mengaktifkannya lagi mengembalikannya ke 6500K. Balik dari menu toggle (`Super + Ctrl + O`) atau dengan `collie toggle nightlight`. Ini digerakkan oleh hyprsunset, yang akan dijalankan oleh toggle untuk Anda jika belum berjalan.

Secara default hyprsunset tidak melakukan apa pun sama sekali pada layar Anda. `~/.config/hypr/hyprsunset.conf` disertakan dengan profil identitas justru agar tampilan tetap tidak tersentuh sampai Anda meminta kehangatan. Jika Anda lebih suka profil ini beralih berdasarkan jam, ganti dengan profil waktu:

```
profile {
    time = 20:00
    temperature = 4000
}
```

Kemudian jalankan hyprsunset saat login dengan menambahkan `o.launch_on_start("hyprsunset")` ke `~/.config/hypr/autostart.lua`. Pasangan 4000K/6500K yang digunakan oleh toggle bersifat tetap, jadi file konfigurasi adalah tempat Anda pergi jika menginginkan suhu yang berbeda.

### Jangan ganggu

`Super + Ctrl + Alt + ,` menyenyapkan notifikasi. Tidak ada toast yang muncul saat ini aktif, dan indikator lonceng yang dicoret berada di bilah untuk mengingatkan Anda mengapa desktop menjadi senyap.

Tidak ada yang hilang, kok. Notifikasi yang disenyapkan ditahan: tampilkan kembali beberapa yang terakhir di layar dengan `Super + Shift + Alt + ,`. Lihat [pemberitahuan](10-notices.md) untuk sisanya.

Dua jenis pesan tetap bisa masuk: toast konfirmasi Collie sendiri untuk sesuatu yang baru saja Anda lakukan ("Theme changed", "Screenshot saved"), dan peringatan kritis yang dikirim dari baris perintah. Aplikasi chat yang menandai semuanya sebagai kritis untuk memaksakan diri di depan Anda tidak termasuk.

### Idle

Shell Collie memiliki perilaku idle, dan waktunya adalah blok `idle` tingkat atas di `~/.config/collie/shell.json`:

```json
{
  "version": 1,
  "idle": {
    "screensaver": 150,
    "lock": 300
  }
}
```

Kedua angka tersebut adalah detik yang dihitung dari saat Anda mulai idle — bukan dari satu sama lain. Jadi dengan default, screensaver muncul setelah dua setengah menit dan layar kunci mengambil alih pada lima menit, terlepas dari apakah screensaver berjalan atau tidak. Simpan file dan shell akan mengambil waktu baru segera.

Jika Anda menutup screensaver sebelum batas waktu kunci, itu dihitung sebagai aktivitas dan kunci yang tertunda dibatalkan. Anda tidak akan terkunci hanya karena melirik mesin Anda.

Untuk menghentikan penguncian saat idle sepenuhnya, `Super + Ctrl + I` — atau `collie toggle idle` — mengaktifkan tetap terjaga, dan indikator cangkir kopi muncul di bilah. Itulah yang harus ditekan sebelum presentasi panjang atau build yang ingin Anda tonton. Tekan lagi untuk kembali normal. `collie toggle idle status` mencetak status saat ini sebagai JSON jika Anda membutuhkannya dari skrip.

Ini tentang penguncian dan screensaver, bukan daya. Suspend dan hibernasi memiliki pengaturannya sendiri di [tidur sistem](36-system-sleep.md).

### Screensaver

Screensaver Collie adalah seni ASCII yang berjalan melalui efek teks acak, satu instance per monitor. Tombol apa pun atau gerakan mouse akan keluar darinya.

Anda bisa menjalankannya sesuai permintaan dari _System > Screensaver_ (`Super + Esc`), yang memaksanya muncul bahkan jika Anda telah mematikan screensaver idle. Tidak ada hotkey yang terikat padanya secara default.

`collie toggle screensaver` adalah yang mematikan yang idle, jika Anda lebih suka langsung dari bekerja ke terkunci. Tombol, klik, gulir, atau gerakan mouse apa pun akan menutupnya.

Logo yang digambarnya bisa Anda ubah, di bawah _Appearance > Branding > Screensaver_. Unggah png atau svg dan Collie akan mengonversinya ke ASCII. Lihat [branding](41-branding.md).

### Layar kunci

`Super + Ctrl + L` mengunci mesin. Itu menjalankan layar kunci dari shell Collie, mengosongkan tampilan, mengatur ulang tata letak keyboard Anda ke yang pertama agar Anda tidak mengetik kata sandi dalam alfabet yang salah, dan — jika Anda menjalankannya — mengunci 1Password saat keluar.

Layar kunci menerima kata sandi, dan juga akan menerima sidik jari setelah Anda mengaturnya. Itu, dan cara lain untuk mengautentikasi, dibahas di [autentikasi perangkat keras](37-hardware-authentication.md).
