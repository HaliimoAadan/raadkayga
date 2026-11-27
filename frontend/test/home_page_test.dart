import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:raadkayga/api.dart';
import 'package:raadkayga/main.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  testWidgets('shows "API: running" when the backend is up', (tester) async {
    final client = MockClient((_) async =>
        http.Response('{"status":"running","name":"Raadkayga API"}', 200));

    await tester.pumpWidget(RaadkaygaApp(api: Api(client: client)));
    await tester.pumpAndSettle();

    expect(find.text('Raadkayga'), findsOneWidget);
    expect(find.text('API: running'), findsOneWidget);
  });

  testWidgets('shows an error when the backend fails', (tester) async {
    final client = MockClient((_) async => http.Response('oops', 500));

    await tester.pumpWidget(RaadkaygaApp(api: Api(client: client)));
    await tester.pumpAndSettle();

    expect(find.textContaining('API not reachable'), findsOneWidget);
  });
}