import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/repositories/i_movie_repository.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/usecases/movie/interfaces/list_all_movies_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late ListAllMoviesCase sut;
  late MockIMovieRepository mockIMovieRepository;

  setUp(() {
    mockIMovieRepository = MockIMovieRepository();

    sut = ListAllMoviesCase(
      iMovieRepository: mockIMovieRepository,
    );
  });

  test('should return list of movies when success', () async {
    when(() => mockIMovieRepository.listAll()).thenAnswer(
      (_) async => Right([
        MovieEntity(
            id: '0',
            titleName: 'anyName',
            releaseYearDate: 2009,
            thumbnailUrl: 'anyUrl')
      ]),
    );

    var res = (await sut());

    expect(res, isA<Right>());
    expect(res.fold((l) => l, (r) => r), hasLength(1));
  });
}
