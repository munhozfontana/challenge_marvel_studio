import 'package:challenge_marvel_studio/src/features/home/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final movie = ModalRoute.of(context)?.settings.arguments as MovieEntity;

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * .4,
              child: Hero(
                tag: 'detail ${movie.id}',
                child: Stack(
                  children: [
                    Image.network(
                      movie.thumbnailUrl,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      width: size.width,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(.4),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Stack(
              children: [
                SvgPicture.asset(
                  'images/logo_white.svg',
                  width: size.width * .20,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              movie.titleName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  movie.releaseYearDate.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.hd, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => print('play'),
              icon: const Icon(Icons.play_arrow),
              label: const Text('Assistir'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                fixedSize: Size(size.width, 46),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => print('donwload'),
              icon: const Icon(Icons.download),
              label: const Text('Baixar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                fixedSize: Size(size.width, 46),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              lorem(paragraphs: 1, words: 30),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 50,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.share_rounded,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.download_for_offline_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
