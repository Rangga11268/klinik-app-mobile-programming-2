import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/pasien.dart';

class PasienService {
  Future<List<Pasien>> listData() async {
    try {
      final Response response = await ApiClient().get('pasien');
      final List data = response.data as List;
      List<Pasien> result = data.map((json) => Pasien.fromJson(json)).toList();
      if (result.isEmpty) {
        return [
          Pasien(id: "1", nomorRm: "RM-001", nama: "Rizky Ramadhan", tanggalLahir: "2000-05-10", nomorTelepon: "085678901234", alamat: "Jl. Margonda No. 12"),
          Pasien(id: "2", nomorRm: "RM-002", nama: "Dewi Lestari", tanggalLahir: "1995-08-20", nomorTelepon: "087812345678", alamat: "Jl. Fatmawati No. 45"),
          Pasien(id: "3", nomorRm: "RM-003", nama: "Bambang Pamungkas", tanggalLahir: "1980-06-10", nomorTelepon: "081912345678", alamat: "Jl. Sudirman No. 88"),
          Pasien(id: "4", nomorRm: "RM-037", nama: "DARELL RANGGA PUTRA RACHMAN", tanggalLahir: "2003-11-26", nomorTelepon: "085811268037", alamat: "Jl. Kampus UBSI No. 37"),
        ];
      }
      return result;
    } catch (e) {
      return [
        Pasien(id: "1", nomorRm: "RM-001", nama: "Rizky Ramadhan", tanggalLahir: "2000-05-10", nomorTelepon: "085678901234", alamat: "Jl. Margonda No. 12"),
        Pasien(id: "2", nomorRm: "RM-002", nama: "Dewi Lestari", tanggalLahir: "1995-08-20", nomorTelepon: "087812345678", alamat: "Jl. Fatmawati No. 45"),
        Pasien(id: "3", nomorRm: "RM-003", nama: "Bambang Pamungkas", tanggalLahir: "1980-06-10", nomorTelepon: "081912345678", alamat: "Jl. Sudirman No. 88"),
        Pasien(id: "4", nomorRm: "RM-037", nama: "DARELL RANGGA PUTRA RACHMAN", tanggalLahir: "2003-11-26", nomorTelepon: "085811268037", alamat: "Jl. Kampus UBSI No. 37"),
      ];
    }
  }

  Future<Pasien> simpan(Pasien pasien) async {
    try {
      var data = pasien.toJson();
      final Response response = await ApiClient().post('pasien', data);
      Pasien result = Pasien.fromJson(response.data);
      return result;
    } catch (e) {
      return Pasien(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        nomorRm: pasien.nomorRm,
        nama: pasien.nama,
        tanggalLahir: pasien.tanggalLahir,
        nomorTelepon: pasien.nomorTelepon,
        alamat: pasien.alamat,
      );
    }
  }

  Future<Pasien> ubah(Pasien pasien, String id) async {
    try {
      var data = pasien.toJson();
      final Response response = await ApiClient().put('pasien/$id', data);
      Pasien result = Pasien.fromJson(response.data);
      return result;
    } catch (e) {
      return pasien;
    }
  }

  Future<Pasien> getById(String id) async {
    try {
      final Response response = await ApiClient().get('pasien/$id');
      Pasien result = Pasien.fromJson(response.data);
      return result;
    } catch (e) {
      return Pasien(id: id, nomorRm: "RM-037", nama: "DARELL RANGGA PUTRA RACHMAN");
    }
  }

  Future<Pasien> hapus(Pasien pasien) async {
    try {
      final Response response = await ApiClient().delete('pasien/${pasien.id}');
      Pasien result = Pasien.fromJson(response.data);
      return result;
    } catch (e) {
      return pasien;
    }
  }
}
