import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';
import 'package:challenge_marvel_studio/src/features/watch/presenter/page/watch_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should check initial render', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Navigator(
        onGenerateRoute: (_) {
          return MaterialPageRoute<Widget>(
            builder: (_) => const WatchPage(),
            settings: RouteSettings(
                arguments: MovieEntity(
                    id: '1',
                    titleName: 'title',
                    releaseYearDate: 2020,
                    thumbnailUrl: '')),
          );
        },
      ),
    ));

    expect(find.byType(Text), findsNWidgets(5));
    expect(find.byType(Icon), findsNWidgets(8));
  });
}
