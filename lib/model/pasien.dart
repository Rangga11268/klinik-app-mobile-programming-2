class Pasien {
  String? id;
  String nomorRm;
  String nama;
  String? tanggalLahir;
  String? nomorTelepon;
  String? alamat;

  Pasien({
    this.id,
    required this.nomorRm,
    required this.nama,
    this.tanggalLahir,
    this.nomorTelepon,
    this.alamat,
  });
}
