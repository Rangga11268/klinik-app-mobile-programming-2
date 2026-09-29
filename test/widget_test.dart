import 'package:flutter_test/flutter_test.dart';
import 'package:klinik37/main.dart';

void main() {
  testWidgets('Smoke test navigasi data poli dan detail poli', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Data Poli - DARELL RANGGA PUTRA RACHMAN'), findsOneWidget);
    expect(find.text('No. Absen: 37'), findsOneWidget);
    expect(find.text('POLI MATA'), findsOneWidget);
    expect(find.text('POLI PENYAKIT DALAM'), findsOneWidget);
    expect(find.text('POLI KULIT'), findsOneWidget);
    expect(find.text('POLI TULANG'), findsOneWidget);

    await tester.tap(find.text('POLI MATA'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Poli'), findsOneWidget);
    expect(find.text('Nama Poli : POLI MATA'), findsOneWidget);
    expect(find.text('Ubah'), findsOneWidget);
    expect(find.text('Hapus'), findsOneWidget);
  });
}
