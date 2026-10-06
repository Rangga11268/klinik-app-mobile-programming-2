import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;
  final VoidCallback? onDelete;
  final VoidCallback? onUpdate;

  const PasienItem({
    super.key,
    required this.pasien,
    this.onDelete,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(pasien.nama),
          subtitle: Text("No. RM: ${pasien.nomorRm}"),
        ),
      ),
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PasienDetail(pasien: pasien),
          ),
        );
        if (result == 'delete') {
          onDelete?.call();
        } else {
          onUpdate?.call();
        }
      },
    );
  }
}
