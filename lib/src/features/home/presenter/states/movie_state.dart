import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';
import 'package:equatable/equatable.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class InitialMovieState extends MovieState {
  @override
  List<Object> get props => [];
}

class LoadingMovieState extends MovieState {
  @override
  List<Object> get props => [];
}

class LoadedMovieState extends MovieState {
  final List<MovieEntity> movies;
  const LoadedMovieState({
    required this.movies,
  });

  @override
  List<Object> get props => [];
}

class ErrorMovieState extends MovieState {
  @override
  List<Object> get props => [];
}
