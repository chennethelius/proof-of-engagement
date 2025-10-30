import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proof_of_engagement_app/features/auth/presentation/screens/connect_wallet_screen.dart';

void main() {
  testWidgets('Connect wallet screen has title', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: ConnectWalletScreen())));

    expect(find.text('Proof of Engagement'), findsOneWidget);
  });
}