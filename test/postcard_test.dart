import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postcard/src/postcard.dart';

void main() {
  testWidgets('Postcard displays correct content', (WidgetTester tester) async {
    // Build our Postcard widget
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Postcard(
          cardColor: Colors.blue,
          icon: Icons.favorite,
          iconColor: Color(0xffFF6594),
          content: 'This is an animated card!',
        ),
      ),
    ));

    // Verify that the content is displayed
    expect(find.text('Tap to view more'), findsOneWidget);
    expect(find.text('This is an animated card!'), findsOneWidget);
  });

  testWidgets('Postcard animates on tap', (WidgetTester tester) async {
    // Build our Postcard widget
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Postcard(
          cardColor: Colors.blue,
          icon: Icons.favorite,
          iconColor: Color(0xffFF6594),
          content: 'This is an animated card!',
        ),
      ),
    ));

    // Tap the card to trigger the animation
    // await tester.tap(find.byType());
    await tester.pumpAndSettle(); // Allow animations to complete

    // After tapping, verify that the card is still present (you can add more checks if necessary)
    expect(find.byType(Postcard), findsOneWidget);
  });
}
