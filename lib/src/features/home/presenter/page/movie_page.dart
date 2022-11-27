import 'package:challenge_marvel_studio/src/features/home/presenter/states/movie_state.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/stores/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    BlocProvider.of<MovieCubit>(context).loadAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is LoadedMovieState) {
          return Center(
            child: Text(state.movies.length.toString()),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
