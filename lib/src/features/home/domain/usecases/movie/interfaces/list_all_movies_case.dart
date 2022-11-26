import 'package:dartz/dartz.dart';
import 'package:desafio_marvel_studio/src/features/home/domain/entities/errors/i_business_exception.dart';
import 'package:desafio_marvel_studio/src/features/home/domain/entities/movie_entity.dart';

import './i_list_all_movies_case.dart';

class ListAllMoviesCase implements IListAllMoviesCase {
  @override
  Future<Either<IBusinessException, List<List<MovieEntity>>>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
