import 'package:challenge_marvel_studio/src/features/home/presenter/page/widgets/main_title.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/page/widgets/movie_list.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/page/widgets/sub_title.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/states/movie_state.dart';
import 'package:challenge_marvel_studio/src/features/home/presenter/stores/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
      drawer: Drawer(
        width: 60,
        elevation: 2,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _launchURL('https://github.com/munhozfontana'),
                child: const Icon(
                  Icons.logo_dev_outlined,
                  size: 26,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => _launchURL(
                    'https://www.linkedin.com/in/luis-fernando-munhoz-fontana-neto-652aa88a/'),
                child: const Icon(
                  Icons.link,
                  size: 26,
                ),
              )
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: imageDecoration,
        child: Container(
          decoration: gradientDecoration,
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state is LoadedMovieState) {
                return whenLoadedMovie(state.movies);
              }

              if (state is ErrorMovieState) {
                return Center(
                  child: Text(
                    "Error: ${state.error}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }

              return whenLoadingMovie();
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
                    MovieList(
                      movies: movies,
                      onTap: (movie) => Navigator.pushNamed(
                        context,
                        '/watch',
                        arguments: movie,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
