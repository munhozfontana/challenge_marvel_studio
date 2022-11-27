import 'package:challenge_marvel_studio/src/features/home/presenter/page/widgets/main_title.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/page/widgets/movie_list.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/page/widgets/sub_title.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/states/movie_state.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/stores/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/entities/movie_entity.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final imageDecoration = const BoxDecoration(
    image: DecorationImage(
      image: AssetImage("images/wallpaper.png"),
      fit: BoxFit.fitHeight,
    ),
  );

  final gradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [
        .1,
        1,
      ],
      colors: [
        Colors.black.withOpacity(.05),
        Colors.black,
      ],
    ),
  );

  @override
  void initState() {
    BlocProvider.of<MovieCubit>(context).loadAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'images/logo_white.svg',
          width: size.width * .30,
        ),
      ),
      drawer: const Drawer(),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: imageDecoration,
        child: Container(
          decoration: gradientDecoration,
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state is LoadingMovieState) {
                return whenLoadingMovie();
              }

              if (state is LoadedMovieState) {
                return whenLoadedMovie(state.movies);
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  Shimmer whenLoadingMovie() {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: whenLoadedMovie([
        MovieEntity(
          id: '0',
          releaseYearDate: 0,
          thumbnailUrl: '',
          titleName: '',
        ),
        MovieEntity(
          id: '0',
          releaseYearDate: 0,
          thumbnailUrl: '',
          titleName: '',
        ),
        MovieEntity(
          id: '0',
          releaseYearDate: 0,
          thumbnailUrl: '',
          titleName: '',
        ),
      ]),
    );
  }

  Widget whenLoadedMovie(List<MovieEntity> movies) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsetsDirectional.only(
            start: 24,
            bottom: 24,
          ),
          width: constraints.maxHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 35,
              ),
              Expanded(
                flex: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MainTitle(),
                    const Spacer(),
                    const SubTitle(),
                    const SizedBox(height: 12),
                    MovieList(movies: movies),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
