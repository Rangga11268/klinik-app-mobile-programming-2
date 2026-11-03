import openpyxl
from openpyxl.styles import Font, PatternFill, Alignment, Border, Side
from openpyxl.utils import get_column_letter

wb = openpyxl.Workbook()
ws = wb.active
ws.title = "Rekap Poin Kelas 19.5A.05"
ws.views.sheetView[0].showGridLines = True

# Colors
NAVY = "1B365D"
LIGHT_NAVY = "2E5B88"
GOLD = "D4AF37"
LIGHT_GOLD = "FFF9E6"
EMERALD = "1E7E34"
LIGHT_GREEN = "E8F5E9"
DARK_GREEN_TXT = "155724"
ZEBRA = "F8F9FA"
BORDER_GRAY = "D1D5DB"
WHITE = "FFFFFF"

# Fonts
font_title = Font(name="Segoe UI", size=16, bold=True, color=NAVY)
font_subtitle = Font(name="Segoe UI", size=10, italic=True, color="4B5563")
font_kpi_num = Font(name="Segoe UI", size=18, bold=True, color=NAVY)
font_kpi_label = Font(name="Segoe UI", size=9, bold=True, color="4B5563")
font_header = Font(name="Segoe UI", size=10, bold=True, color=WHITE)
font_darell_header = Font(name="Segoe UI", size=10, bold=True, color=WHITE)
font_data = Font(name="Segoe UI", size=10)
font_bold = Font(name="Segoe UI", size=10, bold=True)
font_darell = Font(name="Segoe UI", size=10, bold=True, color="0D47A1")

# Fills
fill_header = PatternFill(start_color=NAVY, end_color=NAVY, fill_type="solid")
fill_header_accent = PatternFill(start_color=LIGHT_NAVY, end_color=LIGHT_NAVY, fill_type="solid")
fill_zebra = PatternFill(start_color=ZEBRA, end_color=ZEBRA, fill_type="solid")
fill_gold_kpi = PatternFill(start_color="FFF3CD", end_color="FFF3CD", fill_type="solid")
fill_green_pass = PatternFill(start_color=LIGHT_GREEN, end_color=LIGHT_GREEN, fill_type="solid")
fill_darell = PatternFill(start_color="D6E4FF", end_color="D6E4FF", fill_type="solid")
fill_kpi = PatternFill(start_color="F1F5F9", end_color="F1F5F9", fill_type="solid")

# Borders
thin_side = Side(border_style="thin", color=BORDER_GRAY)
border_cell = Border(left=thin_side, right=thin_side, top=thin_side, bottom=thin_side)
border_kpi = Border(left=thin_side, right=thin_side, top=thin_side, bottom=thin_side)
double_bottom = Side(border_style="double", color=NAVY)
border_total = Border(top=thin_side, bottom=double_bottom)

# Alignments
align_center = Alignment(horizontal="center", vertical="center")
align_left = Alignment(horizontal="left", vertical="center")
align_right = Alignment(horizontal="right", vertical="center")

# Title Block
ws.merge_cells("A1:N1")
ws["A1"] = "DAFTAR NILAI AKUMULASI POIN & KLASEMEN MAHASISWA"
ws["A1"].font = font_title
ws["A1"].alignment = Alignment(horizontal="left", vertical="center")
ws.row_dimensions[1].height = 28

ws.merge_cells("A2:N2")
ws["A2"] = "Mata Kuliah: Mobile Programming II (19.5A.05) | Dosen: Cep Adiwiharja | Kampus: Universitas Bina Sarana Informatika (UBSI) | Update: P8 (3 Nov 2026)"
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

# Card 2: Lolos Auto-A (>=150)
ws.merge_cells("E4:G4")
ws.merge_cells("E5:G5")
ws["E4"] = "LOLOS AMBANG BATAS AUTO-A (>=150 POIN)"
ws["E4"].font = font_kpi_label
ws["E4"].alignment = align_center
ws["E4"].fill = fill_green_pass
ws["E5"] = '=COUNTIF(L11:L50, ">=150") & " Mahasiswa (Bebas Projek)"'
ws["E5"].font = Font(name="Segoe UI", size=13, bold=True, color=DARK_GREEN_TXT)
ws["E5"].alignment = align_center
ws["E5"].fill = fill_green_pass

