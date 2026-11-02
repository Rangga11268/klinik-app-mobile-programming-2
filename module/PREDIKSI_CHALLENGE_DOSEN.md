# 🎯 DOKUMEN PERSIAPAN LIVE CODING & PREDIKSI CHALLENGE DOSEN
**Mata Kuliah:** Mobile Programming II  
**Program Studi:** Sistem Informasi - Universitas Bina Sarana Informatika (UBSI)  
**Mahasiswa:** DARELL RANGGA PUTRA RACHMAN (No. Absen: 37)  
**Project:** Klinik App (`klinik37`)  

---

## 📌 LATAR BELAKANG KONDISI
Kelas telah melesat cepat hingga **Pertemuan 10, 11, dan 12** (Integrasi API Dio, Model JSON Serialization, MockAPI / Supabase, dan StreamBuilder). Dosen mengindikasikan bahwa *challenge* besok akan bersifat **improvisasi / variasi tak terduga**.

Berdasarkan silabus, kebiasaan dosen praktikum mobile programming, dan struktur kode `klinik37`, berikut adalah **pemetaan seluruh kemungkinan challenge yang logis beserta solusi instannya**.

---

## 🚀 KATEGORI 1: FITUR PENCARIAN & FILTER (PROBABILITAS: 90%)
*Dosen meminta daftar data tidak hanya ditampilkan statis, melainkan bisa dicari atau difilter secara realtime.*

### Skenario 1.1: Search Bar di Atas List Data
**Kasus:** Menambahkan kolom pencarian di halaman Pasien (`pasien_page.dart`) atau Poli (`poli_37.dart`).

```dart
// 1. Tambahkan state controller dan query di State:
TextEditingController _searchCtrl = TextEditingController();
String _searchQuery = "";

// 2. Di atas StreamBuilder / ListView, pasang Widget Input:
Padding(
  padding: const EdgeInsets.all(12.0),
  child: TextField(
    controller: _searchCtrl,
    decoration: InputDecoration(
      hintText: "Cari nama pasien...",
      prefixIcon: const Icon(Icons.search),
      suffixIcon: _searchQuery.isNotEmpty
          ? IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchCtrl.clear();
                setState(() => _searchQuery = "");
              },
            )
          : null,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onChanged: (val) {
      setState(() => _searchQuery = val.toLowerCase());
    },
  ),
),

// 3. Filter list sebelum dirender ke ListView.builder:
final filteredList = snapshot.data!.where((item) {
  return item.nama.toLowerCase().contains(_searchQuery) ||
         item.nomorRm.toLowerCase().contains(_searchQuery);
}).toList();
```

---

## 🚀 KATEGORI 2: PULL-TO-REFRESH & RELOAD API (PROBABILITAS: 85%)
*Dosen menguji apakah data dari API bisa ditarik ke bawah (swipe-down) untuk refresh data terbaru.*

### Solusi Instan:
Bungkus `ListView.builder` dengan `RefreshIndicator`:
```dart
RefreshIndicator(
  onRefresh: () async {
    setState(() {}); // Memicu StreamBuilder memanggil ulang getList()
  },
  child: ListView.builder(
    physics: const AlwaysScrollableScrollPhysics(), // Wajib agar bisa ditarik meski data sedikit
    itemCount: snapshot.data!.length,
    itemBuilder: (context, index) {
      return PasienItem(pasien: snapshot.data![index]);
    },
  ),
)
```

---

## 🚀 KATEGORI 3: INTEGRASI HAPUS & UBAH KE API (PREVIEW P13) (PROBABILITAS: 80%)
*Karena P12 baru sampai tahap List & Tambah data ke API, dosen mungkin menantang agar fungsi Ubah & Hapus di halaman Detail juga langsung nembak ke API.*

### Solusi Ubah Data via API (`PasienUpdateForm` / `PoliUpdateForm`):
```dart
// Pada tombol Simpan Perubahan:
onPressed: () async {
  if (_formKey.currentState!.validate()) {
    Pasien pasienEdit = Pasien(
      id: widget.pasien.id,
      nomorRm: _nomorRmCtrl.text.trim(),
      nama: _namaCtrl.text.trim(),
      tanggalLahir: _tglLahirCtrl.text.trim(),
      nomorTelepon: _teleponCtrl.text.trim(),
      alamat: _alamatCtrl.text.trim(),
    );
    
    await PasienService().ubah(pasienEdit, widget.pasien.id!).then((value) {
      Navigator.pop(context, 'update');
    });
  }
}
```

