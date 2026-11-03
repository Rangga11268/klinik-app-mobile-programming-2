import openpyxl
from openpyxl.styles import Font, PatternFill, Alignment, Border, Side
from openpyxl.utils import get_column_letter
from openpyxl.worksheet.datavalidation import DataValidation

wb = openpyxl.Workbook()

# Sheet 1: Master Klasemen
ws1 = wb.active
ws1.title = "Klasemen & Rekap Poin"
ws1.views.sheetView[0].showGridLines = True

# Sheet 2: Quick Action Transfer & Log Mutasi
ws2 = wb.create_sheet(title="Quick Transfer & Log Mutasi")
ws2.views.sheetView[0].showGridLines = True

# Palette
NAVY_HEADER = "1E293B"       # Slate Navy
NAVY_ACCENT = "0F172A"
MEETING_HEADER = "334155"    # Slate
FUTURE_HEADER = "475569"     # Slate medium
TRANSFER_HEADER = "4338CA"   # Indigo for transfer
RESULT_HEADER = "1D4ED8"     # Royal blue

GREEN_BG = "DCFCE7"          # Soft Emerald for >= 150
GREEN_TXT = "166534"
GOLD_BG = "FEF3C7"           # Gold for >= 200
GOLD_TXT = "92400E"
ZEBRA_BG = "F8FAFC"
BORDER_COLOR = "CBD5E1"
WHITE = "FFFFFF"
CARD_BG = "F1F5F9"
ACTION_BG = "EEF2FF"        # Light Indigo for Quick Action area
ACTION_TXT = "3730A3"

# Fonts
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

font_action_title = Font(name="Segoe UI", size=11, bold=True, color=ACTION_TXT)
font_action_desc = Font(name="Segoe UI", size=9, color="4338CA")

# Fills
fill_header_main = PatternFill(start_color=NAVY_HEADER, end_color=NAVY_HEADER, fill_type="solid")
fill_header_meeting = PatternFill(start_color=MEETING_HEADER, end_color=MEETING_HEADER, fill_type="solid")
fill_header_future = PatternFill(start_color=FUTURE_HEADER, end_color=FUTURE_HEADER, fill_type="solid")
fill_header_transfer = PatternFill(start_color=TRANSFER_HEADER, end_color=TRANSFER_HEADER, fill_type="solid")
fill_header_result = PatternFill(start_color=RESULT_HEADER, end_color=RESULT_HEADER, fill_type="solid")

fill_zebra = PatternFill(start_color=ZEBRA_BG, end_color=ZEBRA_BG, fill_type="solid")
fill_green_pass = PatternFill(start_color=GREEN_BG, end_color=GREEN_BG, fill_type="solid")
fill_gold_tier = PatternFill(start_color=GOLD_BG, end_color=GOLD_BG, fill_type="solid")
fill_card = PatternFill(start_color=CARD_BG, end_color=CARD_BG, fill_type="solid")
fill_action = PatternFill(start_color=ACTION_BG, end_color=ACTION_BG, fill_type="solid")
fill_action_input = PatternFill(start_color=WHITE, end_color=WHITE, fill_type="solid")

# Borders
thin_side = Side(border_style="thin", color=BORDER_COLOR)
border_cell = Border(left=thin_side, right=thin_side, top=thin_side, bottom=thin_side)
double_bottom = Side(border_style="double", color="0F172A")
border_total = Border(top=thin_side, bottom=double_bottom, left=thin_side, right=thin_side)
border_action = Border(left=Side(border_style="medium", color="6366F1"),
                       right=Side(border_style="medium", color="6366F1"),
                       top=Side(border_style="medium", color="6366F1"),
                       bottom=Side(border_style="medium", color="6366F1"))

align_center = Alignment(horizontal="center", vertical="center")
align_left = Alignment(horizontal="left", vertical="center")
align_right = Alignment(horizontal="right", vertical="center")


# ==============================================================================
# SHEET 1: KLASEMEN & REKAP POIN
# ==============================================================================
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