# Card 3: Status Darell Rangga Putra Rachman (Absen 37)
ws.merge_cells("I4:M4")
ws.merge_cells("I5:M5")
ws["I4"] = "STATUS DARELL RANGGA PUTRA RACHMAN (ABSEN 37 / NIM: 19241009)"
ws["I4"].font = font_kpi_label
ws["I4"].alignment = align_center
ws["I4"].fill = fill_darell
ws["I5"] = '155 POIN - AUTO-A MUTLAK (BEBAS TUGAS AKHIR & PRESENTASI)'
ws["I5"].font = Font(name="Segoe UI", size=12, bold=True, color="0D47A1")
ws["I5"].alignment = align_center
ws["I5"].fill = fill_darell

for r in range(4, 6):
    for c in range(1, 15):
        cell = ws.cell(r, c)
        if cell.value:
            cell.border = border_kpi

ws.row_dimensions[4].height = 18
ws.row_dimensions[5].height = 26
ws.row_dimensions[6].height = 10

# Table Headers (Row 10)
headers = [
    ("No", align_center, 6),
    ("Absen", align_center, 8),
    ("NIM", align_center, 12),
    ("Nama Lengkap Mahasiswa", align_left, 38),
    ("JK", align_center, 6),
    ("P2", align_center, 8),
    ("P3", align_center, 8),
    ("P4", align_center, 8),
    ("P5", align_center, 8),
    ("P7", align_center, 8),
    ("P8", align_center, 8),
    ("Total Poin", align_center, 12),
    ("Status Kelulusan", align_center, 28),
    ("Keterangan Capaian", align_left, 36)
]

header_row = 10
ws.row_dimensions[header_row].height = 26

for col_idx, (h_title, h_align, h_width) in enumerate(headers, 1):
    cell = ws.cell(header_row, col_idx, h_title)
    cell.font = font_header
    cell.fill = fill_header if col_idx < 12 else fill_header_accent
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

# Sort by calculated total descending to get rank
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
    
    ws.row_dimensions[curr_row].height = 20
    
    # Cells
    c_no = ws.cell(curr_row, 1, rank_idx)
    c_absen = ws.cell(curr_row, 2, absen)
    c_nim = ws.cell(curr_row, 3, nim if nim != "-" else "")
    c_nama = ws.cell(curr_row, 4, nama)
    c_jk = ws.cell(curr_row, 5, jk)
    c_p2 = ws.cell(curr_row, 6, p2)
    c_p3 = ws.cell(curr_row, 7, p3)
    c_p4 = ws.cell(curr_row, 8, p4)
    c_p5 = ws.cell(curr_row, 9, p5)
    c_p7 = ws.cell(curr_row, 10, p7)
    c_p8 = ws.cell(curr_row, 11, p8)
    
    # Formula for Total
    c_tot = ws.cell(curr_row, 12, f"=SUM(F{curr_row}:K{curr_row})")
    
    # Formula for Status
    c_stat = ws.cell(curr_row, 13, f'=IF(L{curr_row}>=150, "LULUS AUTO-A (BEBAS PROJEK)", "BELUM MEMENUHI")')
    
    # Keterangan
    if is_darell:
        ket_text = "👑 TARGET 150+ TERCAPAI (NILAI AKHIR A)"
    elif is_auto_a:
        ket_text = "✅ Lolos Ambang Batas 150 Poin"
    else:
        ket_text = f"Kurang {150 - total_val} poin lagi"
    c_ket = ws.cell(curr_row, 14, ket_text)
    
    # Alignments
    c_no.alignment = align_center
    c_absen.alignment = align_center
    c_nim.alignment = align_center
    c_nama.alignment = align_left
    c_jk.alignment = align_center
    c_p2.alignment = align_center
    c_p3.alignment = align_center
    c_p4.alignment = align_center
    c_p5.alignment = align_center
    c_p7.alignment = align_center
    c_p8.alignment = align_center
    c_tot.alignment = align_center
    c_stat.alignment = align_center
    c_ket.alignment = align_left
    
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
        
    for col in range(1, 15):
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

for col_idx in range(6, 13):
    col_letter = get_column_letter(col_idx)
    cell = ws.cell(sum_row, col_idx, f"=ROUND(AVERAGE({col_letter}11:{col_letter}50), 1)")
    cell.font = font_bold
    cell.alignment = align_center
    cell.fill = fill_kpi

for col in range(1, 15):
    ws.cell(sum_row, col).border = border_total

# Freeze pane below header
ws.freeze_panes = "E11"

excel_path = "d:/laragon/www/klinik37/module/Rekap_Poin_Mobile_Programming_2_Kelas_195A05.xlsx"
wb.save(excel_path)
print(f"File Excel profesional berhasil disimpan di: {excel_path}")
