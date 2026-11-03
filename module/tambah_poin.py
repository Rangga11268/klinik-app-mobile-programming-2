import sys
import openpyxl

EXCEL_PATH = "d:/laragon/www/klinik37/module/Rekap_Poin_Mobile_Programming_2_Kelas_195A05.xlsx"

MEETING_COLS = {
    "P2": 6, "P3": 7, "P4": 8, "P5": 9, "P7": 10,
    "P8": 11, "P9": 12, "P10": 13, "P11": 14, "P12": 15
}

def find_row_by_absen(ws, absen):
    for r in range(12, 52):
        if ws.cell(r, 2).value == int(absen):
            return r
    return None

def add_point(absen, poin, pertemuan="P9"):
    pertemuan = pertemuan.upper()
    if pertemuan not in MEETING_COLS:
        print(f"Error: Pertemuan '{pertemuan}' tidak valid. Pilihan: {list(MEETING_COLS.keys())}")
        return
        
    wb = openpyxl.load_workbook(EXCEL_PATH)
    ws = wb.active
    
    row = find_row_by_absen(ws, absen)
    if not row:
        print(f"Error: Mahasiswa absen {absen} tidak ditemukan!")
        return
        
    nama = ws.cell(row, 4).value
    col_idx = MEETING_COLS[pertemuan]
    ws.cell(row, col_idx, int(poin))
    
    wb.save(EXCEL_PATH)
    print(f"✅ Sukses: Absen {absen} ({nama}) diisi {poin} poin pada kolom {pertemuan}.")

def transfer_points(from_absen, to_absen, points):
    wb = openpyxl.load_workbook(EXCEL_PATH)
    ws = wb.active
    
    row_from = find_row_by_absen(ws, from_absen)
    row_to = find_row_by_absen(ws, to_absen)
    
    if not row_from or not row_to:
        print("Error: Salah satu nomor absen tidak ditemukan!")
        return
        
    nama_from = ws.cell(row_from, 4).value
    nama_to = ws.cell(row_to, 4).value
    
    # Q: Transfer Keluar (Col 17), R: Transfer Masuk (Col 18)
    curr_out = ws.cell(row_from, 17).value or 0
    curr_in = ws.cell(row_to, 18).value or 0
    
    ws.cell(row_from, 17, curr_out + int(points))
    ws.cell(row_to, 18, curr_in + int(points))
    
    wb.save(EXCEL_PATH)
    print(f"✅ Sukses Transfer: {points} poin dari Absen {from_absen} ({nama_from}) ke Absen {to_absen} ({nama_to}).")

if __name__ == "__main__":
    if len(sys.argv) >= 4 and sys.argv[1].lower() == "transfer":
        # python module/tambah_poin.py transfer <from_absen> <to_absen> <poin>
        transfer_points(int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]))
    elif len(sys.argv) >= 3:
        # python module/tambah_poin.py <absen> <poin> [pertemuan]
        meet = sys.argv[3] if len(sys.argv) > 3 else "P9"
        add_point(int(sys.argv[1]), int(sys.argv[2]), meet)
    else:
        print("Panduan Perintah:")
        print("  1. Tambah Nilai:    python module/tambah_poin.py <absen> <poin> [pertemuan]")
        print("  2. Transfer Poin:   python module/tambah_poin.py transfer <dari_absen> <ke_absen> <poin>")