### Solusi Hapus Data via API (`PasienDetail` / `PoliDetail`):
```dart
// Pada tombol YA di AlertDialog Hapus:
ElevatedButton(
  onPressed: () async {
    Navigator.pop(context); // Tutup dialog
    await PasienService().hapus(widget.pasien).then((value) {
      Navigator.pop(context, 'delete'); // Kembali ke list
    });
  },
  child: const Text("YA"),
)
```

---

## 🚀 KATEGORI 4: TRANSAKSI / RELASI POLI & PASIEN (PROBABILITAS: 75%)
*Dosen meminta aplikasi klinik memiliki fitur relasi: misalnya "Pendaftaran Pasien ke Poli Tertentu" (Dropdown Poli).*

### Solusi Instan: Dropdown Pilihan Poli di Form Pasien
```dart
// State variable:
String? _selectedPoli;
List<String> _daftarPoli = ["POLI MATA", "POLI PENYAKIT DALAM", "POLI KULIT", "POLI TULANG"];

// Widget DropdownButtonFormField:
DropdownButtonFormField<String>(
  value: _selectedPoli,
  decoration: const InputDecoration(
    labelText: "Pilih Poli Tujuan",
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.local_hospital),
  ),
  items: _daftarPoli.map((String poli) {
    return DropdownMenuItem(value: poli, child: Text(poli));
  }).toList(),
  onChanged: (val) {
    setState(() => _selectedPoli = val);
  },
  validator: (val) => val == null ? "Silakan pilih poli" : null,
)
```

---

## 🚀 KATEGORI 5: VALIDASI INPUT & REGEX SPESIFIK (PROBABILITAS: 70%)
*Dosen menguji penanganan error input.*

1. **Nomor Telepon (Hanya Angka & Panjang 10-13 Digit):**
```dart
validator: (value) {
  if (value == null || value.trim().isEmpty) return "Nomor Telepon wajib diisi";
  if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) return "Hanya boleh berisi angka";
  if (value.trim().length < 10) return "Nomor telepon minimal 10 digit";
  return null;
}
```

2. **NIP Pegawai (18 Digit):**
```dart
validator: (value) {
  if (value == null || value.trim().isEmpty) return "NIP wajib diisi";
  if (value.trim().length != 18) return "NIP harus 18 karakter angka";
  return null;
}
```

3. **Nomor Rekam Medis (Wajib Diawali 'RM-'):**
```dart
validator: (value) {
  if (value == null || value.trim().isEmpty) return "No. RM wajib diisi";
  if (!value.trim().toUpperCase().startsWith("RM-")) return "Format harus diawali 'RM-' (contoh: RM-037)";
  return null;
}
```

---

## 🚀 KATEGORI 6: STATISTIK & BADGE JUMLAH DATA DI BERANDA (PROBABILITAS: 65%)
*Dosen meminta di Beranda tampil ringkasan: berapa jumlah Pasien, Pegawai, dan Poli yang ada.*

### Solusi Instan: Card Counter di Beranda
```dart
Widget _cardSummary(String title, int count, IconData icon, Color color) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: color.withOpacity(0.15), child: Icon(icon, color: color)),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 13, color: Colors.black54)),
              Text("$count Data", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ],
      ),
    ),
  );
}
```

---

## 🚀 KATEGORI 7: LOGOUT & SESSION MANAGEMENT (PROBABILITAS: 60%)
*Dosen menguji apakah tombol Keluar di Sidebar / Beranda benar-benar membersihkan SharedPreferences.*

```dart
// Pada ListTile "Keluar" di Sidebar:
onTap: () async {
  await UserInfo().logout();
  if (!context.mounted) return;
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const Login()),
    (route) => false,
  );
}
```

---

## 📋 DAFTAR KREDENSIAL & IDENTITAS WAJIB
- **Username Login Default:** `admin`
- **Password Login Default:** `admin`
- **Nama Mahasiswa:** `DARELL RANGGA PUTRA RACHMAN`
- **No. Absen:** `37`
- **Kelompok:** `> 30 (Fokus Data Pasien)`
- **Warna Identitas Aplikasi:** `Colors.blue`
