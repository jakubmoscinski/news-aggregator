import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:news_aggregator_ui/main.dart';
import 'package:news_aggregator_ui/home_page.dart';

void main() {
  group('Login Page Widget Tests', () {
    testWidgets('Email field validation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      // Verify that the initial state of the email field is empty
      expect(find.text(''), findsNWidgets(1));

      // Enter an invalid email address
      await tester.enterText(find.byType(TextFormField).first, 'invalid');

      // Tap the login button
      await tester.tap(find.byType(ElevatedButton));

      // Wait for the error dialog to appear
      await tester.pump();

      // Verify that the error dialog is shown
      expect(find.text('Error'), findsOneWidget);
      expect(find.text('Please enter a valid email address.'), findsOneWidget);

      // Clear the email field
      await tester.enterText(find.byType(TextFormField).first, '');

      // Tap the login button again
      await tester.tap(find.byType(ElevatedButton));

      // Wait for the error dialog to appear
      await tester.pump();

      // Verify that the error dialog is shown again
      expect(find.text('Error'), findsOneWidget);
      expect(
          find.text('Please enter your email and password.'), findsOneWidget);
    });

    testWidgets('Password field validation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      // Verify that the initial state of the password field is empty
      expect(find.text(''), findsNWidgets(1));

      // Enter a password with less than 6 characters
      await tester.enterText(find.byType(TextFormField).last, '12345');

      // Tap the login button
      await tester.tap(find.byType(ElevatedButton));

      // Wait for the error dialog to appear
      await tester.pump();

      // Verify that the error dialog is shown
      expect(find.text('Error'), findsOneWidget);
      expect(
          find.text('Password must be at least 6 characters.'), findsOneWidget);

      // Clear the password field
      await tester.enterText(find.byType(TextFormField).last, '');

      // Tap the login button again
      await tester.tap(find.byType(ElevatedButton));

      // Wait for the error dialog to appear
      await tester.pump();

      // Verify that the error dialog is shown again
      expect(find.text('Error'), findsOneWidget);
      expect(
          find.text('Please enter your email and password.'), findsOneWidget);
    });

    testWidgets('Successful login', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      // Enter a valid email address and password
      await tester.enterText(
          find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password');

      // Tap the login button
      await tester.tap(find.byType(ElevatedButton));

      // Wait for the main page to appear
      await tester.pumpAndSettle();

      // Verify that the main page is shown
      expect(find.text('Welcome to the app!'), findsOneWidget);
    });
  });
}
