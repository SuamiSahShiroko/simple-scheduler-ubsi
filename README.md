# Aplikasi Penjadwal Sederhana

Selamat datang di Aplikasi Penjadwal Sederhana, fungsi dari aplikasi ini Flutter ialah penjadwalan dan pengelolaan acara.

## Fitur

- **Lihat Acara**: Lihat daftar acara yang dijadwalkan beserta detailnya.
- **Tambah Acara**: Menambahkan acara baru dengan nama, deskripsi, dan waktu mulai.
- **Edit Acara**: Modifikasi acara yang ada .
- **Hapus Acara**: Hapus acara dari jadwal.
- **Terima Pemberitahuan**: Terima pemberitahuan ketika acara aktif.

## Kelompok 3

- **Muhamad Imam Hussein**
- **Daryl Tampubolon**
- **Juan Euaggelion**
- **Randi Paisal Sipahutar**

## Pengguna Sistem
- **User**
Satu pengguna ("User") dapat membuat banyak acara ("Event"). Setiap acara dikaitkan dengan satu pengguna yang telah membuatnya.

## Skenario Kebutuhan Pengguna
#### 1. Menambahkan Acara Baru:
- **Deskripsi:** Pengguna ingin menambahkan acara baru ke dalam aplikasi.
- **Langkah-langkah:**
  1. Pengguna masuk ke dalam aplikasi.
  2. Pengguna memilih opsi "Tambahkan Acara" atau "Buat Acara Baru."
  3. Pengguna mengisi formulir dengan detail acara (judul, deskripsi, waktu mulai, waktu selesai).
  4. Pengguna menekan tombol "Tambahkan" atau "Simpan."

#### 2. Melihat Daftar Acara:
- **Deskripsi:** Pengguna ingin melihat daftar acara yang telah mereka buat.
- **Langkah-langkah:**
  1. Pengguna masuk ke dalam aplikasi.
  2. Pengguna memilih opsi "Daftar Acara" atau "Lihat Acara."
  3. Aplikasi menampilkan daftar acara yang dimiliki pengguna.

#### 3. Mengedit Acara:
- **Deskripsi:** Pengguna ingin mengedit acara yang sudah ada.
- **Langkah-langkah:**
  1. Pengguna masuk ke dalam aplikasi.
  2. Pengguna memilih acara yang ingin diedit dari daftar acara.
  3. Pengguna memilih opsi "Edit Acara."
  4. Pengguna melakukan perubahan pada informasi acara (judul, deskripsi, waktu mulai, waktu selesai).
  5. Pengguna menekan tombol "Simpan" untuk menyimpan perubahan.

#### 4. Melihat Detail Acara:
- **Deskripsi:** Pengguna ingin melihat detail lengkap dari suatu acara.
- **Langkah-langkah:**
  1. Pengguna masuk ke dalam aplikasi.
  2. Pengguna memilih acara dari daftar acara.
  3. Aplikasi menampilkan detail lengkap acara, termasuk judul, deskripsi, waktu mulai, dan waktu selesai.

#### 5. Menghapus Acara:
- **Deskripsi:** Pengguna ingin menghapus suatu acara.
- **Langkah-langkah:**
  1. Pengguna masuk ke dalam aplikasi.
  2. Pengguna memilih acara yang ingin dihapus dari daftar acara.
  3. Pengguna memilih opsi "Hapus Acara."
  4. Aplikasi meminta konfirmasi pengguna sebelum menghapus acara.

#### 6. Menerima Notifikasi:
- **Deskripsi:** Pengguna ingin menerima notifikasi tentang acara yang akan datang.
- **Langkah-langkah:**
  1. Pengguna membuat atau mengedit acara dan mengatur pengingat.
  2. Aplikasi memberikan notifikasi kepada pengguna sesuai waktu yang telah diatur.

## Screenshoot Program
![Screenshot 1](https://github.com/SuamiSahShiroko/simple-scheduler-ubsi/blob/test/screenshoots/1.PNG)
![Screenshot 2](https://github.com/SuamiSahShiroko/simple-scheduler-ubsi/blob/test/screenshoots/2.PNG)
![Screenshot 3](https://github.com/SuamiSahShiroko/simple-scheduler-ubsi/blob/test/screenshoots/3.PNG)
![Screenshot 4](https://github.com/SuamiSahShiroko/simple-scheduler-ubsi/blob/test/screenshoots/4.PNG)
![Screenshot 5](https://github.com/SuamiSahShiroko/simple-scheduler-ubsi/blob/test/screenshoots/5.PNG)
![Screenshot 6](https://github.com/SuamiSahShiroko/simple-scheduler-ubsi/blob/test/screenshoots/6.PNG)
![Screenshot 7](https://github.com/SuamiSahShiroko/simple-scheduler-ubsi/blob/test/screenshoots/7.PNG)

## Get Started

1. Clone repository:

   ```bash
   git clone https://github.com/SuamiSahShiroko/simple-scheduler-ubsi

2. Install Depedencies
  flutter pub get 

3. Run 
  flutter run