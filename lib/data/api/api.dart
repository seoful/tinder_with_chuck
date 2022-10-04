import 'package:chuck_norris/data/api/api_constants.dart';
import 'package:chuck_norris/data/api/dio.dart';
import 'package:chuck_norris/domain/joke.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

class Api {
  final Dio _dio;

  Api(this._dio);
  Future<Joke> getJoke() async {
    final response = await _dio.get(ApiConstants.randomEndpoint);
    final json = response.data;
    return Joke.fromJson(json);
  }
}

final apiProvider = Provider<Api>((ref) {
  return Api(ref.read(dioProvider));
});
