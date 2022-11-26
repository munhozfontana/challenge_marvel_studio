import 'dart:convert';

import 'package:challenge_marvel_studio/src/core/libs_adapters/interfaces/i_http_adapter.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/entities/errors/i_business_exception.dart';

import '../interfaces/i_movie_external.dart';

class MovieApiExternal implements IMovieExternal {
  final IHttpAdapter iHttpAdapter;

  MovieApiExternal({
    required this.iHttpAdapter,
  });

  @override
  Future<List<Map<String, dynamic>>> listAll() async {
    try {
      final response = await iHttpAdapter.getHttp(
        'https://638191a19842ca8d3c958bbd.mockapi.io/movies',
      );

      return List<Map<String, dynamic>>.from(jsonDecode(response.body!)['mcu']);
    } catch (e, s) {
      throw ExternalException(e.toString(), s);
    }
  }
}
