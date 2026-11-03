import openpyxl
from openpyxl.styles import Font, PatternFill, Alignment, Border, Side
from openpyxl.utils import get_column_letter

wb = openpyxl.Workbook()
ws = wb.active
ws.title = "Rekapitulasi Poin 19.5A.05"
ws.views.sheetView[0].showGridLines = True

# Academic Professional Palette
NAVY_HEADER = "1E293B"       # Slate Navy
NAVY_ACCENT = "0F172A"
MEETING_HEADER = "334155"    # Slate
FUTURE_HEADER = "475569"     # Slate medium
TRANSFER_HEADER = "4338CA"   # Indigo for transfer features
RESULT_HEADER = "1D4ED8"     # Royal blue for final results

GREEN_BG = "DCFCE7"          # Soft Emerald for >= 150
GREEN_TXT = "166534"
GOLD_BG = "FEF3C7"           # Gold tint for >= 200 (Double dispensation)
GOLD_TXT = "92400E"
ZEBRA_BG = "F8FAFC"
BORDER_COLOR = "CBD5E1"
WHITE = "FFFFFF"
CARD_BG = "F1F5F9"

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

# Borders
thin_side = Side(border_style="thin", color=BORDER_COLOR)
border_cell = Border(left=thin_side, right=thin_side, top=thin_side, bottom=thin_side)
double_bottom = Side(border_style="double", color="0F172A")
border_total = Border(top=thin_side, bottom=double_bottom, left=thin_side, right=thin_side)

# Alignments
align_center = Alignment(horizontal="center", vertical="center")
align_left = Alignment(horizontal="left", vertical="center")
align_right = Alignment(horizontal="right", vertical="center")

# Title Block
ws.merge_cells("A1:V1")
ws["A1"] = "REKAPITULASI POIN KEAKTIFAN & KLASEMEN AKADEMIK MAHASISWA"
ws["A1"].font = font_title
ws["A1"].alignment = Alignment(horizontal="left", vertical="center")
ws.row_dimensions[1].height = 24

ws.merge_cells("A2:V2")
ws["A2"] = "Mata Kuliah: Mobile Programming II (19.5A.05) | Dosen Pengampu: Cep Adiwiharja | Program Studi Sistem Informasi - Universitas Bina Sarana Informatika"
ws["A2"].font = font_subtitle
ws.row_dimensions[2].height = 18

# Ketentuan Akademik & Aturan Fasilitas (Rows 4-6)
ws.merge_cells("B4:V4")
ws["B4"] = "📌 KETENTUAN POIN & TINGKAT FASILITAS AKADEMIK:"
ws["B4"].font = font_rule_title
ws["B4"].alignment = Alignment(horizontal="left", vertical="center")

ws.merge_cells("B5:V5")
ws["B5"] = "• 150 - 199 Poin : Nilai Akhir Mutlak A + Bebas Projek/Presentasi (P14-P15) + Hak Dispensasi Presensi 1 Pertemuan (1x)"
ws["B5"].font = font_rule_desc
ws["B5"].alignment = Alignment(horizontal="left", vertical="center")

ws.merge_cells("B6:V6")
ws["B6"] = "• >= 200 Poin    : Nilai Akhir Mutlak A + Bebas Projek/Presentasi (P14-P15) + Hak Dispensasi Presensi 2 Pertemuan (2x) | Surplus >150 Poin Berhak Ditransfer"
ws["B6"].font = font_rule_desc
ws["B6"].alignment = Alignment(horizontal="left", vertical="center")

ws.row_dimensions[4].height = 16
ws.row_dimensions[5].height = 16
ws.row_dimensions[6].height = 16

# KPI Summary Cards (Rows 8-9)
# Card 1: Total Mahasiswa
ws.merge_cells("B8:C8")
ws.merge_cells("B9:C9")
ws["B8"] = "TOTAL MAHASISWA"
ws["B8"].font = font_kpi_label
ws["B8"].alignment = align_center
ws["B8"].fill = fill_card
ws["B9"] = 40
ws["B9"].font = font_kpi_num
ws["B9"].alignment = align_center
ws["B9"].fill = fill_card

# Card 2: Lolos Ambang Batas 150+
ws.merge_cells("E8:H8")
ws.merge_cells("E9:H9")
ws["E8"] = "MEMENUHI SYARAT NILAI A & BEBAS PROJEK"
ws["E8"].font = font_kpi_label
ws["E8"].alignment = align_center
ws["E8"].fill = fill_green_pass
ws["E9"] = '=COUNTIF(S12:S51, ">=150") & " Mahasiswa"'
ws["E9"].font = font_kpi_green
ws["E9"].alignment = align_center
ws["E9"].fill = fill_green_pass

# Card 3: Total Poin Surplus yang Dapat Ditransfer
ws.merge_cells("J8:M8")
ws.merge_cells("J9:M9")
ws["J8"] = "TOTAL POIN SURPLUS KELAS (DAPAT DITRANSFER)"
ws["J8"].font = font_kpi_label
ws["J8"].alignment = align_center
ws["J8"].fill = fill_card
ws["J9"] = '=SUM(T12:T51) & " Poin Tersedia"'
ws["J9"].font = font_kpi_num
ws["J9"].alignment = align_center
ws["J9"].fill = fill_card

# Card 4: Rata-rata Poin
ws.merge_cells("O8:R8")
ws.merge_cells("O9:R9")
ws["O8"] = "RATA-RATA POIN KELAS SAAT INI"
ws["O8"].font = font_kpi_label
ws["O8"].alignment = align_center
ws["O8"].fill = fill_card
ws["O9"] = '=ROUND(AVERAGE(S12:S51), 1) & " Poin"'
ws["O9"].font = font_kpi_num
ws["O9"].alignment = align_center
ws["O9"].fill = fill_card

