import 'package:challenge_marvel_studio/src/features/home/domain/entities/errors/i_business_exception.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/usecases/movie/interfaces/i_list_all_movies_case.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/states/movie_state.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/stores/movie_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockIListAllMoviesCase extends Mock implements IListAllMoviesCase {}

void main() {
  late MovieCubit sut;
  late MockIListAllMoviesCase mockIListAllMoviesCase;

  setUp(() {
    mockIListAllMoviesCase = MockIListAllMoviesCase();

    sut = MovieCubit(iListAllMoviesCase: mockIListAllMoviesCase);
  });

  test('should call load all movies with no errors', () async {
    when(() => mockIListAllMoviesCase()).thenAnswer(
      (invocation) async => Right([
        MovieEntity(
            id: '0',
            titleName: 'anyTitle',
            releaseYearDate: 2016,
            thumbnailUrl: 'any')
      ]),
    );

    await sut.loadAllMovies();

    expect(sut.state.movies, hasLength(1));
  });

  test('should emit event of error', () async {
    when(() => mockIListAllMoviesCase()).thenAnswer(
      (invocation) async => Left(ExternalException()),
    );

    await sut.loadAllMovies();

    expect(sut.state, isA<ErrorMovieState>());
  });
}
