import 'package:challenge_marvel_studio/src/core/libs_adapters/http_adapter.dart';
import 'package:challenge_marvel_studio/src/core/libs_adapters/interfaces/i_http_adapter.dart';
import 'package:challenge_marvel_studio/src/features/home/data/external/apis/movie_api_external.dart';
import 'package:challenge_marvel_studio/src/features/home/data/external/interfaces/i_movie_external.dart';
import 'package:challenge_marvel_studio/src/features/home/data/repositories/movie_repository.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/repositories/i_movie_repository.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/usecases/movie/interfaces/i_list_all_movies_case.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/usecases/movie/list_all_movies_case.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.instance;

setup() {
  inject.registerLazySingleton<IHttpAdapter>(
    () => HttpAdapter(),
  );

  inject.registerLazySingleton<IMovieExternal>(
    () => MovieApiExternal(
      iHttpAdapter: inject(),
    ),
  );

  inject.registerLazySingleton<IMovieRepository>(
    () => MovieRepository(
      iMovieExternal: inject(),
    ),
  );

  inject.registerLazySingleton<IListAllMoviesCase>(
    () => ListAllMoviesCase(
      iMovieRepository: inject(),
    ),
  );
}
