// This is a basic Flutter widget test for RevoSchools app.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:revo_schools/main.dart';

void main() {
  testWidgets('RevoSchools app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app shows the RevoSchools title.
    expect(find.text('RevoSchools'), findsOneWidget);
    
    // Verify that Pathways Global School is displayed.
    expect(find.text('Pathways Global School'), findsOneWidget);
    expect(find.text('Kot ise khan'), findsOneWidget);

    // Verify that chat list items are present.
    expect(find.text('Homework'), findsOneWidget);
    expect(find.text('School Fee'), findsOneWidget);
    expect(find.text('Exam Results'), findsOneWidget);
  });
}
