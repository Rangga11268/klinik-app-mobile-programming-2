import sys
import json
import urllib.request

BASE_URL = "https://6ae951e91a7b15aaa5101572.mockapi.io/api/v1"

# Preset tables for Perpustakaan system
PRESETS = {
    "peminjaman": [
        {
            "id": "1",
            "no_pinjam": "PJ-2026-037-01",
            "id_anggota": "37",
            "nama_peminjam": "DARELL RANGGA PUTRA RACHMAN",
            "id_buku": "1",
            "judul_buku": "Pemrograman Mobile dengan Flutter & Dart",
            "tanggal_pinjam": "2026-11-01T08:30:00.000Z",
            "tanggal_kembali": "2026-11-08T15:00:00.000Z",
            "status": "Dipinjam"
        },
        {
            "id": "2",
            "no_pinjam": "PJ-2026-037-02",
            "id_anggota": "37",
            "nama_peminjam": "DARELL RANGGA PUTRA RACHMAN",
            "id_buku": "2",
            "judul_buku": "Mastering RESTful API & Postman Client Testing",
            "tanggal_pinjam": "2026-11-02T10:00:00.000Z",
            "tanggal_kembali": "2026-11-09T15:00:00.000Z",
            "status": "Dipinjam"
        },
        {
            "id": "3",
            "no_pinjam": "PJ-2026-001-01",
            "id_anggota": "1",
            "nama_peminjam": "RIFKI WAHYU",
            "id_buku": "3",
            "judul_buku": "Fundamental Rekayasa Perangkat Lunak Berorientasi Objek",
            "tanggal_pinjam": "2026-10-25T09:00:00.000Z",
            "tanggal_kembali": "2026-11-01T14:00:00.000Z",
            "status": "Sudah Kembali"
        },
        {
            "id": "4",
            "no_pinjam": "PJ-2026-039-01",
            "id_anggota": "39",
            "nama_peminjam": "TIRTA ADI MULYA",
            "id_buku": "4",
            "judul_buku": "Desain Antarmuka UI/UX Aplikasi Mobile Modern",
            "tanggal_pinjam": "2026-10-28T11:00:00.000Z",
            "tanggal_kembali": "2026-11-04T12:00:00.000Z",
            "status": "Dipinjam"
        },
        {
            "id": "5",
            "no_pinjam": "PJ-2026-040-01",
            "id_anggota": "40",
            "nama_peminjam": "WAHYU NOVIANTO",
            "id_buku": "5",
            "judul_buku": "Pengantar Kecerdasan Buatan & Machine Learning",
            "tanggal_pinjam": "2026-10-29T13:30:00.000Z",
            "tanggal_kembali": "2026-11-05T16:00:00.000Z",
            "status": "Dipinjam"
        }
    ],
    "pengembalian": [
        {
            "id": "1",
            "no_kembali": "KB-2026-001",
            "id_pinjam": "1",
            "tanggal_kembali": "2026-11-03T10:00:00.000Z",
            "denda": 0,
            "status_denda": "Lunas",
            "petugas": "Pak Dosen Cep Adiwiharja"
        },
        {
            "id": "2",
            "no_kembali": "KB-2026-002",
            "id_pinjam": "3",
            "tanggal_kembali": "2026-11-01T14:00:00.000Z",
            "denda": 5000,
            "status_denda": "Lunas",
            "petugas": "Petugas Perpus Darell"
        }
    ],
    "petugas": [
        {
            "id": "1",
            "nip": "19241009",
            "nama_petugas": "DARELL RANGGA PUTRA RACHMAN",
            "jabatan": "Kepala Perpustakaan",
            "no_telepon": "081237765432",
            "email": "darell.petugas@perpus.ac.id"
        },
        {
            "id": "2",
            "nip": "19241058",
            "nama_petugas": "TIRTA ADI MULYA",
            "jabatan": "Staff Sirkulasi",
            "no_telepon": "081239765432",
            "email": "tirta.petugas@perpus.ac.id"
        }
    ],
    "kategori": [
        {"id": "1", "nama_kategori": "Pemrograman & Mobile", "deskripsi": "Buku teknik coding Dart, Flutter, Kotlin, Java"},
        {"id": "2", "nama_kategori": "Rekayasa Perangkat Lunak", "deskripsi": "Buku analisis sistem, UML, dan database"},
        {"id": "3", "nama_kategori": "UI/UX & Desain", "deskripsi": "Buku perancangan antarmuka dan interaksi pengguna"},
        {"id": "4", "nama_kategori": "Kecerdasan Buatan", "deskripsi": "Buku Machine Learning dan Data Science"},
        {"id": "5", "nama_kategori": "Jaringan & Keamanan", "deskripsi": "Buku Cyber Security dan Cloud Computing"}
    ],
    "penerbit": [
        {"id": "1", "nama_penerbit": "Informatika Bandung", "kota": "Bandung", "no_telepon": "022-7201234"},
        {"id": "2", "nama_penerbit": "Andi Publisher", "kota": "Yogyakarta", "no_telepon": "0274-561234"},
        {"id": "3", "nama_penerbit": "Elex Media Komputindo", "kota": "Jakarta", "no_telepon": "021-53650110"}
    ]
}

def inject_table(table_name):
    data = PRESETS.get(table_name.lower())
    if not data:
        print(f"Table preset '{table_name}' not found. Available: {list(PRESETS.keys())}")
        return
    
    url = f"{BASE_URL}/{table_name}"
    print(f"Injecting {len(data)} items to {url}...")
    for item in data:
        try:
            req = urllib.request.Request(
                url,
                data=json.dumps(item).encode('utf-8'),
                headers={'Content-Type': 'application/json', 'User-Agent': 'Mozilla/5.0'},
                method='POST'
            )
            with urllib.request.urlopen(req) as resp:
                print(f"  + Added ID {item.get('id')}: status {resp.status}")
        except Exception as e:
            print(f"  - Error on ID {item.get('id')}: {e}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        tbl = sys.argv[1]
        inject_table(tbl)
    else:
        print("Usage: python quick_table_generator.py <table_name>")
        print("Presets:", list(PRESETS.keys()))
