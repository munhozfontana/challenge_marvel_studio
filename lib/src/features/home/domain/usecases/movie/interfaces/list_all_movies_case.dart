import 'package:challenge_marvel_studio/src/features/home/domain/entities/errors/i_business_exception.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';

import './i_list_all_movies_case.dart';
import '../../../repositories/i_movie_repository.dart';

class ListAllMoviesCase implements IListAllMoviesCase {
  final IMovieRepository iMovieRepository;

  ListAllMoviesCase({
    required this.iMovieRepository,
  });

  @override
  Future<Either<IBusinessException, List<MovieEntity>>> call() {
    return iMovieRepository.listAll();
  }
}
