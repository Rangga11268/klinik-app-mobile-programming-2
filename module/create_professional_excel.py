import openpyxl
from openpyxl.styles import Font, PatternFill, Alignment, Border, Side
from openpyxl.utils import get_column_letter

wb = openpyxl.Workbook()
ws = wb.active
ws.title = "Rekap Poin Kelas 19.5A.05"
ws.views.sheetView[0].showGridLines = True

# Professional Palette
NAVY = "1B365D"
LIGHT_NAVY = "2B4C7E"
GOLD_ACCENT = "B45309"
LIGHT_GOLD = "FEF3C7"
EMERALD = "15803D"
LIGHT_GREEN = "DCFCE7"
DARK_GREEN_TXT = "166534"
ZEBRA = "F8FAFC"
BORDER_GRAY = "CBD5E1"
WHITE = "FFFFFF"
DARELL_BLUE = "EFF6FF"
DARELL_TXT = "1E40AF"

# Fonts
font_title = Font(name="Segoe UI", size=16, bold=True, color=NAVY)
font_subtitle = Font(name="Segoe UI", size=10, italic=True, color="475569")
font_kpi_label = Font(name="Segoe UI", size=9, bold=True, color="475569")
font_kpi_num = Font(name="Segoe UI", size=16, bold=True, color=NAVY)
font_header = Font(name="Segoe UI", size=10, bold=True, color=WHITE)
font_header_meeting = Font(name="Segoe UI", size=10, bold=True, color=WHITE)
font_header_future = Font(name="Segoe UI", size=9, bold=True, color="E2E8F0")
font_data = Font(name="Segoe UI", size=10, color="0F172A")
font_bold = Font(name="Segoe UI", size=10, bold=True, color="0F172A")
font_darell = Font(name="Segoe UI", size=10, bold=True, color=DARELL_TXT)
font_pass = Font(name="Segoe UI", size=10, bold=True, color=DARK_GREEN_TXT)

# Fills
fill_header_main = PatternFill(start_color=NAVY, end_color=NAVY, fill_type="solid")
fill_header_meeting = PatternFill(start_color="334155", end_color="334155", fill_type="solid")
fill_header_future = PatternFill(start_color="64748B", end_color="64748B", fill_type="solid")
fill_header_result = PatternFill(start_color="1E3A8A", end_color="1E3A8A", fill_type="solid")

fill_zebra = PatternFill(start_color=ZEBRA, end_color=ZEBRA, fill_type="solid")
fill_green_pass = PatternFill(start_color=LIGHT_GREEN, end_color=LIGHT_GREEN, fill_type="solid")
fill_darell = PatternFill(start_color=DARELL_BLUE, end_color=DARELL_BLUE, fill_type="solid")
fill_kpi = PatternFill(start_color="F1F5F9", end_color="F1F5F9", fill_type="solid")

# Borders
thin_side = Side(border_style="thin", color=BORDER_GRAY)
border_cell = Border(left=thin_side, right=thin_side, top=thin_side, bottom=thin_side)
double_bottom = Side(border_style="double", color=NAVY)
border_total = Border(top=thin_side, bottom=double_bottom, left=thin_side, right=thin_side)

# Alignments
align_center = Alignment(horizontal="center", vertical="center")
align_left = Alignment(horizontal="left", vertical="center")
align_right = Alignment(horizontal="right", vertical="center")

# Title Block
ws.merge_cells("A1:R1")
ws["A1"] = "SISTEM REKAPITULASI POIN & KLASEMEN AKUMULASI MAHASISWA"
ws["A1"].font = font_title
ws["A1"].alignment = Alignment(horizontal="left", vertical="center")
ws.row_dimensions[1].height = 28

ws.merge_cells("A2:R2")
ws["A2"] = "Mata Kuliah: Mobile Programming II (19.5A.05) | Dosen Pengampu: Cep Adiwiharja | Kampus: Universitas Bina Sarana Informatika (UBSI)"
ws["A2"].font = font_subtitle
ws.row_dimensions[2].height = 18

# KPI Cards (Row 4 to 6)
# Card 1: Total Mahasiswa
ws.merge_cells("B4:C4")
ws.merge_cells("B5:C5")
ws["B4"] = "TOTAL MAHASISWA"
ws["B4"].font = font_kpi_label
ws["B4"].alignment = align_center
ws["B4"].fill = fill_kpi
ws["B5"] = 40
ws["B5"].font = font_kpi_num
ws["B5"].alignment = align_center
ws["B5"].fill = fill_kpi

