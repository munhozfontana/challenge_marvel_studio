import 'package:challenge_marvel_studio/src/features/home/presenter/page/widgets/main_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('main title should have title', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainTitle()));

    final titleFinder = find.text('MARVEL\nCINEMATIC\nUNIVERSE');

    expect(titleFinder, findsOneWidget);
  });
}
