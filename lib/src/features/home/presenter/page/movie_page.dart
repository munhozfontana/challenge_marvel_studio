import 'package:challenge_marvel_studio/src/features/home/presenter/states/movie_state.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/stores/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text(''),
        ),
      ),
    );
  }
}
