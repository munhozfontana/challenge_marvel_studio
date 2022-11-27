import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieList({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 270,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var movie = movies[index];

          return SizedBox(
            width: size.width * .32,
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
                Visibility(
                  visible: movie.titleName.isNotEmpty,
                  child: Text(
                    movie.titleName,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Visibility(
                  visible: movie.releaseYearDate != 0,
                  child: Text(
                    '(${movie.releaseYearDate})',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
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
  }
}
