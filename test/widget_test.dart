import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klinik_app/main.dart';
import 'package:klinik_app/ui/pegawai_page.dart';
import 'package:klinik_app/ui/pasien_page.dart';

void main() {
  testWidgets('Smoke test navigasi data poli dan detail poli', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Data Poli'), findsOneWidget);
    expect(find.text('Poli Anak'), findsOneWidget);

    await tester.tap(find.text('Poli Anak'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Poli'), findsOneWidget);
    expect(find.text('Nama Poli : Poli Anak'), findsOneWidget);
    expect(find.text('Ubah'), findsOneWidget);
    expect(find.text('Hapus'), findsOneWidget);
  });

  testWidgets('Smoke test navigasi data pegawai Darell Rangga', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PegawaiPage(),
      ),
    );

    expect(find.text('Data Pegawai'), findsOneWidget);
    expect(find.text('Darell Rangga Putra Rachman'), findsOneWidget);

    await tester.tap(find.text('Darell Rangga Putra Rachman'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Pegawai'), findsOneWidget);
    expect(find.text('Nama : Darell Rangga Putra Rachman'), findsOneWidget);
    expect(find.text('NIM / NIP : 19241009'), findsOneWidget);
    expect(find.text('No. Absen / ID : 37'), findsOneWidget);
  });

  testWidgets('Smoke test navigasi data pasien', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: PasienPage(),
      ),
    );

    expect(find.text('Data Pasien'), findsOneWidget);
    expect(find.text('Andi Pratama'), findsOneWidget);

    await tester.tap(find.text('Andi Pratama'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Pasien'), findsOneWidget);
    expect(find.text('Nama : Andi Pratama'), findsOneWidget);
    expect(find.text('Nomor RM : RM-001'), findsOneWidget);
  });
}
