import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';
import 'package:equatable/equatable.dart';

abstract class MovieState extends Equatable {
  final List<MovieEntity>? movies;

  const MovieState({
    this.movies,
  });
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
  const LoadedMovieState({super.movies});

  @override
  List<Object> get props => [];
}

class ErrorMovieState extends MovieState {
  @override
  List<Object> get props => [];
}
