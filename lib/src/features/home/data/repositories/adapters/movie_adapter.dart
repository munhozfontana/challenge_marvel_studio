import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';

class MovieAdapter {
  static MovieEntity fromJson(Map<String, dynamic> data) {
    var releaseYearDate = (data['release_date'] as String).split('-').first;

    return MovieEntity(
      id: (data['id'] as int).toString(),
      releaseYearDate: int.parse(releaseYearDate),
      thumbnailUrl: (data['poster_path'] as String),
      titleName: (data['title'] as String),
    );
  }
}
