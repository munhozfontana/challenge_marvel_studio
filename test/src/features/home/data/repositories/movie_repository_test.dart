import 'dart:convert';

import 'package:challenge_marvel_studio/src/features/home/data/external/interfaces/i_movie_external.dart';
import 'package:challenge_marvel_studio/src/features/home/data/repositories/movie_repository.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/entities/errors/i_business_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixtures/fixture_reader.dart';

class MockIMovieExternal extends Mock implements IMovieExternal {}

void main() {
  late MovieRepository sut;
  late MockIMovieExternal mockIMovieExternal;

  setUp(() {
    mockIMovieExternal = MockIMovieExternal();

    sut = MovieRepository(iMovieExternal: mockIMovieExternal);
  });

  test('should list all movies with no errors', () async {
    var jsonResponse = jsonDecode(fixture('movies.json'))['mcu'];

    when(() => mockIMovieExternal.listAll())
        .thenAnswer((_) async => List<Map<String, dynamic>>.from(jsonResponse));

    var res = await sut.listAll();

    expect(res, isA<Right>());
    expect(res.fold((l) => l, (r) => r), hasLength(24));
  });
  test('should answer error Left with error ', () async {
    when(() => mockIMovieExternal.listAll()).thenThrow(ExternalException());

    var res = await sut.listAll();

    expect(res, isA<Left>());
  });
}
