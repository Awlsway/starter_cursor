import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ansvk_starter/app/app.dart';

void main() {
  testWidgets('App renders starter home text', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: AnsvkApp()));
    await tester.pumpAndSettle();

    expect(find.text('ANSVK Starter Home'), findsOneWidget);
  });
}
