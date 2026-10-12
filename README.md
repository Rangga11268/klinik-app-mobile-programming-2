# 🏥 Klinik App - Mobile Programming 2

Aplikasi Sistem Informasi Manajemen Klinik berbasis **Flutter** untuk praktikum mata kuliah **Mobile Programming II** di **Universitas Bina Sarana Informatika (UBSI)**.

Repository ini mencakup implementasi materi praktikum dari **Pertemuan 2 hingga Pertemuan 6** lengkap dengan tugas mandiri, navigasi Drawer (Sidebar), sistem Login & Beranda, serta in-memory CRUD (Create, Read, Update, Delete) untuk 3 entitas data: **Poli**, **Pegawai**, dan **Pasien**.

---

## 👤 Identitas Mahasiswa

- **Nama Lengkap:** DARELL RANGGA PUTRA RACHMAN
- **No. Absen / Identitas:** 37
- **Mata Kuliah:** Mobile Programming II
- **Program Studi:** Sistem Informasi
- **Fakultas:** Teknik dan Informatika
- **Perguruan Tinggi:** Universitas Bina Sarana Informatika (UBSI)

---

## 📋 Cakupan Materi & Fitur (Pertemuan 2 – 6)

### 1. Pertemuan 2: Dasar Tampilan & Detail Data
- Model data `Poli` (`lib/model/poli.dart`).
- Halaman list data Poli (`PoliPage` / `Poli37`).
- Halaman detail poli (`PoliDetail`) dengan navigasi `MaterialPageRoute`.
- **Tugas P2:** Pembuatan Model, List, dan Detail untuk **Pegawai** dan **Pasien**.

### 2. Pertemuan 3: Pemisahan Item & Form Tambah
- Pemisahan widget item ke dalam komponen modular (`PoliItem`).
- Form input tambah data baru (`PoliForm`) dengan `TextEditingController`.
- Tombol aksi tambah (+) pada AppBar.
- **Tugas P3:** Pembuatan `PegawaiItem`, `PegawaiForm`, `PasienItem`, dan `PasienForm`.

### 3. Pertemuan 4: Pemisahan Widget ke Fungsi & State Management
- Pemisahan elemen widget form ke dalam method fungsi privat (`_fieldNamaPoli()`, `_tombolSimpan()`).
- Pengiriman data input kembali ke halaman list utama menggunakan callback & `Navigator.pop()`.
- Penambahan data langsung tampil secara dinamis pada list tanpa reload.

### 4. Pertemuan 5: Form Ubah & Konfirmasi Hapus Data (CRUD Lengkap)
- Form ubah data (`PoliUpdateForm`, `PegawaiUpdateForm`, `PasienUpdateForm`) dengan data otomatis terisi (pre-filled).
- Dialog konfirmasi sebelum hapus data (`AlertDialog` dengan tombol Batal dan Ya/Hapus).
- Penghapusan data secara in-memory dari `List<T>`.

### 5. Pertemuan 6: Login, Beranda, & Sidebar Menu (Drawer)
- **Halaman Login (`Login`)**: Form input username & password dengan icon dan validasi.
- **Halaman Beranda (`Beranda`)**: Dashboard sambutan dengan info mahasiswa.
- **Sidebar Drawer (`Sidebar`)**: Menu drawer navigasi terpadu untuk:
  - 🏠 Beranda
  - 🏥 Data Poli
  - 👥 Data Pegawai
  - 🧑‍🦽 Data Pasien
  - 🚪 Keluar (Logout)

### 🌟 Fitur Tambahan & Penyempurnaan (Challenge Ready)
- **Date Picker Kalender:** Input tanggal lahir pada Pegawai dan Pasien menggunakan dialog interaktif kalender (`showDatePicker`).
- **Daftar Tenaga Medis:** Tampilan tim dokter/perawat yang bertugas di halaman Detail Poli.
- **Automated Smoke Test:** Test skenario lengkap dari login, navigasi sidebar, tambah, ubah, hingga hapus data (`test/widget_test.dart`).

---

## 💻 Kredensial Login Demo

| Field | Nilai Demo |
| :--- | :--- |
| **Username** | `admin` |
| **Password** | `admin` |
| *Catatan* | *Bisa juga langsung klik tombol **Login** untuk masuk ke sistem.* |

---

## 🛠️ Prasyarat Sistem (Prerequisites)

