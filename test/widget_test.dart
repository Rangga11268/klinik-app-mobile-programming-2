import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klinik37/main.dart';

void main() {
  testWidgets('Smoke test flow Login -> Beranda -> Poli -> CRUD & Sidebar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // 1. TEST HALAMAN LOGIN
    expect(find.text('Login Admin'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    // Klik tombol Login
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // 2. TEST HALAMAN BERANDA
    expect(find.text('Beranda - DARELL RANGGA PUTRA RACHMAN'), findsOneWidget);
    expect(find.text('Selamat Datang di Sistem Informasi Klinik'), findsOneWidget);

    // 3. TEST SIDEBAR DRAWER KE DATA POLI
    final ScaffoldState scaffoldState = tester.firstState(find.byType(Scaffold));
    scaffoldState.openDrawer();
    await tester.pumpAndSettle();

    expect(find.text('Data Poli'), findsOneWidget);
    expect(find.text('Data Pegawai'), findsOneWidget);
    expect(find.text('Data Pasien'), findsOneWidget);
    expect(find.text('Keluar'), findsOneWidget);

    // Pindah ke Data Poli
    await tester.tap(find.text('Data Poli'));
    await tester.pumpAndSettle();

    expect(find.text('Data Poli - DARELL RANGGA PUTRA RACHMAN'), findsOneWidget);
    expect(find.text('POLI MATA'), findsOneWidget);
    expect(find.text('POLI PENYAKIT DALAM'), findsOneWidget);
    expect(find.text('POLI KULIT'), findsOneWidget);
    expect(find.text('POLI TULANG'), findsOneWidget);

    // 4. TEST TAMBAH DATA (CREATE)
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('Tambah Poli'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'POLI GIGI TEST');
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    // Verifikasi data baru muncul di list utama
    expect(find.text('POLI GIGI TEST'), findsOneWidget);

    // 5. TEST UBAH NAMA (UPDATE)
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

    // 6. TEST HAPUS DATA (DELETE)
    await tester.tap(find.text('Hapus'));
    await tester.pumpAndSettle();

    expect(find.text('Yakin ingin menghapus data ini?'), findsOneWidget);
    await tester.tap(find.text('YA'));
    await tester.pumpAndSettle();

    // Verifikasi kembali ke list utama dan item terhapus
    expect(find.text('POLI GIGI EDIT'), findsNothing);
  });
}
