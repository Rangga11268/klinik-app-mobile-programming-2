import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klinik37/main.dart';

void main() {
  testWidgets('Smoke test navigasi, tambah, ubah, dan hapus data poli', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Data Poli - DARELL RANGGA PUTRA RACHMAN'), findsOneWidget);
    expect(find.text('No. Absen: 37'), findsOneWidget);
    expect(find.text('POLI MATA'), findsOneWidget);
    expect(find.text('POLI PENYAKIT DALAM'), findsOneWidget);
    expect(find.text('POLI KULIT'), findsOneWidget);
    expect(find.text('POLI TULANG'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);

    // 1. TEST TAMBAH DATA (CREATE)
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('Tambah Poli'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'POLI GIGI TEST');
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    // Verifikasi data baru muncul di list utama
    expect(find.text('POLI GIGI TEST'), findsOneWidget);

    // 2. TEST UBAH NAMA (UPDATE)
    await tester.tap(find.text('POLI GIGI TEST'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Poli'), findsOneWidget);
    expect(find.text('Nama Poli : POLI GIGI TEST'), findsOneWidget);

    await tester.tap(find.text('Ubah'));
    await tester.pumpAndSettle();

    expect(find.text('Ubah Poli'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'POLI GIGI EDIT');
    await tester.tap(find.text('Simpan Perubahan'));
    await tester.pumpAndSettle();

    // Verifikasi nama berubah di detail
    expect(find.text('Nama Poli : POLI GIGI EDIT'), findsOneWidget);

    // 3. TEST HAPUS DATA (DELETE)
    await tester.tap(find.text('Hapus'));
    await tester.pumpAndSettle();

    expect(find.text('Yakin ingin menghapus data ini?'), findsOneWidget);
    await tester.tap(find.text('YA'));
    await tester.pumpAndSettle();

    // Verifikasi kembali ke list utama dan item terhapus
    expect(find.text('POLI GIGI EDIT'), findsNothing);
  });
}
