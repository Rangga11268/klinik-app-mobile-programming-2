import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klinik37/main.dart';

void main() {
  testWidgets('Smoke test Beranda Quick Actions & CRUD Flow', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // 1. VERIFIKASI HALAMAN BERANDA & QUICK ACTIONS
    expect(find.text('Selamat Datang di Aplikasi'), findsOneWidget);
    expect(find.text('Aplikasi ini memberikan pengalaman yang luar biasa'), findsOneWidget);
    expect(find.byIcon(Icons.accessible), findsOneWidget); // Quick action Poli
    expect(find.byIcon(Icons.people), findsOneWidget);     // Quick action Pegawai
    expect(find.byIcon(Icons.account_box), findsOneWidget); // Quick action Pasien
    expect(find.byIcon(Icons.logout_rounded), findsOneWidget); // Quick action Keluar

    // 2. TAP QUICK ACTION POLI -> MASUK DATA POLI
    await tester.tap(find.byIcon(Icons.accessible));
    await tester.pumpAndSettle();

    expect(find.text('Data Poli - DARELL RANGGA PUTRA RACHMAN'), findsOneWidget);
    expect(find.text('No. Absen: 37'), findsOneWidget);
    expect(find.text('POLI MATA'), findsOneWidget);

    // 3. TEST VALIDASI FORM TAMBAH (TAP TOMBOL TAMBAH FOTO DENGAN BADGE ADD)
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('Tambah Poli'), findsOneWidget);
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    // Verifikasi pesan error validator muncul
    expect(find.text('Nama Poli wajib diisi'), findsOneWidget);

    // 4. TEST INPUT & SIMPAN DATA BERHASIL (CREATE)
    await tester.enterText(find.byType(TextFormField), 'POLI GIGI TEST');
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    expect(find.text('POLI GIGI TEST'), findsOneWidget);
    expect(find.text('Data POLI GIGI TEST berhasil ditambahkan!'), findsOneWidget);

    // 5. TEST UBAH NAMA (UPDATE)
    await tester.tap(find.text('POLI GIGI TEST'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Poli'), findsOneWidget);
    expect(find.text('Nama Poli : POLI GIGI TEST'), findsOneWidget);

    await tester.tap(find.text('Ubah'));
    await tester.pumpAndSettle();

    expect(find.text('Ubah Poli'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'POLI GIGI EDIT');
    await tester.tap(find.text('Simpan Perubahan'));
    await tester.pumpAndSettle();

    expect(find.text('Nama Poli : POLI GIGI EDIT'), findsOneWidget);

    // 6. TEST HAPUS DATA (DELETE DENGAN ALERTDIALOG)
    await tester.tap(find.text('Hapus'));
    await tester.pumpAndSettle();

    expect(find.text('Yakin ingin menghapus data ini?'), findsOneWidget);
    await tester.tap(find.text('YA'));
    await tester.pumpAndSettle();

    expect(find.text('POLI GIGI EDIT'), findsNothing);
    expect(find.text('Data POLI GIGI EDIT berhasil dihapus!'), findsOneWidget);

    // 7. TEST SIDEBAR DRAWER
    final ScaffoldState scaffoldState = tester.firstState(find.byType(Scaffold));
    scaffoldState.openDrawer();
    await tester.pumpAndSettle();

    expect(find.text('Beranda'), findsOneWidget);
    expect(find.text('Data Pegawai'), findsOneWidget);
    expect(find.text('Data Pasien'), findsOneWidget);
    expect(find.text('Keluar'), findsOneWidget);
  });
}
