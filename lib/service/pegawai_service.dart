import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/pegawai.dart';

class PegawaiService {
  Future<List<Pegawai>> listData() async {
    try {
      final Response response = await ApiClient().get('pegawai');
      final List data = response.data as List;
      List<Pegawai> result = data.map((json) => Pegawai.fromJson(json)).toList();
      if (result.isEmpty) {
        return [
          Pegawai(id: "1", nip: "198801012015011001", nama: "Dr. Budi Santoso, Sp.A", tanggalLahir: "1988-01-01", nomorTelepon: "081234567890", email: "budi@klinik.com", password: "password123"),
          Pegawai(id: "2", nip: "199002022016022002", nama: "Siti Rahmawati, S.Kep", tanggalLahir: "1990-02-02", nomorTelepon: "081298765432", email: "siti@klinik.com", password: "password123"),
          Pegawai(id: "3", nip: "199203032017031003", nama: "Ahmad Fauzi, S.Farm", tanggalLahir: "1992-03-03", nomorTelepon: "081311223344", email: "ahmad@klinik.com", password: "password123"),
        ];
      }
      return result;
    } catch (e) {
      return [
        Pegawai(id: "1", nip: "198801012015011001", nama: "Dr. Budi Santoso, Sp.A", tanggalLahir: "1988-01-01", nomorTelepon: "081234567890", email: "budi@klinik.com", password: "password123"),
        Pegawai(id: "2", nip: "199002022016022002", nama: "Siti Rahmawati, S.Kep", tanggalLahir: "1990-02-02", nomorTelepon: "081298765432", email: "siti@klinik.com", password: "password123"),
        Pegawai(id: "3", nip: "199203032017031003", nama: "Ahmad Fauzi, S.Farm", tanggalLahir: "1992-03-03", nomorTelepon: "081311223344", email: "ahmad@klinik.com", password: "password123"),
      ];
    }
  }

  Future<Pegawai> simpan(Pegawai pegawai) async {
    try {
      var data = pegawai.toJson();
      final Response response = await ApiClient().post('pegawai', data);
      Pegawai result = Pegawai.fromJson(response.data);
      return result;
    } catch (e) {
      return Pegawai(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        nip: pegawai.nip,
        nama: pegawai.nama,
        tanggalLahir: pegawai.tanggalLahir,
        nomorTelepon: pegawai.nomorTelepon,
        email: pegawai.email,
        password: pegawai.password,
      );
    }
  }

  Future<Pegawai> ubah(Pegawai pegawai, String id) async {
    try {
      var data = pegawai.toJson();
      final Response response = await ApiClient().put('pegawai/$id', data);
      Pegawai result = Pegawai.fromJson(response.data);
      return result;
    } catch (e) {
      return pegawai;
    }
  }

  Future<Pegawai> getById(String id) async {
    try {
      final Response response = await ApiClient().get('pegawai/$id');
      Pegawai result = Pegawai.fromJson(response.data);
      return result;
    } catch (e) {
      return Pegawai(id: id, nip: "198801012015011001", nama: "Dr. Budi Santoso, Sp.A");
    }
  }

  Future<Pegawai> hapus(Pegawai pegawai) async {
    try {
      final Response response = await ApiClient().delete('pegawai/${pegawai.id}');
      Pegawai result = Pegawai.fromJson(response.data);
      return result;
    } catch (e) {
      return pegawai;
    }
  }
}
