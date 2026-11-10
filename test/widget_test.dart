import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stateless_lab_exam/main.dart';

void main() {
  testWidgets('ShoppingCartPage renders all sections and handles all required button callbacks', (WidgetTester tester) async {
    // Provide a taller surface to simulate a realistic phone view
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const StatelessLabExamApp());

    // 1. AppBar
    expect(find.text('My Cart'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    expect(find.text('3'), findsOneWidget);

    // 2. Introduction Section
    expect(find.text('CAMPUS STORE'), findsOneWidget);
    expect(find.text('Ready for checkout'), findsOneWidget);
    expect(find.text('Review your items before placing your order.'), findsOneWidget);

    // 3. Delivery Card
    expect(find.text('Deliver to Niño Angelo C. Cirunay'), findsOneWidget);
    expect(find.textContaining('Matina'), findsOneWidget);
    expect(find.text('Change'), findsOneWidget);

    // 4. Order Items Section
    expect(find.text('Order Items'), findsOneWidget);
    expect(find.text('3 items'), findsOneWidget);
    expect(find.text('Wireless Mouse'), findsOneWidget);
    expect(find.text('PHP 450.00'), findsOneWidget);
    expect(find.text('USB-C Hub'), findsOneWidget);
    expect(find.text('PHP 850.00'), findsOneWidget);
    expect(find.text('Laptop Stand'), findsOneWidget);
    expect(find.text('PHP 700.00'), findsOneWidget);

    // 5. Discount Banner
    expect(find.text('STUDENT10 applied'), findsOneWidget);
    expect(find.text('10% discount on items'), findsOneWidget);

    // 6. Payment Summary
    expect(find.text('Payment Summary'), findsOneWidget);
    expect(find.text('Subtotal'), findsOneWidget);
    expect(find.text('PHP 2,000.00'), findsOneWidget);
    expect(find.text('Discount (10%)'), findsOneWidget);
    expect(find.text('- PHP 200.00'), findsOneWidget);
    expect(find.text('Delivery Fee'), findsOneWidget);
    expect(find.text('PHP 50.00'), findsOneWidget);
    expect(find.text('Total'), findsOneWidget);
    expect(find.text('PHP 1,850.00'), findsOneWidget);

    // 7. Place Order Button
    expect(find.text('Place Order'), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsOneWidget);

    // Test all required button callbacks and console prints
    // 1. Back arrow
    await tester.tap(find.byIcon(Icons.arrow_back));
    // 2. Shopping bag
    await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
    // 3. Change
    await tester.tap(find.text('Change'));

    // 4. Plus & Minus & Delete buttons for each product
    final plusButtons = find.byIcon(Icons.add);
    final minusButtons = find.byIcon(Icons.remove);
    final deleteButtons = find.byIcon(Icons.delete_outline_rounded);

    for (int i = 0; i < 3; i++) {
      await tester.tap(plusButtons.at(i));
      await tester.tap(minusButtons.at(i));
      await tester.tap(deleteButtons.at(i));
    }

    // 5. Place order
    await tester.ensureVisible(find.text('Place Order'));
    await tester.tap(find.text('Place Order'));
    await tester.pump();
  });
}
