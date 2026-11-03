import openpyxl
from openpyxl.styles import Font, PatternFill, Alignment, Border, Side
from openpyxl.utils import get_column_letter

wb = openpyxl.Workbook()

# Sheet 1: Klasemen & Rekapitulasi Utama
ws1 = wb.active
ws1.title = "Klasemen & Rekap Poin"
ws1.views.sheetView[0].showGridLines = True

# Sheet 2: Log Riwayat Transfer Poin
ws2 = wb.create_sheet(title="Log Transfer Poin")
ws2.views.sheetView[0].showGridLines = True

# Sheet 3: Simulator Transfer
ws3 = wb.create_sheet(title="Simulator Transfer Poin")
ws3.views.sheetView[0].showGridLines = True

# Palette
NAVY_HEADER = "1E293B"
MEETING_HEADER = "334155"
FUTURE_HEADER = "475569"
TRANSFER_HEADER = "4338CA"
RESULT_HEADER = "1D4ED8"
GREEN_BG = "DCFCE7"
GREEN_TXT = "166534"
GOLD_BG = "FEF3C7"
GOLD_TXT = "92400E"
ZEBRA_BG = "F8FAFC"
BORDER_COLOR = "CBD5E1"
WHITE = "FFFFFF"
CARD_BG = "F1F5F9"

font_title = Font(name="Segoe UI", size=15, bold=True, color="0F172A")
font_subtitle = Font(name="Segoe UI", size=9.5, italic=True, color="475569")
font_rule_title = Font(name="Segoe UI", size=9.5, bold=True, color="0F172A")
font_rule_desc = Font(name="Segoe UI", size=9, color="334155")
font_kpi_label = Font(name="Segoe UI", size=8.5, bold=True, color="475569")
font_kpi_num = Font(name="Segoe UI", size=15, bold=True, color="0F172A")
font_kpi_green = Font(name="Segoe UI", size=15, bold=True, color=GREEN_TXT)
font_header = Font(name="Segoe UI", size=9.5, bold=True, color=WHITE)
font_data = Font(name="Segoe UI", size=9.5, color="0F172A")
font_bold = Font(name="Segoe UI", size=9.5, bold=True, color="0F172A")
font_pass = Font(name="Segoe UI", size=9.5, bold=True, color=GREEN_TXT)
font_tier200 = Font(name="Segoe UI", size=9.5, bold=True, color=GOLD_TXT)

fill_header_main = PatternFill(start_color=NAVY_HEADER, end_color=NAVY_HEADER, fill_type="solid")
fill_header_meeting = PatternFill(start_color=MEETING_HEADER, end_color=MEETING_HEADER, fill_type="solid")
fill_header_future = PatternFill(start_color=FUTURE_HEADER, end_color=FUTURE_HEADER, fill_type="solid")
fill_header_transfer = PatternFill(start_color=TRANSFER_HEADER, end_color=TRANSFER_HEADER, fill_type="solid")
fill_header_result = PatternFill(start_color=RESULT_HEADER, end_color=RESULT_HEADER, fill_type="solid")

fill_zebra = PatternFill(start_color=ZEBRA_BG, end_color=ZEBRA_BG, fill_type="solid")
fill_green_pass = PatternFill(start_color=GREEN_BG, end_color=GREEN_BG, fill_type="solid")
fill_gold_tier = PatternFill(start_color=GOLD_BG, end_color=GOLD_BG, fill_type="solid")
fill_card = PatternFill(start_color=CARD_BG, end_color=CARD_BG, fill_type="solid")

thin_side = Side(border_style="thin", color=BORDER_COLOR)
border_cell = Border(left=thin_side, right=thin_side, top=thin_side, bottom=thin_side)
double_bottom = Side(border_style="double", color="0F172A")
border_total = Border(top=thin_side, bottom=double_bottom, left=thin_side, right=thin_side)

align_center = Alignment(horizontal="center", vertical="center")
align_left = Alignment(horizontal="left", vertical="center")
align_right = Alignment(horizontal="right", vertical="center")

