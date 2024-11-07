import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:state_mgmt/main.dart';
import 'package:state_mgmt/src/scoped_model.dart';

void main() {
  testWidgets('smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ScopedModel<CartModel>(
        model: CartModel(),
        child: MyApp(),
      ),
    );

    await _visitPage(tester, '/setstate');
    await _visitPage(tester, '/scoped');
    await _visitPage(tester, '/callbacks');
    await _visitPage(tester, '/perf');

    expect(await find.byType(FlatButton).evaluate().length, 4,
        reason: "Smoke test was expecting a different number of pages to test. "
            "Please make sure you visit all the pages above.");
  });
}

/// Just opens a page by tapping the button with [name]. Then immediately
/// returns back. This just tests that everything builds correctly without
/// crashing at runtime.
Future<void> _visitPage(WidgetTester tester, String name) async {
  await tester.tap(find.text(name));
  await tester.pumpAndSettle();
  await tester.pageBack();
  await tester.pumpAndSettle();
}
