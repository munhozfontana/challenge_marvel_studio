import 'package:challenge_marvel_studio/src/features/home/domain/usecases/movie/interfaces/i_list_all_movies_case.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/states/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCubit extends Cubit<MovieState> {
  final IListAllMoviesCase iListAllMoviesCase;

  MovieCubit({
    required this.iListAllMoviesCase,
  }) : super(InitialMovieState());

  Future<void> loadAllMovies() async {
    emit(LoadingMovieState());

    (await iListAllMoviesCase()).fold(
      (l) => emit(ErrorMovieState()),
      (r) => emit(LoadedMovieState(movies: r)),
    );
  }
}
