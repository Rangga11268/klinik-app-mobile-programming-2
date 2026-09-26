import 'package:flutter_test/flutter_test.dart';
import 'package:klinik_app/main.dart';

void main() {
  testWidgets('Smoke test navigasi data poli dan detail poli', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Verify PoliPage displays Data Poli and list items
    expect(find.text('Data Poli'), findsOneWidget);
    expect(find.text('Poli Anak'), findsOneWidget);
    expect(find.text('Poli Kandungan'), findsOneWidget);
    expect(find.text('Poli Gigi'), findsOneWidget);
    expect(find.text('Poli THT'), findsOneWidget);

    // Tap Poli Anak
    await tester.tap(find.text('Poli Anak'));
    await tester.pumpAndSettle();

    // Verify PoliDetail page is rendered
    expect(find.text('Detail Poli'), findsOneWidget);
    expect(find.text('Nama Poli : Poli Anak'), findsOneWidget);
    expect(find.text('Ubah'), findsOneWidget);
    expect(find.text('Hapus'), findsOneWidget);
  });
}
