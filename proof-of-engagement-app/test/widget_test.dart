import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proof_of_engagement_app/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen has a title and a list of clubs', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    expect(find.text('Clubs'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });
}