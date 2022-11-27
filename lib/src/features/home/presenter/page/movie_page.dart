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
  @override
  void initState() {
    BlocProvider.of<MovieCubit>(context).loadAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    const imageDecoration = BoxDecoration(
      image: DecorationImage(
        image: AssetImage("images/wallpaper.png"),
        fit: BoxFit.fitHeight,
      ),
    );

    var gradientDecoration = BoxDecoration(
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
                return Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: whenLoadedMovie([
                    MovieEntity(
                        id: '0',
                        releaseYearDate: 0,
                        thumbnailUrl: '',
                        titleName: ''),
                    MovieEntity(
                        id: '0',
                        releaseYearDate: 0,
                        thumbnailUrl: '',
                        titleName: ''),
                    MovieEntity(
                        id: '0',
                        releaseYearDate: 0,
                        thumbnailUrl: '',
                        titleName: ''),
                  ]),
                );
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

  Widget whenLoadedMovie(List<MovieEntity> movies) {
    return LayoutBuilder(builder: (context, constraints) {
      const title = Text(
        'MARVEL\nCINEMATIC\nUNIVERSE',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 36,
          height: 1.1,
        ),
      );

      const subTitle = Text(
        'LINHA DO TEMPO',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          height: 1.1,
        ),
      );

      var moviesList = SizedBox(
        height: 270,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var movie = movies[index];

            return SizedBox(
              width: constraints.maxWidth * .32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(.5),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(14),
                      ),
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: double.maxFinite,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(14),
                            ),
                            child: movie.thumbnailUrl.isNotEmpty
                                ? Image.network(
                                    movie.thumbnailUrl,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, load) {
                                      if (load == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: load.expectedTotalBytes != null
                                              ? load.cumulativeBytesLoaded /
                                                  load.expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    width: double.maxFinite,
                                    height: double.maxFinite,
                                    color: Colors.grey,
                                  ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(.9, -.9),
                          child: CircleAvatar(
                            maxRadius: 14,
                            backgroundColor: Colors.white.withOpacity(.3),
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    movie.titleName,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '(${movie.releaseYearDate})',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            );
          },
          itemCount: movies.length,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 12,
          ),
        ),
      );

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
                  title,
                  const Spacer(),
                  subTitle,
                  const SizedBox(height: 12),
                  moviesList,
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
