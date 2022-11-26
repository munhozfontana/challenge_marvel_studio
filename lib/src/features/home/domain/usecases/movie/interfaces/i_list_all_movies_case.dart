import 'package:dartz/dartz.dart';
import 'package:desafio_marvel_studio/src/features/home/domain/entities/errors/i_business_exception.dart';
import 'package:desafio_marvel_studio/src/features/home/domain/entities/movie_entity.dart';

abstract class IListAllMoviesCase {
  Future<Either<IBusinessException, List<List<MovieEntity>>>> call();
}