# Card 2: Lolos Auto-A (Formula Dinamis)
ws.merge_cells("E4:H4")
ws.merge_cells("E5:H5")
ws["E4"] = "LOLOS AMBANG BATAS AUTO-A (TOTAL >= 150 POIN)"
ws["E4"].font = font_kpi_label
ws["E4"].alignment = align_center
ws["E4"].fill = fill_green_pass
ws["E5"] = '=COUNTIF(P11:P50, ">=150") & " Mahasiswa (Bebas Projek & Presentasi)"'
ws["E5"].font = Font(name="Segoe UI", size=13, bold=True, color=DARK_GREEN_TXT)
ws["E5"].alignment = align_center
ws["E5"].fill = fill_green_pass

# Card 3: Highlight Khusus Darell Rangga Putra Rachman (Absen 37)
ws.merge_cells("J4:Q4")
ws.merge_cells("J5:Q5")
ws["J4"] = "STATUS DARELL RANGGA PUTRA RACHMAN (NO. ABSEN: 37 / NIM: 19241009)"
ws["J4"].font = font_kpi_label
ws["J4"].alignment = align_center
ws["J4"].fill = fill_darell
ws["J5"] = '155 POIN - RESMI TEMBUS AUTO-A (BEBAS TUGAS AKHIR & PRESENTASI)'
ws["J5"].font = Font(name="Segoe UI", size=12, bold=True, color=DARELL_TXT)
ws["J5"].alignment = align_center
ws["J5"].fill = fill_darell

for r in range(4, 6):
    for c in range(1, 19):
        cell = ws.cell(r, c)
        if cell.value:
            cell.border = border_cell

ws.row_dimensions[4].height = 18
ws.row_dimensions[5].height = 26
ws.row_dimensions[6].height = 12

# Table Headers (Row 10)
# Complete columns with generous widths so NO text is clipped
headers = [
    ("Rank", align_center, 8, fill_header_main),
    ("Absen", align_center, 9, fill_header_main),
    ("NIM", align_center, 14, fill_header_main),
    ("Nama Lengkap Mahasiswa", align_left, 45, fill_header_main),
    ("JK", align_center, 6, fill_header_main),
    ("P2", align_center, 8, fill_header_meeting),
    ("P3", align_center, 8, fill_header_meeting),
    ("P4", align_center, 8, fill_header_meeting),
    ("P5", align_center, 8, fill_header_meeting),
    ("P7", align_center, 8, fill_header_meeting),
    ("P8", align_center, 8, fill_header_meeting),
    ("P9", align_center, 8, fill_header_future),
    ("P10", align_center, 8, fill_header_future),
    ("P11", align_center, 8, fill_header_future),
    ("P12", align_center, 8, fill_header_future),
    ("Total Poin", align_center, 14, fill_header_result),
    ("Status Kelulusan", align_center, 34, fill_header_result),
    ("Keterangan Capaian", align_left, 44, fill_header_result)
]

header_row = 10
ws.row_dimensions[header_row].height = 28

for col_idx, (h_title, h_align, h_width, h_fill) in enumerate(headers, 1):
    cell = ws.cell(header_row, col_idx, h_title)
    cell.font = font_header
    cell.fill = h_fill
    cell.alignment = align_center
    cell.border = border_cell
    col_letter = get_column_letter(col_idx)
    ws.column_dimensions[col_letter].width = h_width

# Complete Roster Data (40 Mahasiswa)
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

