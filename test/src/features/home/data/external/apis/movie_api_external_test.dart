import 'package:challenge_marvel_studio/src/core/libs_adapters/interfaces/i_http_adapter.dart';
import 'package:challenge_marvel_studio/src/features/home/data/external/apis/movie_api_external.dart';
import 'package:challenge_marvel_studio/src/features/home/domain/entities/errors/i_business_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../fixtures/fixture_reader.dart';

class MockIHttpAdapter extends Mock implements IHttpAdapter {}

void main() {
  late MovieApiExternal sut;
  late MockIHttpAdapter mockIHttpAdapter;

  setUp(() {
    mockIHttpAdapter = MockIHttpAdapter();

    sut = MovieApiExternal(iHttpAdapter: mockIHttpAdapter);
  });

  test('should return all movies from api', () async {
    var jsonResponse = fixture('movies.json');

    when(() => mockIHttpAdapter.getHttp(any()))
        .thenAnswer((invocation) async => HttpResponse(
              body: jsonResponse,
            ));

    var res = await sut.listAll();

    expect(res, hasLength(24));
  });

  test('when any exception should throw ExternalException', () {
    var res = sut.listAll();

    expect(res, throwsA(isA<ExternalException>()));
  });
}
