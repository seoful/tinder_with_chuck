import 'package:chuck_norris/data/api/api_constants.dart';
import 'package:chuck_norris/data/api/dio.dart';
import 'package:chuck_norris/domain/joke.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

class Api {
  final Dio _dio;

  Api(this._dio);
  Future<Joke> getJoke({String? category}) async {
    final response = await _dio.get(
      ApiConstants.randomJokeEndpoint,
      queryParameters: {
        if (category != null) ApiConstants.categoryQuery: category,
      },
    );
    final json = response.data;
    return Joke.fromJson(json);
  }

  Future<List<String>> getCategories() async {
    final response = await _dio.get(ApiConstants.categoriesEndpoint);
    final json = response.data;
    return (json as Iterable<dynamic>).map((e) => e as String).toList();
  }
}

final apiProvider = Provider<Api>((ref) {
  return Api(ref.read(dioProvider));
});
