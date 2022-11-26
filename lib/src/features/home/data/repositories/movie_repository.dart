import 'package:challenge_marvel_studio/src/features/home/data/external/interfaces/i_movie_external.dart';
import 'package:challenge_marvel_studio/src/features/home/data/repositories/adapters/movie_adapter.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/entities/errors/i_business_exception.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/i_movie_repository.dart';

class MovieRepository implements IMovieRepository {
  IMovieExternal iMovieExternal;

  MovieRepository({
    required this.iMovieExternal,
  });

  @override
  Future<Either<IBusinessException, List<MovieEntity>>> listAll() async {
    try {
      final list = await iMovieExternal.listAll();

      final movies = list.map(MovieAdapter.fromJson).toList();

      return right(movies);
    } on IBusinessException catch (e) {
      return left(e);
    }
  }
}
