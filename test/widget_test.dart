import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moodle/main.dart';

void main() {
  testWidgets('dashboard opens the courses page', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MoodleApp());
    expect(find.text('Welcome back, Samuel'), findsOneWidget);

    await tester.tap(find.text('View courses'));
    await tester.pumpAndSettle();
    expect(find.text('Search courses'), findsOneWidget);
    expect(find.text('UXDI'), findsOneWidget);
  });

  testWidgets('drawer navigates to profile', (tester) async {
    await tester.pumpWidget(const MoodleApp());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();

    expect(find.text('UP2246941'), findsOneWidget);
    expect(find.text('BSc (Hons) Computer Science'), findsOneWidget);
  });

  testWidgets('course search filters the list', (tester) async {
    await tester.pumpWidget(const MoodleApp());
    tester.state<NavigatorState>(find.byType(Navigator)).pushNamed('/courses');
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'UXDI');
    await tester.pump();

    expect(find.text('UXDI'), findsNWidgets(2));
    expect(find.text('PAPL'), findsNothing);
  });

  testWidgets('login button returns to dashboard', (tester) async {
    await tester.pumpWidget(const MoodleApp());
    tester.state<NavigatorState>(find.byType(Navigator)).pushNamed('/login');
    await tester.pumpAndSettle();

    expect(find.text('Sign in to Moodle'), findsOneWidget);
    await tester.enterText(
      find.byType(TextFormField).first,
      'up2246941@myport.ac.uk',
    );
    await tester.tap(find.text('Log in'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back, Samuel'), findsOneWidget);
  });
}
