class Pegawai {
  String? id;
  String nip;
  String nama;
  String? tanggalLahir;
  String? nomorTelepon;
  String? email;
  String? password;

  Pegawai({
    this.id,
    required this.nip,
    required this.nama,
    this.tanggalLahir,
    this.nomorTelepon,
    this.email,
    this.password,
  });
}

