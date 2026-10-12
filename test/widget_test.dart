import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klinik37/main.dart';

void main() {
  testWidgets('Smoke test Pertemuan 4: Data Poli -> Form Tambah -> CRUD & Validasi', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // 1. VERIFIKASI HALAMAN AWAL (DATA POLI - PERTEMUAN 4)
    expect(find.text('Data Poli - DARELL RANGGA PUTRA RACHMAN'), findsOneWidget);
    expect(find.text('No. Absen: 37'), findsOneWidget);
    expect(find.text('POLI MATA'), findsOneWidget);
    expect(find.text('POLI PENYAKIT DALAM'), findsOneWidget);
    expect(find.text('POLI KULIT'), findsOneWidget);
    expect(find.text('POLI TULANG'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);

    // 2. TEST VALIDASI FORM TAMBAH (FIELD KOSONG -> MUNCUL PESAN WAJIB DIISI)
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('Tambah Poli'), findsOneWidget);
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    // Verifikasi pesan error validator muncul
    expect(find.text('Nama Poli wajib diisi'), findsOneWidget);

    // 3. TEST INPUT & SIMPAN DATA BERHASIL (CREATE)
    await tester.enterText(find.byType(TextFormField), 'POLI GIGI TEST');
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();

    // Verifikasi data baru muncul di list utama dan SnackBar muncul
    expect(find.text('POLI GIGI TEST'), findsOneWidget);
    expect(find.text('Data POLI GIGI TEST berhasil ditambahkan!'), findsOneWidget);

    // 4. TEST UBAH NAMA (UPDATE - PERTEMUAN 5)
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

    // Verifikasi nama berubah di detail
    expect(find.text('Nama Poli : POLI GIGI EDIT'), findsOneWidget);

    // 5. TEST HAPUS DATA (DELETE DENGAN ALERTDIALOG - PERTEMUAN 5)
    await tester.tap(find.text('Hapus'));
    await tester.pumpAndSettle();

    expect(find.text('Yakin ingin menghapus data ini?'), findsOneWidget);
    await tester.tap(find.text('YA'));
    await tester.pumpAndSettle();

    // Verifikasi kembali ke list utama dan item terhapus
    expect(find.text('POLI GIGI EDIT'), findsNothing);
    expect(find.text('Data POLI GIGI EDIT berhasil dihapus!'), findsOneWidget);

    // 6. TEST SIDEBAR DRAWER (PERTEMUAN 6)
    final ScaffoldState scaffoldState = tester.firstState(find.byType(Scaffold));
    scaffoldState.openDrawer();
    await tester.pumpAndSettle();

    expect(find.text('Beranda'), findsOneWidget);
    expect(find.text('Data Pegawai'), findsOneWidget);
    expect(find.text('Data Pasien'), findsOneWidget);
    expect(find.text('Keluar'), findsOneWidget);
  });
}