Sebelum menjalankan aplikasi, pastikan komputer/laptop kamu sudah terpasang:
1. **Flutter SDK** (Versi 3.10 atau yang lebih baru) 👉 [Unduh Flutter](https://docs.flutter.dev/get-started/install)
2. **Dart SDK** (Otomatis terpasang bersama Flutter SDK)
3. **Git** 👉 [Unduh Git](https://git-scm.com/)
4. **Google Chrome** atau browser modern lainnya (untuk menjalankan versi web)
5. **VS Code** atau **Android Studio** dengan ekstensi *Flutter & Dart*

Periksa kesiapan sistem dengan perintah:
```bash
flutter doctor
```

---

## 🚀 Panduan Menjalankan Aplikasi (Step-by-Step)

### 1. Clone Repository
Buka Terminal / Command Prompt / Git Bash, lalu jalankan:
```bash
git clone https://github.com/Rangga11268/klinik-app-mobile-programming-2.git
```

### 2. Masuk ke Folder Project
```bash
cd klinik-app-mobile-programming-2
```

### 3. Unduh Package & Dependensi
```bash
flutter pub get
```

### 4. Jalankan Aplikasi

Pilih salah satu metode di bawah ini:

#### Opsi A: Langsung di Google Chrome (Paling Mudah)
```bash
flutter run -d chrome
```

#### Opsi B: Web Server di Port 8080 (Rekomendasi Praktikum)
```bash
flutter run -d web-server --web-port=8080
```
Setelah muncul pesan `lib\main.dart is being served at http://0.0.0.0:8080`, buka browser dan kunjungi:
👉 **[http://localhost:8080](http://localhost:8080)**

#### Opsi C: Menggunakan Microsoft Edge
```bash
flutter run -d edge
```

#### Opsi D: Menjalankan di Emulator Android / Device Fisik
Pastikan emulator atau perangkat Android sudah terhubung:
```bash
flutter run
```

---

## 🧪 Menjalankan Pengujian (Testing)

Untuk memastikan seluruh fungsi validasi, navigasi, dan CRUD berjalan normal tanpa error:

```bash
# Analisis kode (linter & syntax check)
flutter analyze

# Jalankan pengujian otomatis (unit & widget smoke test)
flutter test
```

---

## 📂 Struktur Direktori Project

```text
klinik37/
├── assets/
│   └── img/
│       └── profile-picture.png      # Aset foto profil mahasiswa
├── lib/
│   ├── main.dart                    # Entry point aplikasi (Theme & routing awal ke Login)
│   ├── model/
│   │   ├── poli.dart                # Model data Poli
│   │   ├── pegawai.dart             # Model data Pegawai (NIP, Nama, Tgl Lahir, Telepon, Email, Password)
│   │   └── pasien.dart              # Model data Pasien (No. RM, Nama, Tgl Lahir, Telepon, Alamat)
│   └── ui/
│       ├── login.dart               # Tampilan Form Login Admin (Pertemuan 6)
│       ├── beranda.dart             # Tampilan Beranda Dashboard (Pertemuan 6)
│       ├── sidebar.dart             # Komponen Drawer Navigasi Terpadu (Pertemuan 6)
│       ├── poli_37.dart             # List Data Poli & State In-Memory
│       ├── poli_item.dart           # Widget modular item list Poli
│       ├── poli_form.dart           # Form tambah data Poli (Method separation P4)
│       ├── poli_detail.dart         # Detail Poli (Aksi Ubah, Hapus, Daftar Pegawai)
│       ├── poli_update_form.dart    # Form edit data Poli (Pertemuan 5)
│       ├── pegawai_page.dart        # List Data Pegawai & State In-Memory
│       ├── pegawai_item.dart        # Widget modular item list Pegawai
│       ├── pegawai_form.dart        # Form tambah Pegawai (+ DatePicker)
│       ├── pegawai_detail.dart      # Detail Pegawai (Aksi Ubah & Hapus)
│       ├── pegawai_update_form.dart # Form edit Pegawai (+ DatePicker)
│       ├── pasien_page.dart         # List Data Pasien & State In-Memory
│       ├── pasien_item.dart         # Widget modular item list Pasien
│       ├── pasien_form.dart         # Form tambah Pasien (+ DatePicker)
│       ├── pasien_detail.dart       # Detail Pasien (Aksi Ubah & Hapus)
│       └── pasien_update_form.dart  # Form edit Pasien (+ DatePicker)
├── test/
│   └── widget_test.dart             # Automated smoke testing flow aplikasi
└── pubspec.yaml                     # Konfigurasi project & assets
```

---

## 🔧 Panduan Troubleshooting (Solusi Masalah Umum)

### 1. Error: Port 8080 Bentrok (`SocketException: errno = 10048`)
**Penyebab:** Ada proses `flutter run` atau server lain yang masih berjalan dan menggunakan port 8080.  
**Solusi:**
- Jalankan di port lain:
  ```bash
  flutter run -d web-server --web-port=8081
  ```
- Atau matikan proses lama melalui PowerShell:
  ```powershell
  taskkill /F /IM dart.exe
  ```

### 2. Tampilan Browser Putih / Blank
**Penyebab:** File build cache web lama masih tersimpan atau server belum selesai melakukan compile awal.  
**Solusi:**
1. Tunggu hingga terminal menampilkan `lib\main.dart is being served at...`.
2. Lakukan Hard Reload di browser dengan menekan **Ctrl + F5** atau **Ctrl + Shift + R**.
3. Jika masih terjadi, jalankan pembersihan cache:
   ```bash
   flutter clean
   flutter pub get
   flutter run -d web-server --web-port=8080
   ```

### 3. Perintah Pintas di Terminal Flutter (`Interactive Commands`)
Saat aplikasi sedang berjalan di terminal:
- Tekan **`r`** : Hot Reload (memperbarui perubahan kode secara instan).
- Tekan **`R`** : Hot Restart (memulai ulang state aplikasi dari awal).
- Tekan **`q`** : Quit (menghentikan aplikasi).

---

## 📝 Lisensi & Hak Cipta
Project ini dibuat untuk tujuan pembelajaran dan pemenuhan tugas akademik mata kuliah Mobile Programming II di Universitas Bina Sarana Informatika. Bebas digunakan dan dimodifikasi untuk keperluan belajar.
