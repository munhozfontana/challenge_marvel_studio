import 'package:challenge_marvel_studio/src/core/injection.dart';
import 'package:challenge_marvel_studio/src/features/splash/presenter/page/splash_page.dart';
import 'package:flutter/material.dart';

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
      home: const SplashPage(),
      // home: BlocProvider(
      //   create: (_) => MovieCubit(iListAllMoviesCase: inject()),
      //   child: const MoviePage(),
      // ),
    );
  }
}