start_row = 11
for rank_idx, s in enumerate(sorted_roster, 1):
    curr_row = start_row + rank_idx - 1
    absen = s[0]
    nim = s[1]
    nama = s[2]
    jk = s[3]
    p2, p3, p4, p5, p7, p8 = s[4], s[5], s[6], s[7], s[8], s[9]
    total_val = p2 + p3 + p4 + p5 + p7 + p8
    
    is_darell = (absen == 37)
    is_auto_a = (total_val >= 150)
    
    ws.row_dimensions[curr_row].height = 21
    
    # Cells
    c_no = ws.cell(curr_row, 1, rank_idx)
    c_absen = ws.cell(curr_row, 2, absen)
    c_nim = ws.cell(curr_row, 3, nim if nim != "-" else "")
    c_nama = ws.cell(curr_row, 4, nama)
    c_jk = ws.cell(curr_row, 5, jk)
    
    # Past Meetings (P2 to P8)
    ws.cell(curr_row, 6, p2).alignment = align_center
    ws.cell(curr_row, 7, p3).alignment = align_center
    ws.cell(curr_row, 8, p4).alignment = align_center
    ws.cell(curr_row, 9, p5).alignment = align_center
    ws.cell(curr_row, 10, p7).alignment = align_center
    ws.cell(curr_row, 11, p8).alignment = align_center
    
    # Future Meetings (P9 to P12) - Blank/0 so user can directly type numbers here anytime!
    ws.cell(curr_row, 12, None).alignment = align_center
    ws.cell(curr_row, 13, None).alignment = align_center
    ws.cell(curr_row, 14, None).alignment = align_center
    ws.cell(curr_row, 15, None).alignment = align_center
    
    # DYNAMIC FORMULA FOR TOTAL POIN: SUM from F to O (P2 to P12)!
    # Whenever the user types a number in P9, P10, P11, or P12, TOTAL AUTOMATICALLY UPDATES!
    c_tot = ws.cell(curr_row, 16, f"=SUM(F{curr_row}:O{curr_row})")
    c_tot.alignment = align_center
    c_tot.font = font_bold
    
    # DYNAMIC FORMULA FOR STATUS:
    c_stat = ws.cell(curr_row, 17, f'=IF(P{curr_row}>=150, "✅ LULUS AUTO-A (BEBAS PROJEK)", "⏳ BELUM MEMENUHI")')
    c_stat.alignment = align_center
    
    # DYNAMIC FORMULA FOR KETERANGAN:
    c_ket = ws.cell(curr_row, 18, f'=IF(B{curr_row}=37, "👑 TARGET 150+ TERCAPAI (NILAI AKHIR A)", IF(P{curr_row}>=150, "✅ Lolos Ambang Batas 150 Poin", "Kurang " & (150-P{curr_row}) & " poin lagi"))')
    c_ket.alignment = align_left
    
    # Alignments
    c_no.alignment = align_center
    c_absen.alignment = align_center
    c_nim.alignment = align_center
    c_nama.alignment = align_left
    c_jk.alignment = align_center
    
    # Styling per row
    row_fill = None
    if is_darell:
        row_fill = fill_darell
        row_font = font_darell
    elif is_auto_a:
        row_fill = fill_green_pass
        row_font = font_bold
    elif rank_idx % 2 == 0:
        row_fill = fill_zebra
        row_font = font_data
    else:
        row_font = font_data
        
    for col in range(1, 19):
        cell = ws.cell(curr_row, col)
        cell.border = border_cell
        cell.font = row_font
        if row_fill:
            cell.fill = row_fill

# Bottom Summary Row (Row 51)
sum_row = start_row + len(sorted_roster)
ws.row_dimensions[sum_row].height = 24
ws.merge_cells(f"A{sum_row}:E{sum_row}")
ws[f"A{sum_row}"] = "RATA-RATA KELAS (AVERAGE)"
ws[f"A{sum_row}"].font = font_bold
ws[f"A{sum_row}"].alignment = Alignment(horizontal="right", vertical="center")

for col_idx in range(6, 17):
    col_letter = get_column_letter(col_idx)
    cell = ws.cell(sum_row, col_idx, f"=ROUND(AVERAGE({col_letter}11:{col_letter}50), 1)")
    cell.font = font_bold
    cell.alignment = align_center
    cell.fill = fill_kpi

ws.cell(sum_row, 17, "").fill = fill_kpi
ws.cell(sum_row, 18, "").fill = fill_kpi

for col in range(1, 19):
    ws.cell(sum_row, col).border = border_total

# Freeze panes at cell E11 (Rank, Absen, NIM, Nama lock in place while scrolling)
ws.freeze_panes = "E11"

excel_path = "d:/laragon/www/klinik37/module/Rekap_Poin_Mobile_Programming_2_Kelas_195A05.xlsx"
wb.save(excel_path)
print(f"File Excel otomatis berhasil diperbarui di: {excel_path}")
