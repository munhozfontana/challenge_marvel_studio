import 'package:challenge_marvel_studio/src/core/injection.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/page/movie_page.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/stores/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => MovieCubit(iListAllMoviesCase: inject()),
        child: const MoviePage(),
      ),
    );
  }
}
