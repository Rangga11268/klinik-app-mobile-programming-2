import sys
import openpyxl

EXCEL_PATH = "d:/laragon/www/klinik37/module/Rekap_Poin_Mobile_Programming_2_Kelas_195A05.xlsx"

MEETING_COLS = {
    "P2": 6, "P3": 7, "P4": 8, "P5": 9, "P7": 10,
    "P8": 11, "P9": 12, "P10": 13, "P11": 14, "P12": 15
}

def add_point(absen, poin, pertemuan="P9"):
    pertemuan = pertemuan.upper()
    if pertemuan not in MEETING_COLS:
        print(f"Error: Pertemuan '{pertemuan}' tidak dikenal. Pilih dari: {list(MEETING_COLS.keys())}")
        return
        
    col_idx = MEETING_COLS[pertemuan]
    wb = openpyxl.load_workbook(EXCEL_PATH)
    ws = wb.active
    
    target_row = None
    for r in range(11, 51):
        if ws.cell(r, 2).value == int(absen):
            target_row = r
            break
            
    if not target_row:
        print(f"Error: Mahasiswa dengan No. Absen {absen} tidak ditemukan!")
        return
        
    nama = ws.cell(target_row, 4).value
    prev_val = ws.cell(target_row, col_idx).value or 0
    ws.cell(target_row, col_idx, int(poin))
    
    wb.save(EXCEL_PATH)
    print(f"SUKSES! Absen {absen} ({nama}) berhasil diisi poin {poin} pada kolom {pertemuan}.")
    print(f"File Excel {EXCEL_PATH} otomatis terupdate!")

if __name__ == "__main__":
    if len(sys.argv) >= 3:
        absen_arg = int(sys.argv[1])
        poin_arg = int(sys.argv[2])
        meet_arg = sys.argv[3] if len(sys.argv) > 3 else "P9"
        add_point(absen_arg, poin_arg, meet_arg)
    else:
        print("Penggunaan:")
        print("  python module/tambah_poin.py <no_absen> <poin> [pertemuan]")
        print("Contoh:")
        print("  python module/tambah_poin.py 37 30 P9")