# ==================== SHEET 1 BUILD ====================
ws1.merge_cells("A1:V1")
ws1["A1"] = "REKAPITULASI POIN KEAKTIFAN & KLASEMEN AKADEMIK MAHASISWA"
ws1["A1"].font = font_title
ws1["A1"].alignment = align_left
ws1.row_dimensions[1].height = 24

ws1.merge_cells("A2:V2")
ws1["A2"] = "Mata Kuliah: Mobile Programming II (19.5A.05) | Dosen Pengampu: Cep Adiwiharja | Program Studi Sistem Informasi - Universitas Bina Sarana Informatika"
ws1["A2"].font = font_subtitle
ws1.row_dimensions[2].height = 18

ws1.merge_cells("B4:V4")
ws1["B4"] = "📌 KETENTUAN POIN & TINGKAT FASILITAS AKADEMIK:"
ws1["B4"].font = font_rule_title
ws1["B4"].alignment = align_left

ws1.merge_cells("B5:V5")
ws1["B5"] = "• Tier 1 (150 - 199 Poin): Nilai Mutlak A + Bebas Tugas Projek Akhir & Presentasi (P14-P15) + Hak Dispensasi Presensi 1 Pertemuan (1x)"
ws1["B5"].font = font_rule_desc
ws1["B5"].alignment = align_left

ws1.merge_cells("B6:V6")
ws1["B6"] = "• Tier 2 (>= 200 Poin)   : Nilai Mutlak A + Bebas Tugas Projek Akhir & Presentasi (P14-P15) + Hak Dispensasi Presensi 2 Pertemuan (2x) | Surplus >150 Poin Sah Ditransfer"
ws1["B6"].font = font_rule_desc
ws1["B6"].alignment = align_left

ws1.row_dimensions[4].height = 16
ws1.row_dimensions[5].height = 16
ws1.row_dimensions[6].height = 16

# KPI
ws1.merge_cells("B8:C8")
ws1.merge_cells("B9:C9")
ws1["B8"] = "TOTAL MAHASISWA"
ws1["B8"].font = font_kpi_label
ws1["B8"].alignment = align_center
ws1["B8"].fill = fill_card
ws1["B9"] = 40
ws1["B9"].font = font_kpi_num
ws1["B9"].alignment = align_center
ws1["B9"].fill = fill_card

ws1.merge_cells("E8:H8")
ws1.merge_cells("E9:H9")
ws1["E8"] = "MEMENUHI SYARAT NILAI A & BEBAS PROJEK"
ws1["E8"].font = font_kpi_label
ws1["E8"].alignment = align_center
ws1["E8"].fill = fill_green_pass
ws1["E9"] = '=COUNTIF(S12:S51, ">=150") & " Mahasiswa"'
ws1["E9"].font = font_kpi_green
ws1["E9"].alignment = align_center
ws1["E9"].fill = fill_green_pass

ws1.merge_cells("J8:M8")
ws1.merge_cells("J9:M9")
ws1["J8"] = "TOTAL POIN SURPLUS KELAS (DAPAT DITRANSFER)"
ws1["J8"].font = font_kpi_label
ws1["J8"].alignment = align_center
ws1["J8"].fill = fill_card
ws1["J9"] = '=SUM(T12:T51) & " Poin Tersedia"'
ws1["J9"].font = font_kpi_num
ws1["J9"].alignment = align_center
ws1["J9"].fill = fill_card

ws1.merge_cells("O8:R8")
ws1.merge_cells("O9:R9")
ws1["O8"] = "RATA-RATA POIN KELAS SAAT INI"
ws1["O8"].font = font_kpi_label
ws1["O8"].alignment = align_center
ws1["O8"].fill = fill_card
ws1["O9"] = '=ROUND(AVERAGE(S12:S51), 1) & " Poin"'
ws1["O9"].font = font_kpi_num
ws1["O9"].alignment = align_center
ws1["O9"].fill = fill_card

for r in range(8, 10):
    for c in range(1, 23):
        cell = ws1.cell(r, c)
        if cell.value:
            cell.border = border_cell

