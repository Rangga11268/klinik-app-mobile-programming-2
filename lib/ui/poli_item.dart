import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';

class PoliItem extends StatelessWidget {
  final Poli poli;
  final VoidCallback? onDelete;
  final VoidCallback? onUpdate;

  const PoliItem({
    super.key,
    required this.poli,
    this.onDelete,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(poli.namaPoli),
        ),
      ),
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PoliDetail(poli: poli),
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
