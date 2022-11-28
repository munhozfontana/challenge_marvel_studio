import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/page/widgets/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('movie list render list with just one element', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MovieList(
          movies: [
            MovieEntity(
                id: '1',
                titleName: 'anyTitle',
                releaseYearDate: 2020,
                thumbnailUrl: '')
          ],
        ),
      ),
      const Duration(seconds: 2),
    );

    expect(find.text('anyTitle'), findsOneWidget);
    expect(find.text('(2020)'), findsOneWidget);
  });
}
