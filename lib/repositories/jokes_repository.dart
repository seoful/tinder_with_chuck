import 'package:chuck_norris/data/api/api.dart';
import 'package:chuck_norris/domain/joke.dart';
import 'package:riverpod/riverpod.dart';

class JokesRepository {
  final Api api;

  JokesRepository(this.api);
  Future<List<Joke>?> getJokes({String? category, int count = 5}) async {
    try {
      return await Future.wait(
        List.generate(count, (index) => api.getJoke(category: category)),
      );
    } catch (e) {
      return null;
    }
  }

  Future<List<String>> getCategories() async {
    try {
      return await api.getCategories();
    } catch (e) {
      return [];
    }
  }
}

final jokesRepositoryProvider = Provider<JokesRepository>((ref) {
  return JokesRepository(ref.read(apiProvider));
});
