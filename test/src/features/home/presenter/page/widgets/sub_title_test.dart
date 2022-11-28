import 'package:challenge_marvel_studio/src/features/home/presenter/page/widgets/sub_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('sub title should have  subtitle', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SubTitle()));

    final titleFinder = find.text('LINHA DO TEMPO');

    expect(titleFinder, findsOneWidget);
  });
}
