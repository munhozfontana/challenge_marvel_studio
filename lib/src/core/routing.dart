import 'package:challenge_marvel_studio/src/core/injection.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/page/movie_page.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/stores/movie_cubit.dart';
import 'package:challenge_marvel_studio/src/features/splash/presenter/page/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final routing = {
  '/': (context) => const SplashPage(),
  '/movie': (context) => BlocProvider(
        create: (_) => MovieCubit(iListAllMoviesCase: inject()),
        child: const MoviePage(),
      ),
};