for r in range(8, 10):
    for c in range(1, 23):
        cell = ws.cell(r, c)
        if cell.value:
            cell.border = border_cell

ws.row_dimensions[7].height = 8
ws.row_dimensions[8].height = 18
ws.row_dimensions[9].height = 24
ws.row_dimensions[10].height = 10

# Table Headers (Row 11)
headers = [
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
ws.row_dimensions[header_row].height = 28

for col_idx, (h_title, h_align, h_width, h_fill) in enumerate(headers, 1):
    cell = ws.cell(header_row, col_idx, h_title)
    cell.font = font_header
    cell.fill = h_fill
    cell.alignment = align_center
    cell.border = border_cell
    col_letter = get_column_letter(col_idx)
    ws.column_dimensions[col_letter].width = h_width

# Complete 40 Students Roster
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
    
    ws.row_dimensions[curr_row].height = 20
    
    # Static Data
    ws.cell(curr_row, 1, rank_idx).alignment = align_center
    ws.cell(curr_row, 2, absen).alignment = align_center
    ws.cell(curr_row, 3, nim if nim != "-" else "").alignment = align_center
    ws.cell(curr_row, 4, nama).alignment = align_left
    ws.cell(curr_row, 5, jk).alignment = align_center
    
    # Meetings P2 to P8
    ws.cell(curr_row, 6, p2).alignment = align_center
    ws.cell(curr_row, 7, p3).alignment = align_center
    ws.cell(curr_row, 8, p4).alignment = align_center
    ws.cell(curr_row, 9, p5).alignment = align_center
    ws.cell(curr_row, 10, p7).alignment = align_center
    ws.cell(curr_row, 11, p8).alignment = align_center
    
    # Future Meetings P9 to P12 (Empty, ready for immediate typing)
    ws.cell(curr_row, 12, None).alignment = align_center
    ws.cell(curr_row, 13, None).alignment = align_center
    ws.cell(curr_row, 14, None).alignment = align_center
    ws.cell(curr_row, 15, None).alignment = align_center
    
    # Col 16 (P): Total Akumulasi
    c_tot_ak = ws.cell(curr_row, 16, f"=SUM(F{curr_row}:O{curr_row})")
    c_tot_ak.alignment = align_center
    c_tot_ak.font = font_bold
    
    # Col 17 (Q): Transfer Keluar (-)
    c_tr_out = ws.cell(curr_row, 17, 0)
    c_tr_out.alignment = align_center
    
    # Col 18 (R): Transfer Masuk (+)
    c_tr_in = ws.cell(curr_row, 18, 0)
    c_tr_in.alignment = align_center
    
    # Col 19 (S): Total Poin Akhir = Total Akumulasi - Transfer Keluar + Transfer Masuk
    c_tot_end = ws.cell(curr_row, 19, f"=P{curr_row}-Q{curr_row}+R{curr_row}")
    c_tot_end.alignment = align_center
    c_tot_end.font = font_bold
    
    # Col 20 (T): Poin Surplus yang Bisa Ditransfer = MAX(0, Total Akhir - 150)
    c_surplus = ws.cell(curr_row, 20, f'=IF(S{curr_row}>150, S{curr_row}-150, 0)')
    c_surplus.alignment = align_center
    
    # Col 21 (U): Status Kelulusan & Dispensasi Presensi (1X jika >=150, 2X jika >=200)
    c_stat = ws.cell(curr_row, 21, f'=IF(S{curr_row}>=200, "MEMENUHI SYARAT (NILAI A + DISPENSASI 2X)", IF(S{curr_row}>=150, "MEMENUHI SYARAT (NILAI A + DISPENSASI 1X)", "BELUM MEMENUHI SYARAT"))')
    c_stat.alignment = align_center
    
    # Col 22 (V): Keterangan Capaian
    c_ket = ws.cell(curr_row, 22, f'=IF(S{curr_row}>=200, "Bebas Projek/Presentasi | Dispensasi 2x | Surplus: " & T{curr_row} & " Poin", IF(S{curr_row}>=150, "Bebas Projek/Presentasi | Dispensasi 1x | Surplus: " & T{curr_row} & " Poin", "Kurang " & (150-S{curr_row}) & " poin lagi"))')
    c_ket.alignment = align_left
    
    # Universal styling (Equal for ALL students)
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
        cell = ws.cell(curr_row, col)
        cell.border = border_cell
        cell.font = row_font
        if row_fill:
            cell.fill = row_fill

# Bottom Summary Row (Row 52)
sum_row = start_row + len(sorted_roster)
ws.row_dimensions[sum_row].height = 24
ws.merge_cells(f"A{sum_row}:E{sum_row}")
ws[f"A{sum_row}"] = "RATA-RATA KELAS (AVERAGE)"
ws[f"A{sum_row}"].font = font_bold
ws[f"A{sum_row}"].alignment = Alignment(horizontal="right", vertical="center")

for col_idx in range(6, 21):
    col_letter = get_column_letter(col_idx)
    cell = ws.cell(sum_row, col_idx, f"=ROUND(AVERAGE({col_letter}12:{col_letter}51), 1)")
    cell.font = font_bold
    cell.alignment = align_center
    cell.fill = fill_card

ws.cell(sum_row, 21, "").fill = fill_card
ws.cell(sum_row, 22, "").fill = fill_card

for col in range(1, 23):
    ws.cell(sum_row, col).border = border_total

# Freeze Panes at E12
ws.freeze_panes = "E12"

excel_path = "d:/laragon/www/klinik37/module/Rekap_Poin_Mobile_Programming_2_Kelas_195A05.xlsx"
wb.save(excel_path)
print(f"File Excel resmi 200 poin berhasil diperbarui di: {excel_path}")
