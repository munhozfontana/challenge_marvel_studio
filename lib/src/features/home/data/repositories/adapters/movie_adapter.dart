import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';

class MovieAdapter {
  static MovieEntity fromJson(Map<String, dynamic> data) {
    return MovieEntity(
      id: data['id'],
      releaseYearDate: data['text'],
      thumbnailUrl: data['text'],
      titleName: data['text'],
    );
  }
}
