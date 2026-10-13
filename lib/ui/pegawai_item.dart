import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiItem extends StatelessWidget {
  final Pegawai pegawai;
  final VoidCallback? onDelete;
  final VoidCallback? onUpdate;

  const PegawaiItem({
    super.key,
    required this.pegawai,
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
          title: Text(pegawai.nama),
          subtitle: Text("NIP: ${pegawai.nip}"),
        ),
      ),
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PegawaiDetail(pegawai: pegawai),
          ),
        );
        if (result == 'delete') {
          onDelete?.call();
        } else if (result == 'update') {
          onUpdate?.call();
        }
      },
    );
  }
}