ws1.row_dimensions[8].height = 18
ws1.row_dimensions[9].height = 24

headers1 = [
    ("No", align_center, 6, fill_header_main),
    ("Absen", align_center, 8, fill_header_main),
    ("NIM", align_center, 13, fill_header_main),
    ("Nama Lengkap Mahasiswa", align_left, 44, fill_header_main),
    ("JK", align_center, 6, fill_header_main),
    ("P2", align_center, 7, fill_header_meeting),
    ("P3", align_center, 7, fill_header_meeting),
    ("P4", align_center, 7, fill_header_meeting),
    ("P5", align_center, 7, fill_header_meeting),
    ("P7", align_center, 7, fill_header_meeting),
    ("P8", align_center, 7, fill_header_meeting),
    ("P9", align_center, 7, fill_header_future),
    ("P10", align_center, 7, fill_header_future),
    ("P11", align_center, 7, fill_header_future),
    ("P12", align_center, 7, fill_header_future),
    ("Total Akumulasi", align_center, 15, fill_header_result),
    ("Transfer Keluar (-)", align_center, 18, fill_header_transfer),
    ("Transfer Masuk (+)", align_center, 18, fill_header_transfer),
    ("Total Poin Akhir", align_center, 16, fill_header_result),
    ("Surplus (>150)", align_center, 14, fill_header_transfer),
    ("Status Kelulusan & Dispensasi", align_center, 38, fill_header_result),
    ("Keterangan Capaian", align_left, 45, fill_header_result)
]

header_row = 11
ws1.row_dimensions[header_row].height = 28

for col_idx, (h_title, h_align, h_width, h_fill) in enumerate(headers1, 1):
    cell = ws1.cell(header_row, col_idx, h_title)
    cell.font = font_header
    cell.fill = h_fill
    cell.alignment = align_center
    cell.border = border_cell
    col_letter = get_column_letter(col_idx)
    ws1.column_dimensions[col_letter].width = h_width

