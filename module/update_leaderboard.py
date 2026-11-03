import re

scores_today = {
    1: 30, 3: 30, 4: 30, 6: 30, 8: 30, 9: 30, 10: 30, 11: 30, 13: 30, 14: 30,
    15: 30, 16: 30, 17: 30, 18: 30, 19: 30, 20: 30, 21: 20, 22: 20, 23: 30, 24: 30,
    25: 20, 26: 30, 27: 30, 28: 20, 29: 30, 30: 20, 32: 30, 33: 30, 34: 30, 35: 30,
    36: 30, 37: 30, 38: 30, 39: 30, 40: 30
}

with open('d:/laragon/www/klinik37/module/REKAP_POIN_MAHASISWA.md', 'r', encoding='utf-8') as f:
    content = f.read()

lines = content.split('\n')
current_data = {}
for l in lines:
    if l.startswith('|') and ('1924' in l or 'RIFKI WAHYU' in l or 'MUHAMMAD SYAUQI' in l):
        parts = [p.strip().replace('*', '').replace('🥇', '').replace('🥈', '').replace('🥉', '').strip() for p in l.split('|')[1:-1]]
        if len(parts) >= 5 and parts[1].isdigit():
            absen = int(parts[1])
            nim = parts[2]
            nama = parts[3]
            total_old = int(parts[4])
            today = scores_today.get(absen, 0)
            total_new = total_old + today
            current_data[absen] = {
                'absen': absen,
                'nim': nim,
                'nama': nama,
                'total_old': total_old,
                'today': today,
                'total_new': total_new
            }

ranked = sorted(current_data.values(), key=lambda x: (x['total_new'], -x['absen']), reverse=True)

# Generate updated markdown
md = []
md.append("# 📊 REKAPITULASI POIN & KLASEMEN LENGKAP MAHASISWA")
md.append("**Mata Kuliah:** Mobile Programming II (19.5A.05)  ")
md.append("**Dosen Pengampu:** Cep Adiwiharja  ")
md.append("**Identitas Mahasiswa:** DARELL RANGGA PUTRA RACHMAN (NIM: 19241009)  ")
md.append("**Nomor Absen Resmi:** **37** (Kelompok > 30: Fokus Data Pasien)  ")
md.append("**Prodi:** Sistem Informasi - Universitas Bina Sarana Informatika (UBSI)  ")
md.append("")
md.append("---")
md.append("")
md.append("## 🏆 STATUS TARGET KHUSUS DARELL: 🎉 GOAL TERCAPAI 100% (AUTO-A / 155 POIN) 🎉")
md.append("")
md.append("> ### 👑 GOLDEN GOAL ACHIEVED: **155 POIN** (Target: 150 Poin)")
md.append("> **Status Keberhasilan:**")
md.append("> - ✅ **TARGET 150 POIN RESMI DILAMPAUI HARI INI (TOTAL: 155 POIN)!**")
md.append("> - ✅ **NILAI AKHIR MATAKULIAH OTOMATIS A (MUTLAK 100)**")
md.append("> - ✅ **BEBAS DARI TUGAS PROJEK AKHIR SEMESTER**")
md.append("> - ✅ **BEBAS DARI PRESENTASI PROJEK (Pertemuan 14 & 15)**")
md.append(">")
md.append("> ---")
md.append(">")
md.append("> ### 📊 PROGRESS METER:")
md.append("> - **Poin Sebelum Hari Ini:** `125 Poin`")
md.append("> - **Nilai Challenge Hari Ini (P8):** **`+30 POIN (Maksimal / Waktu < 60 Menit)`** ⚡")
md.append("> - **TOTAL AKUMULASI POIN:** **`155 POIN`** 🎯")
md.append("> - **Persentase Pencapaian:** `103.3%` [████████████████████] **LULUS TARGET A!**")
md.append("")
md.append("---")
md.append("")
md.append("## 🏆 KLASEMEN RESMI TERBARU KELAS (SETELAH CHALLENGE P8)")
md.append("")
md.append("| Rank | No. Absen | NIM | Nama Mahasiswa | Total Poin | Status / Keterangan |")
md.append("|:---:|:---:|:---:|---|:---:|---|")