# KPI Cards
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
    
    # AUTOMATIC LINK TO SHEET 2 QUICK ACTION TRANSFER TABLE:
    # Transfer Keluar = SUMIF on Sheet 2 Column C (Pengirim Absen)
    ws1.cell(curr_row, 17, f"=SUMIF('Quick Transfer & Log Mutasi'!$C$11:$C$100, B{curr_row}, 'Quick Transfer & Log Mutasi'!$G$11:$G$100)").alignment = align_center
    
    # Transfer Masuk = SUMIF on Sheet 2 Column E (Penerima Absen)
    ws1.cell(curr_row, 18, f"=SUMIF('Quick Transfer & Log Mutasi'!$E$11:$E$100, B{curr_row}, 'Quick Transfer & Log Mutasi'!$G$11:$G$100)").alignment = align_center
    
    # Total Poin Akhir
    ws1.cell(curr_row, 19, f"=P{curr_row}-Q{curr_row}+R{curr_row}").alignment = align_center
    ws1.cell(curr_row, 19).font = font_bold
    
    # Surplus (>150)
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


# ==============================================================================
# SHEET 2: QUICK ACTION TRANSFER POIN LANGSUNG DI EXCEL
# ==============================================================================
ws2.merge_cells("A1:I1")
ws2["A1"] = "⚡ QUICK ACTION: FORM & TABEL MUTASI TRANSFER POIN"
ws2["A1"].font = font_title
ws2["A1"].alignment = align_left
ws2.row_dimensions[1].height = 24

ws2.merge_cells("A2:I2")
ws2["A2"] = "Petunjuk: Cukup pilih No. Absen Pengirim, No. Absen Penerima, dan isi Poin. Nama otomatis muncul dan Sheet Utama otomatis ter-update seketika!"
ws2["A2"].font = font_subtitle
ws2.row_dimensions[2].height = 18

# Quick Action Instructions Box (Rows 4-6)
ws2.merge_cells("B4:H4")
ws2["B4"] = "CARA MENGGUNAKAN FITUR TRANSFER POIN LANGSUNG DI EXCEL INI:"
ws2["B4"].font = font_action_title
ws2["B4"].fill = fill_action
ws2["B4"].alignment = align_left

ws2.merge_cells("B5:H5")
ws2["B5"] = "1. Pada tabel di bawah (Kolom C & E), klik dropdown panah kecil untuk memilih No. Absen Pengirim & Penerima (1 s/d 40)."
ws2["B5"].font = font_action_desc
ws2["B5"].fill = fill_action
ws2["B5"].alignment = align_left

ws2.merge_cells("B6:H6")
ws2["B6"] = "2. Nama Mahasiswa (Kolom D & F) akan MUNCUL OTOMATIS via rumus VLOOKUP. Lalu ketik Jumlah Poin di Kolom G."
ws2["B6"].font = font_action_desc
ws2["B6"].fill = fill_action
ws2["B6"].alignment = align_left

ws2.merge_cells("B7:H7")
ws2["B7"] = "3. Selesai! Buka Sheet 'Klasemen & Rekap Poin', Anda akan melihat poin kedua mahasiswa langsung berubah otomatis!"
ws2["B7"].font = font_action_desc
ws2["B7"].fill = fill_action
ws2["B7"].alignment = align_left

for r in range(4, 8):
    for c in range(2, 9):
        ws2.cell(r, c).border = border_cell

ws2.row_dimensions[4].height = 18
ws2.row_dimensions[5].height = 16
ws2.row_dimensions[6].height = 16
ws2.row_dimensions[7].height = 16
ws2.row_dimensions[8].height = 8

# Headers for Transfer Table (Row 10)
headers2 = [
    ("No", align_center, 6),
    ("Tanggal / Waktu", align_center, 18),
    ("Absen Pengirim", align_center, 15),
    ("Nama Mahasiswa Pengirim (Otomatis)", align_left, 36),
    ("Absen Penerima", align_center, 15),
    ("Nama Mahasiswa Penerima (Otomatis)", align_left, 36),
    ("Poin Ditransfer", align_center, 16),
    ("Status Formula", align_center, 18),
    ("Keterangan / Catatan", align_left, 32)
]

