import sys
import json
import subprocess

def generate_custom(table_name, columns_str, count=5):
    cols = [c.strip() for c in columns_str.replace(',', ' ').split() if c.strip()]
    items = []
    
    for i in range(1, count + 1):
        row = {}
        for c in cols:
            low = c.lower()
            if 'id' in low:
                row[c] = str(i)
            elif 'nama' in low:
                row[c] = f"DARELL RANGGA PUTRA RACHMAN" if i == 1 else f"Mahasiswa {i}"
            elif 'nim' in low:
                row[c] = f"19241009" if i == 1 else f"192400{i:02d}"
            elif 'telp' in low or 'phone' in low or 'hp' in low or 'kontak' in low:
                row[c] = f"0812377654{i:02d}"
            elif 'email' in low:
                row[c] = f"user{i}@perpus.ac.id"
            elif 'alamat' in low:
                row[c] = f"Jl. Salemba Raya No. {i}, Jakarta"
            elif 'tgl' in low or 'tanggal' in low or 'date' in low:
                row[c] = "2026-11-03T08:00:00.000Z"
            elif 'status' in low:
                row[c] = "Aktif" if i % 2 != 0 else "Selesai"
            elif 'judul' in low:
                row[c] = f"Buku Pemrograman Mobile Flutter Edisi {i}"
            elif 'kategori' in low:
                row[c] = i
            elif 'harga' in low or 'denda' in low or 'biaya' in low:
                row[c] = i * 5000
            elif 'prodi' in low or 'jurusan' in low:
                row[c] = "Sistem Informasi"
            elif 'fakultas' in low:
                row[c] = "Teknik & Informatika"
            elif 'tahun' in low:
                row[c] = "2024"
            else:
                row[c] = f"Nilai_{c}_{i}"
        items.append(row)
        
    out_file = f"d:/laragon/www/klinik37/module/data_{table_name}_custom.json"
    with open(out_file, 'w', encoding='utf-8') as f:
        json.dump(items, f, indent=2)
        
    print(f"Generated {len(items)} items for '{table_name}' with columns {cols}")
    # Copy to clipboard
    try:
        cmd = f"Get-Content -Raw -Encoding utf8 '{out_file}' | Set-Clipboard"
        subprocess.run(["powershell", "-Command", cmd], check=True)
        print("COPIED TO CLIPBOARD SUCCESSFULLY!")
    except Exception as e:
        print("Clipboard error:", e)

if __name__ == "__main__":
    if len(sys.argv) >= 3:
        table = sys.argv[1]
        cols = " ".join(sys.argv[2:])
        generate_custom(table, cols)
    else:
        print("Usage: python dynamic_schema_handler.py <table_name> <col1,col2,col3...>")
