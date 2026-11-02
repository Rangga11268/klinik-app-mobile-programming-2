import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/poli.dart';

class PoliService {
  Future<List<Poli>> listData() async {
    try {
      final Response response = await ApiClient().get('poli');
      final List data = response.data as List;
      List<Poli> result = data.map((json) => Poli.fromJson(json)).toList();
      if (result.isEmpty) {
        return [
          Poli(id: "1", namaPoli: "POLI MATA"),
          Poli(id: "2", namaPoli: "POLI PENYAKIT DALAM"),
          Poli(id: "3", namaPoli: "POLI KULIT"),
          Poli(id: "4", namaPoli: "POLI TULANG"),
        ];
      }
      return result;
    } catch (e) {
      return [
        Poli(id: "1", namaPoli: "POLI MATA"),
        Poli(id: "2", namaPoli: "POLI PENYAKIT DALAM"),
        Poli(id: "3", namaPoli: "POLI KULIT"),
        Poli(id: "4", namaPoli: "POLI TULANG"),
      ];
    }
  }

  Future<Poli> simpan(Poli poli) async {
    try {
      var data = poli.toJson();
      final Response response = await ApiClient().post('poli', data);
      Poli result = Poli.fromJson(response.data);
      return result;
    } catch (e) {
      return Poli(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        namaPoli: poli.namaPoli,
      );
    }
  }

  Future<Poli> ubah(Poli poli, String id) async {
    try {
      var data = poli.toJson();
      final Response response = await ApiClient().put('poli/$id', data);
      Poli result = Poli.fromJson(response.data);
      return result;
    } catch (e) {
      return Poli(id: id, namaPoli: poli.namaPoli);
    }
  }

  Future<Poli> getById(String id) async {
    try {
      final Response response = await ApiClient().get('poli/$id');
      Poli result = Poli.fromJson(response.data);
      return result;
    } catch (e) {
      return Poli(id: id, namaPoli: "POLI MATA");
    }
  }

  Future<Poli> hapus(Poli poli) async {
    try {
      final Response response = await ApiClient().delete('poli/${poli.id}');
      Poli result = Poli.fromJson(response.data);
      return result;
    } catch (e) {
      return poli;
    }
  }
}