current_rank = 1
for idx, r in enumerate(ranked):
    # medal formatting
    if idx == 0:
        medal = "🥇 **1**"
    elif idx == 1:
        medal = "🥈 **2**"
    elif idx == 2:
        medal = "🥉 **3**"
    else:
        medal = f"**{idx + 1}**"
        
    is_darell = r['absen'] == 37
    if is_darell:
        md.append(f"| {medal} | **{r['absen']}** | **{r['nim']}** | **{r['nama']}** | **{r['total_new']}** | 🔥 **GOAL 150+ TERCAPAI (AUTO-A / BEBAS PROJEK & PRESENTASI)** |")
    elif r['total_new'] >= 150:
        md.append(f"| {medal} | **{r['absen']}** | {r['nim']} | {r['nama']} | **{r['total_new']}** | ✅ Lolos Ambang Batas Auto-A (150+) |")
    else:
        md.append(f"| {medal} | **{r['absen']}** | {r['nim']} | {r['nama']} | **{r['total_new']}** | +{r['today']} Hari ini (Total {r['total_new']}) |")

md.append("")
md.append("---")
md.append("")
md.append("## 📑 RIWAYAT LENGKAP POIN PER PERTEMUAN")
md.append("")
md.append("### 1. Pertemuan 2 (P2)")
md.append("- **Poin 25:** 29 (Davin), **37 (Darell)**, 1 (Rifki), 36 (Rajib), 39 (Tirta), 40 (Wahyu N), 10 (Refi), 21 (Wahyu Rizky), 18 (Nabila), 20 (Siti Nur), 15 (Katherine), 4 (Nasvira), 14 (Chesa), 27 (Bianca), 17 (Najmi).")
md.append("- **Poin 15:** 19 (Megi), 34 (Naufal), 33 (Aditya), 25 (Ndaru), 28 (Iman), 11 (Rahmadi), 16 (Rifa), 22 (Denada), 30 (Nayla), 31 (Rifki S), 24 (Rafi), 3 (Michio), 38 (Abi), 5 (Fadhli), 13 (Nasywa), 26 (Syifa).")
md.append("- **Poin 10:** 8 (Maulisya), 23 (Azizah), 6 (Nuning), 2 (Syauqi), 32 (Innesya), 35 (Noel), 12 (Adesky).")
md.append("")
md.append("### 2. Pertemuan 3 (P3)")
md.append("- **Poin 20:** 32 (Innesya), 13 (Nasywa), **37 (Darell)**, 26 (Syifa), 11 (Rahmadi), 29 (Davin), 27 (Bianca), 36 (Rajib), 19 (Megi), 20 (Siti Nur), 16 (Rifa), 18 (Nabila), 15 (Katherine), 05 (Fadhli), 01 (Rifki), 14 (Chesa), 33 (Aditya), 40 (Wahyu N), 09 (Ilham), 21 (Wahyu Rizky), 39 (Tirta), 03 (Michio), 23 (Azizah).")
md.append("")
md.append("### 3. Pertemuan 4 (P4 - 6 Oktober 2026)")
md.append("- **Poin 50 (20 + 30):** 32, 13, **37 (Darell)**, 26, 11, 29, 27, 36, 19, 20, 16, 18, 15, 05, 01, 14, 40, 09, 39, 03, 23.")
md.append("- **Poin 30:** 30, 04, 08, 38, 31, 22, 17, 25.")
md.append("- **Poin 20:** 33, 21.")
md.append("- **Poin 15:** 24.")
md.append("")
md.append("### 4. Pertemuan 5 (P5)")
md.append("- **Poin 30:** **37 (Darell)**, 39, 10, 19, 9, 36, 17, 8, 6, 18, 11, 29, 20, 03, 04, 27.")
md.append("- **Poin 20:** 34, 40, 26, 15, 5, 35, 25, 33, 14, 31, 1, 13, 28, 38, 22.")
md.append("- **Poin 10:** 30, 23, 32.")
md.append("- **Tidak Hadir:** 7, 12, 16.")
md.append("")
md.append("### 5. Pertemuan 7 (P7 - Bonus Tambahan)")
md.append("- **Poin +15:** 39, 40.")
md.append("- **Tidak Hadir:** 2, 11, 33.")
md.append("")
md.append("### 6. Pertemuan 8 (P8 - Challenge MockAPI Database Sekolah 3 November 2026)")
md.append("- **Poin 30 (Selesai < 60 Menit):** 1, 3, 4, 6, 8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 19, 20, 23, 24, 26, 27, 29, 32, 33, 34, 35, 36, **37 (Darell Rangga Putra Rachman)**, 38, 39, 40.")
md.append("- **Poin 20 (Selesai 60 - 90 Menit):** 21, 22, 25, 28, 30.")
md.append("- **Tidak Mengumpulkan / Tidak Hadir (0):** 2, 5, 7, 12, 31.")

output_path = 'd:/laragon/www/klinik37/module/REKAP_POIN_MAHASISWA.md'
with open(output_path, 'w', encoding='utf-8') as f:
    f.write('\n'.join(md))

print("Berhasil mengupdate REKAP_POIN_MAHASISWA.md!")
print(f"Total mahasiswa tercatat: {len(ranked)}")
