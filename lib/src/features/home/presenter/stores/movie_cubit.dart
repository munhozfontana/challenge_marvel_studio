import 'package:challenge_marvel_studio/src/features/home/presenter/states/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(InitialMovieState());
}