roster_data = [
    (1, "19240001", "RIFKI WAHYU", "L", 25, 20, 50, 20, 0, 30),
    (2, "19240002", "MUHAMMAD SYAUQI", "L", 10, 0, 0, 0, 0, 0),
    (3, "19240052", "MICHIO CHRISTIAN HADY", "L", 15, 20, 50, 30, 0, 30),
    (4, "19240078", "NASVIRA MELANI PUTRI", "P", 25, 0, 30, 30, 0, 30),
    (5, "19240092", "MUHAMMAD FADHLI AKBAR RABBANI", "L", 15, 20, 50, 20, 0, 0),
    (6, "19240152", "NUNING SAWITRI", "P", 10, 0, 0, 30, 0, 30),
    (7, "19240197", "SITI KOMARIYAH", "P", 0, 0, 0, 0, 0, 0),
    (8, "19240198", "MAULISYA EKA PUTRI", "P", 10, 0, 30, 30, 0, 30),
    (9, "19240219", "ILHAM FAJRIAN", "L", 0, 20, 50, 30, 0, 30),
    (10, "19240227", "REFI FAUZAN", "L", 25, 0, 0, 30, 0, 30),
    (11, "19240230", "RAHMADI CAHYO SAPUTRO", "L", 15, 20, 50, 30, 0, 30),
    (12, "19240237", "ADESKY JAMIL SYARIFUDDIN", "L", 10, 0, 0, 0, 0, 0),
    (13, "19240239", "NASYWA ZAIN", "P", 15, 20, 50, 20, 0, 30),
    (14, "19240247", "CHESA AWALIA REFANA", "P", 25, 20, 50, 20, 0, 30),
    (15, "19240259", "KATHERINE JULIAN ANASTASIA MANURUNG", "P", 25, 20, 50, 20, 0, 30),
    (16, "19240356", "RIFA DINI ARIFAH", "P", 15, 20, 50, 0, 0, 30),
    (17, "19240463", "NAJMI NATA LAZUARDI", "L", 25, 0, 30, 30, 0, 30),
    (18, "19240465", "NABILA INTAN FADHILAH", "P", 25, 20, 50, 30, 0, 30),
    (19, "19240488", "MEGI REFKIANSYAH ANANDA PRATAMA GUMAY", "L", 15, 20, 50, 30, 0, 30),
    (20, "19240491", "SITI NUR AISYAH", "P", 25, 20, 50, 30, 0, 30),
    (21, "19240493", "WAHYU RIZKY KHOIRUDIN", "L", 25, 20, 20, 0, 0, 20),
    (22, "19240516", "DENADA PUTRI HIDAYAT", "P", 15, 0, 30, 20, 0, 20),
    (23, "19240540", "NUR AZIZAH", "P", 10, 20, 50, 10, 0, 30),
    (24, "19240629", "MUHAMAD RAFI AFDHAL", "L", 15, 0, 15, 0, 0, 30),
    (25, "19240670", "NDARU PRIYAMBODO", "L", 15, 0, 30, 20, 0, 20),
    (26, "19240697", "SYIFA AULIA", "P", 15, 20, 50, 20, 0, 30),
    (27, "19240729", "BIANCA BINTANG DACHLAN", "P", 25, 20, 50, 30, 0, 30),
    (28, "19240732", "IMAN SYAHRUDIN SUSANTO", "L", 15, 0, 0, 20, 0, 20),
    (29, "19240757", "DAVIN FIGO DANENDRA", "L", 25, 20, 50, 30, 0, 30),
    (30, "19240780", "NAYLA AMALIAH HUTAMI", "P", 15, 0, 30, 10, 0, 20),
    (31, "19240782", "MUHAMAD RIFKI SAPUTRA", "L", 15, 0, 30, 20, 0, 0),
    (32, "19240852", "INNESYA ZAHWA SUTA", "P", 10, 20, 50, 10, 0, 30),
    (33, "19240872", "MUHAMMAD ADITYA ANANDA", "L", 15, 20, 20, 20, 0, 30),
    (34, "19240895", "NAUFAL HAKIM", "L", 15, 0, 0, 20, 0, 30),
    (35, "19240918", "NOEL VALDES SIMORANGKIR", "L", 10, 0, 0, 20, 0, 30),
    (36, "19240953", "MUHAMAD RAJIB", "L", 25, 20, 50, 30, 0, 30),
    (37, "19241009", "DARELL RANGGA PUTRA RACHMAN", "L", 25, 20, 50, 30, 0, 30),
    (38, "19241018", "ABI ABRAR ROBBANI", "L", 15, 0, 30, 20, 0, 30),
    (39, "19241058", "TIRTA ADI MULYA", "L", 25, 20, 50, 30, 15, 30),
    (40, "19241060", "WAHYU NOVIANTO", "L", 25, 20, 50, 20, 15, 30)
]

def calc_total(row):
    return sum(row[4:])

sorted_roster = sorted(roster_data, key=lambda x: (calc_total(x), -x[0]), reverse=True)

