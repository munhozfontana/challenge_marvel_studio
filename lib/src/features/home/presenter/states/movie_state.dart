import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';
import 'package:equatable/equatable.dart';

abstract class MovieState extends Equatable {}

class InitialMovieState extends MovieState {
  @override
  List<Object> get props => [];
}

class LoadingMovieState extends MovieState {
  @override
  List<Object> get props => [];
}

class LoadedMovieState extends MovieState {
  LoadedMovieState(this.movies);

  final List<MovieEntity> movies;

  @override
  List<Object> get props => [movies];
}

class ErrorMovieState extends MovieState {
  @override
  List<Object> get props => [];
}
