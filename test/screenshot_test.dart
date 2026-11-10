import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stateless_lab_exam/main.dart';

void main() {
  testWidgets('Generate screenshot for ShoppingCartPage', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(412 * 2, 892 * 2);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const StatelessLabExamApp());
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(StatelessLabExamApp),
      matchesGoldenFile('goldens/shopping_cart_page.png'),
    );
  });
}
