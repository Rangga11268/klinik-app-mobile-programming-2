# Ringkasan Materi & Kode Pertemuan 2 (Sesuai Modul)

**Mata Kuliah:** Mobile Programming II / Mobile Programming 2  
**Topik:** Membuat Halaman Data Poli, Detail Poli, dan Navigasi Antar Halaman  
**Project:** Klinik App (`klinik_app`)  

---

## 🎯 Capaian Pembelajaran Pertemuan 2
1. Menyiapkan struktur direktori awal project Flutter (`lib/model/`, `lib/ui/`, dan `assets/`).
2. Membuat model data Dart (`Poli`).
3. Membuat halaman daftar poli (`PoliPage`) menggunakan widget `Card`, `ListTile`, dan `ListView`.
4. Menggunakan `GestureDetector` untuk mendeteksi event klik pada item data.
5. Menggunakan `Navigator.push` dan `MaterialPageRoute` untuk berpindah halaman sambil mengirimkan objek data (passing data).
6. Membuat halaman detail data (`PoliDetail`) untuk menampilkan informasi spesifik serta tombol aksi "Ubah" dan "Hapus".

---

## 📂 Struktur File Pertemuan 2

```
klinik_app/
├── assets/
│   └── img/
│       └── profile-picture.png
├── lib/
│   ├── model/
│   │   └── poli.dart
│   ├── ui/
│   │   ├── poli_page.dart
│   │   └── poli_detail.dart
│   └── main.dart
├── pubspec.yaml
└── module/
    └── PERTEMUAN_2.md
```

---

## 💻 Rincian Kode Sumber (100% Sesuai Modul)

### 1. Model Poli (`lib/model/poli.dart`)
*(Modul Halaman 9)*

```dart
class Poli {
  String? id;
  String namaPoli;

  Poli({this.id, required this.namaPoli});
}
```

---

### 2. Halaman List Poli (`lib/ui/poli_page.dart`)
*(Modul Halaman 12)*

```dart
import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Poli")),
      body: ListView(
        children: [
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text("Poli Anak"),
              ),
            ),
            onTap: () {
              Poli poliAnak = Poli(namaPoli: "Poli Anak");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliAnak),
                ),
              );
            },
          ),
          const Card(
            child: ListTile(
              title: Text("Poli Kandungan"),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text("Poli Gigi"),
            ),
          ),
          const Card(
            child: ListTile(
              title: Text("Poli THT"),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

### 3. Halaman Detail Poli (`lib/ui/poli_detail.dart`)
*(Modul Halaman 9–10)*

```dart
import 'package:flutter/material.dart';
import '../model/poli.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;

  const PoliDetail({super.key, required this.poli});

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Poli")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Nama Poli : ${widget.poli.namaPoli}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Ubah"),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Hapus"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
```

---

### 4. Entry Point Aplikasi (`lib/main.dart`)
*(Modul Halaman 7)*

```dart
import 'package:flutter/material.dart';
import './ui/poli_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klinik APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: const PoliPage(),
    );
  }
}
```

---

### 5. Konfigurasi Assets (`pubspec.yaml`)

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/
    - assets/img/
```

---

## 📝 Catatan Penting & Penyesuaian Minor (Kompatibilitas Versi Flutter Modern)

1. **Tema Material 2 (`main.dart`):**
   * **Modul:** Modul dibuat pada era Flutter dengan tema default Material 2 (`primarySwatch: Colors.blue`), yang otomatis menghasilkan `AppBar` berwarna **Biru** dengan teks putih.
   * **Penyesuaian:** Di Flutter versi modern (Flutter 3.16+), default tema adalah Material 3 (yang menghasilkan `AppBar` putih/transparan). Oleh karena itu, ditambahkan konfigurasi berikut di `main.dart` agar tampilan **100% identik dengan modul**:
     ```dart
     theme: ThemeData(
       useMaterial3: false,
       primarySwatch: Colors.blue,
     )
     ```

2. **Linter & Best Practice (`const` dan `super.key`):**
   * Ditambahkan parameter constructor `const PoliPage({super.key})` dan `const MyApp({super.key})` serta keyword `const` pada widget statis agar lulus uji `flutter analyze` tanpa warning/error.

3. **Keyword `new`:**
   * Di modul tertulis `Poli poliAnak = new Poli(...)`. Di Dart modern, keyword `new` bersifat opsional dan diganti menjadi `Poli poliAnak = Poli(...)`.

4. **Alur Materi ke Pertemuan 3:**
   * Pada Pertemuan 2, modul sengaja membungkus **hanya "Poli Anak"** dengan `GestureDetector`.
   * Pada **Pertemuan 3**, list item ini akan di-refactor menjadi komponen reusable tersendiri bernama `PoliItem` (`poli_item.dart`) sehingga seluruh baris data poli dapat diklik secara otomatis.