start_row = 12
for rank_idx, s in enumerate(sorted_roster, 1):
    curr_row = start_row + rank_idx - 1
    absen = s[0]
    nim = s[1]
    nama = s[2]
    jk = s[3]
    p2, p3, p4, p5, p7, p8 = s[4], s[5], s[6], s[7], s[8], s[9]
    total_val = p2 + p3 + p4 + p5 + p7 + p8
    is_tier200 = (total_val >= 200)
    is_auto_a = (total_val >= 150)
    
    ws1.row_dimensions[curr_row].height = 20
    
    ws1.cell(curr_row, 1, rank_idx).alignment = align_center
    ws1.cell(curr_row, 2, absen).alignment = align_center
    ws1.cell(curr_row, 3, nim if nim != "-" else "").alignment = align_center
    ws1.cell(curr_row, 4, nama).alignment = align_left
    ws1.cell(curr_row, 5, jk).alignment = align_center
    
    ws1.cell(curr_row, 6, p2).alignment = align_center
    ws1.cell(curr_row, 7, p3).alignment = align_center
    ws1.cell(curr_row, 8, p4).alignment = align_center
    ws1.cell(curr_row, 9, p5).alignment = align_center
    ws1.cell(curr_row, 10, p7).alignment = align_center
    ws1.cell(curr_row, 11, p8).alignment = align_center
    
    ws1.cell(curr_row, 12, None).alignment = align_center
    ws1.cell(curr_row, 13, None).alignment = align_center
    ws1.cell(curr_row, 14, None).alignment = align_center
    ws1.cell(curr_row, 15, None).alignment = align_center
    
    # Formula SUM P2..P12
    ws1.cell(curr_row, 16, f"=SUM(F{curr_row}:O{curr_row})").alignment = align_center
    ws1.cell(curr_row, 16).font = font_bold
    
    # Transfer Keluar
    ws1.cell(curr_row, 17, 0).alignment = align_center
    
    # Transfer Masuk
    ws1.cell(curr_row, 18, 0).alignment = align_center
    
    # Total Akhir
    ws1.cell(curr_row, 19, f"=P{curr_row}-Q{curr_row}+R{curr_row}").alignment = align_center
    ws1.cell(curr_row, 19).font = font_bold
    
    # Surplus
    ws1.cell(curr_row, 20, f'=IF(S{curr_row}>150, S{curr_row}-150, 0)').alignment = align_center
    
    # Status
    ws1.cell(curr_row, 21, f'=IF(S{curr_row}>=200, "MEMENUHI SYARAT (NILAI A + DISPENSASI 2X)", IF(S{curr_row}>=150, "MEMENUHI SYARAT (NILAI A + DISPENSASI 1X)", "BELUM MEMENUHI SYARAT"))').alignment = align_center
    
    # Keterangan
    ws1.cell(curr_row, 22, f'=IF(S{curr_row}>=200, "Bebas Projek/Presentasi | Dispensasi 2x | Surplus: " & T{curr_row} & " Poin", IF(S{curr_row}>=150, "Bebas Projek/Presentasi | Dispensasi 1x | Surplus: " & T{curr_row} & " Poin", "Kurang " & (150-S{curr_row}) & " poin lagi"))').alignment = align_left
    
    if is_tier200:
        row_fill = fill_gold_tier
        row_font = font_tier200
    elif is_auto_a:
        row_fill = fill_green_pass
        row_font = font_pass
    elif rank_idx % 2 == 0:
        row_fill = fill_zebra
        row_font = font_data
    else:
        row_fill = None
        row_font = font_data
        
    for col in range(1, 23):
        cell = ws1.cell(curr_row, col)
        cell.border = border_cell
        cell.font = row_font
        if row_fill:
            cell.fill = row_fill

sum_row = start_row + len(sorted_roster)
ws1.row_dimensions[sum_row].height = 24
ws1.merge_cells(f"A{sum_row}:E{sum_row}")
ws1[f"A{sum_row}"] = "RATA-RATA KELAS (AVERAGE)"
ws1[f"A{sum_row}"].font = font_bold
ws1[f"A{sum_row}"].alignment = align_right

for col_idx in range(6, 21):
    col_letter = get_column_letter(col_idx)
    cell = ws1.cell(sum_row, col_idx, f"=ROUND(AVERAGE({col_letter}12:{col_letter}51), 1)")
    cell.font = font_bold
    cell.alignment = align_center
    cell.fill = fill_card

ws1.cell(sum_row, 21, "").fill = fill_card
ws1.cell(sum_row, 22, "").fill = fill_card

for col in range(1, 23):
    ws1.cell(sum_row, col).border = border_total

ws1.freeze_panes = "E12"


# ==================== SHEET 2: LOG RIWAYAT TRANSFER ====================
ws2.merge_cells("A1:G1")
ws2["A1"] = "BUKU CATATAN MUTASI & RIWAYAT TRANSFER POIN AKADEMIK"
ws2["A1"].font = font_title
ws2["A1"].alignment = align_left
ws2.row_dimensions[1].height = 24

ws2.merge_cells("A2:G2")
ws2["A2"] = "Audit trail mutasi poin antar mahasiswa kelas 19.5A.05 (Validasi resmi persetujuan dosen)"
ws2["A2"].font = font_subtitle
ws2.row_dimensions[2].height = 18