header_row2 = 10
ws2.row_dimensions[header_row2].height = 26

for c_idx, (h_name, h_align, h_w) in enumerate(headers2, 1):
    c = ws2.cell(header_row2, c_idx, h_name)
    c.font = font_header
    c.fill = fill_header_transfer
    c.alignment = align_center
    c.border = border_cell
    ws2.column_dimensions[get_column_letter(c_idx)].width = h_w

# Add Data Validation (Dropdown 1 to 40) for Absen Pengirim (Col C) and Absen Penerima (Col E)
dv_absen = DataValidation(type="list", formula1='"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40"', allow_blank=True)
dv_absen.error = 'Pilih nomor absen 1 s/d 40 dari dropdown!'
dv_absen.errorTitle = 'Nomor Absen Tidak Valid'
dv_absen.prompt = 'Pilih No. Absen dari daftar dropdown'
dv_absen.promptTitle = 'Pilih Nomor Absen'

ws2.add_data_validation(dv_absen)
dv_absen.add(f"C11:C60")
dv_absen.add(f"E11:E60")

# Pre-populate row 11 with sample live transaction
ws2.cell(11, 1, 1).alignment = align_center
ws2.cell(11, 2, "03/11/2026 15:30").alignment = align_center
ws2.cell(11, 3, 39).alignment = align_center  # Tirta
ws2.cell(11, 4, "=IFERROR(VLOOKUP(C11, 'Klasemen & Rekap Poin'!$B$12:$D$51, 3, FALSE), \"\")").alignment = align_left  # Auto Name
ws2.cell(11, 5, 1).alignment = align_center   # Rifki Wahyu
ws2.cell(11, 6, "=IFERROR(VLOOKUP(E11, 'Klasemen & Rekap Poin'!$B$12:$D$51, 3, FALSE), \"\")").alignment = align_left  # Auto Name
ws2.cell(11, 7, 5).alignment = align_center   # 5 Poin
ws2.cell(11, 8, '=IF(G11="","", "✅ Sukses Terhubung")').alignment = align_center
ws2.cell(11, 9, "Bantuan Capaian P8").alignment = align_left

for c in range(1, 10):
    ws2.cell(11, c).font = font_bold
    ws2.cell(11, c).border = border_cell
    ws2.cell(11, c).fill = fill_green_pass

# Create empty, ready-to-use template rows 12 to 50
for r_idx in range(12, 51):
    ws2.row_dimensions[r_idx].height = 20
    ws2.cell(r_idx, 1, r_idx - 10).alignment = align_center
    ws2.cell(r_idx, 2, "").alignment = align_center
    ws2.cell(r_idx, 3, "").alignment = align_center
    ws2.cell(r_idx, 4, f"=IFERROR(VLOOKUP(C{r_idx}, 'Klasemen & Rekap Poin'!$B$12:$D$51, 3, FALSE), \"\")").alignment = align_left
    ws2.cell(r_idx, 5, "").alignment = align_center
    ws2.cell(r_idx, 6, f"=IFERROR(VLOOKUP(E{r_idx}, 'Klasemen & Rekap Poin'!$B$12:$D$51, 3, FALSE), \"\")").alignment = align_left
    ws2.cell(r_idx, 7, "").alignment = align_center
    ws2.cell(r_idx, 8, f'=IF(OR(C{r_idx}="", G{r_idx}=""), "", "✅ Sukses Terhubung")').alignment = align_center
    ws2.cell(r_idx, 9, "").alignment = align_left

    for c in range(1, 10):
        cell = ws2.cell(r_idx, c)
        cell.font = font_data
        cell.border = border_cell
        if r_idx % 2 == 1:
            cell.fill = fill_zebra

excel_path = "d:/laragon/www/klinik37/module/Rekap_Poin_Mobile_Programming_2_Kelas_195A05.xlsx"
wb.save(excel_path)
print(f"File Excel dengan fitur QUICK ACTION TRANSFER LANGSUNG DI EXCEL berhasil disimpan di: {excel_path}")
