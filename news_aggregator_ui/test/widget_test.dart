import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:news_aggregator_ui/main.dart';
import 'package:news_aggregator_ui/view/login_view.dart';

void main() {
  group('Login Page Widget Tests', () {
    testWidgets('Email field validation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));
      expect(find.text(''), findsNWidgets(1));
      await tester.enterText(find.byType(TextFormField).first, 'invalid');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(find.text('Error'), findsOneWidget);
      expect(find.text('Please enter a valid email address.'), findsOneWidget);
      await tester.enterText(find.byType(TextFormField).first, '');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(find.text('Error'), findsOneWidget);
      expect(
          find.text('Please enter your email and password.'), findsOneWidget);
    });

    testWidgets('Password field validation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));
      expect(find.text(''), findsNWidgets(1));
      await tester.enterText(find.byType(TextFormField).last, '12345');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(find.text('Error'), findsOneWidget);
      expect(
          find.text('Password must be at least 6 characters.'), findsOneWidget);
      await tester.enterText(find.byType(TextFormField).last, '');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(find.text('Error'), findsOneWidget);
      expect(
          find.text('Please enter your email and password.'), findsOneWidget);
    });

    testWidgets('Successful login', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));
      await tester.enterText(
          find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Welcome to the app!'), findsOneWidget);
    });
  });
}