headers2 = [
    ("No", align_center, 6),
    ("Waktu / Tanggal", align_center, 18),
    ("Mahasiswa Pengirim", align_left, 38),
    ("Mahasiswa Penerima", align_left, 38),
    ("Jumlah Poin", align_center, 14),
    ("Keperluan / Keterangan", align_left, 32),
    ("Status Verifikasi", align_center, 18)
]

ws2.row_dimensions[4].height = 24
for c_idx, (h_name, h_align, h_w) in enumerate(headers2, 1):
    c = ws2.cell(4, c_idx, h_name)
    c.font = font_header
    c.fill = fill_header_main
    c.alignment = align_center
    c.border = border_cell
    ws2.column_dimensions[get_column_letter(c_idx)].width = h_w

sample_logs = [
    (1, "03/11/2026 15:30", "Absen 39: TIRTA ADI MULYA", "Absen 01: RIFKI WAHYU", 5, "Bantuan Capaian P8", "Terverifikasi")
]

for l_idx, log in enumerate(sample_logs, 1):
    r = 4 + l_idx
    ws2.row_dimensions[r].height = 20
    ws2.cell(r, 1, log[0]).alignment = align_center
    ws2.cell(r, 2, log[1]).alignment = align_center
    ws2.cell(r, 3, log[2]).alignment = align_left
    ws2.cell(r, 4, log[3]).alignment = align_left
    ws2.cell(r, 5, log[4]).alignment = align_center
    ws2.cell(r, 6, log[5]).alignment = align_left
    ws2.cell(r, 7, log[6]).alignment = align_center
    for c in range(1, 8):
        cell = ws2.cell(r, c)
        cell.font = font_data
        cell.border = border_cell


# ==================== SHEET 3: SIMULATOR TRANSFER ====================
ws3.merge_cells("A1:G1")
ws3["A1"] = "SIMULATOR TRANSFER & PROYEKSI POIN MAHASISWA"
ws3["A1"].font = font_title
ws3["A1"].alignment = align_left
ws3.row_dimensions[1].height = 24

ws3.merge_cells("A2:G2")
ws3["A2"] = "Gunakan lembar simulasi ini untuk menghitung dampak transfer poin sebelum diterapkan ke lembar utama."
ws3["A2"].font = font_subtitle
ws3.row_dimensions[2].height = 18

ws3.merge_cells("B4:F4")
ws3["B4"] = "PANDUAN OPERASIONAL CEPAT:"
ws3["B4"].font = font_rule_title

ws3.merge_cells("B5:F5")
ws3["B5"] = "1. Buka Sheet 'Klasemen & Rekap Poin'."
ws3["B5"].font = font_rule_desc

ws3.merge_cells("B6:F6")
ws3["B6"] = "2. Isi jumlah poin di kolom 'Transfer Keluar (-)' pada baris mahasiswa pengirim."
ws3["B6"].font = font_rule_desc

ws3.merge_cells("B7:F7")
ws3["B7"] = "3. Isi jumlah poin yang sama di kolom 'Transfer Masuk (+)' pada baris mahasiswa penerima."
ws3["B7"].font = font_rule_desc

ws3.merge_cells("B8:F8")
ws3["B8"] = "4. Total Poin Akhir, Surplus, dan Status Kelulusan akan otomatis ter-update seketika!"
ws3["B8"].font = font_rule_desc

for r in range(4, 9):
    for c in range(2, 7):
        ws3.cell(r, c).fill = fill_card
        ws3.cell(r, c).border = border_cell

for col_idx, w in enumerate([6, 12, 35, 35, 20, 25, 20], 1):
    ws3.column_dimensions[get_column_letter(col_idx)].width = w

excel_path = "d:/laragon/www/klinik37/module/Rekap_Poin_Mobile_Programming_2_Kelas_195A05.xlsx"
wb.save(excel_path)
print(f"File Excel komprehensif 3-sheet berhasil disimpan di: {excel_path}")
