# 🚀 PANDUAN SENJATA LENGKAP: CHALLENGE POSTMAN REST API

**Mata Kuliah**: Mobile Programming II (19.5A.05)  
**Dosen**: Cep Adiwiharja  
**Identitas**: DARELL RANGGA PUTRA RACHMAN (NIM: `19241009`, No. Absen: `37`)  
**Fokus Kelompok**: Data Pasien (Kelompok Absen > 30)  
**File Collection Siap Pakai**: [`module/Klinik_App_Collection.postman_collection.json`](file:///d:/laragon/www/klinik37/module/Klinik_App_Collection.postman_collection.json)

---

## ⚡ 1. Cara Buka Postman & Import File (3 Detik)

Postman **sudah terinstall** di laptop Anda pada direktori:
`C:\Users\MyBook Hype AMD\AppData\Local\Postman\Postman.exe`

### Langkah Cepat Import Collection:
1. Buka aplikasi **Postman**.
2. Klik tombol **`Import`** di pojok kiri atas (atau tekan `Ctrl + O`).
3. Drag & drop file:
   `d:\laragon\www\klinik37\module\Klinik_App_Collection.postman_collection.json`
4. Klik **Import**.
5. Seketika muncul folder rapi:
   - 📁 **1. Poli** (GET All, GET Detail, POST Create, PUT Update, DELETE)
   - 📁 **2. Pasien (Fokus Absen 37)** (GET All, GET Detail, POST Create, PUT Update, DELETE)
   - 📁 **3. Pegawai** (GET All, GET Detail, POST Create, PUT Update, DELETE)

Variabel `{{base_url}}` sudah otomatis terisi `https://6ad6b0c6f71f154ac486f007.mockapi.io/api/v1`.

---

## 🎯 4 Skenario Kemungkinan Challenge Dosen & Solusinya

### Skenario 1: Dosen Minta "Coba test API Poli / Pasien lewat Postman"
Tinggal pilih request di Collection yang sudah di-import:

#### A. GET (Melihat Data)
- **Method**: `GET`
- **URL**: `https://6ad6b0c6f71f154ac486f007.mockapi.io/api/v1/poli`
- Klik tombol biru **Send**
- **Status Response**: `200 OK`
- Format balikan: Array JSON `[ { "id": "1", "nama_poli": "POLI MATA" } ]`

#### B. POST (Menambah Data Baru)
- **Method**: `POST`
- **URL**: `https://6ad6b0c6f71f154ac486f007.mockapi.io/api/v1/poli`
- Tab **Headers**:
  - Key: `Content-Type` &rarr; Value: `application/json`
- Tab **Body**: pilih opsi **`raw`**, ganti format teks biasa jadi **`JSON`**
- Masukkan payload:
  ```json
  {
    "nama_poli": "POLI GIGI DARELL"
  }
  ```
- Klik **Send**
- **Status Response**: `201 Created`

#### C. PUT (Mengubah Data)
- **Method**: `PUT`
- **URL**: `https://6ad6b0c6f71f154ac486f007.mockapi.io/api/v1/poli/1`
- Tab **Body** (`raw` -> `JSON`):
  ```json
  {
    "nama_poli": "POLI MATA & SARAF"
  }
  ```
- Klik **Send** &rarr; Status: `200 OK`

#### D. DELETE (Menghapus Data)
- **Method**: `DELETE`
- **URL**: `https://6ad6b0c6f71f154ac486f007.mockapi.io/api/v1/poli/1`
- Klik **Send** &rarr; Status: `200 OK`

---

### Skenario 2: Dosen Minta Buat Resource "Pasien" di MockAPI (Absen 37)
Jika saat `GET .../pasien` muncul error `404 Not Found`:
1. Buka [https://mockapi.io](https://mockapi.io) dan login ke akun Anda.
2. Buka project `klinik`.
3. Klik tombol **New Resource**.
4. Isi **Resource Name**: `pasien`
5. Isi schema field:
   - `id`: Faker: `Object id`
   - `nomor_rm`: Faker: `Random Number` (atau String)
   - `nama`: Faker: `Name`
   - `tanggal_lahir`: Faker: `Date`
   - `nomor_telepon`: Faker: `Phone number`
   - `alamat`: Faker: `Address`
6. Klik **Create**.
7. Buka Postman -> Klik request **`POST Create Pasien`**:
   ```json
   {
     "nomor_rm": "RM-037",
     "nama": "Darell Rangga Putra Rachman",
     "tanggal_lahir": "2004-05-15",
     "nomor_telepon": "081234567890",
     "alamat": "Jl. Merdeka No. 37 Jakarta"
   }
   ```
8. Klik **Send** &rarr; langsung muncul response `201 Created`!

---

### Skenario 3: Uji Sinkronisasi Postman & Flutter
> *"Coba kirim data dari Postman, lalu buka aplikasi Flutter apakah masuk?"*

1. Di Postman, lakukan **POST** data baru:
   ```json
   {
     "nama_poli": "POLI JANTUNG TEST POSTMAN"
   }
   ```
2. Klik **Send** di Postman (Status `201 Created`).
3. Di HP / Emulator Flutter: Buka halaman **Data Poli** (atau buka ulang).
4. `StreamBuilder` di aplikasi Flutter akan membaca API dan langsung menampilkan data yang baru dikirim dari Postman!

---

### Skenario 4: Dosen Kasih URL API Endpoint Sendiri
Misal dosen bilang: *"Gunakan API bapak di: `http://192.168.1.100:8000/api`"*
1. **Di Postman**:
   - Di tab **Variables** Collection `Klinik App`, ubah nilai `base_url` menjadi URL dosen.
2. **Di Flutter**:
   - Buka [`lib/helpers/api_client.dart`](file:///d:/laragon/www/klinik37/lib/helpers/api_client.dart#L5).
   - Ganti `baseUrl: 'https://...'` ke URL dosen.
   - Selesai!

---

## 🏆 Kunci Sukses Ambil 25 Poin Hari Ini Menuju 150 (Auto-A)
- Saat dosen melempar pertanyaan / instruksi, **langsung forward ke sini**.
- Semua skema JSON, endpoint URL, method, dan konfigurasi Flutter sudah 100% sinkron dan siap eksekusi kilat!
