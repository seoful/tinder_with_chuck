import 'package:chuck_norris/domain/joke.dart';
import 'package:chuck_norris/managers/favourites_manager.dart';
import 'package:chuck_norris/managers/statistics_manager.dart';
import 'package:chuck_norris/presentation/main_screen/notifier/cards_screen_notifier.dart';
import 'package:chuck_norris/repositories/jokes_repository.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardsManager {
  final CardsScreenNotifier notifier;
  final JokesRepository repository;
  final StatisticsManager statisticsManager;
  final FavouritesManager favouritesManager;
  static const int _loadingThreshold = 2;

  CardsManager(
    this.notifier,
    this.repository,
    this.statisticsManager,
    this.favouritesManager,
  );

  List<Joke> jokes = [];

  String? currentCategory;

  late List<String> categories;

  Future<void> start() async {
    notifier.setLoading();
    favouritesManager.init();
    final categoriesFromApi = await repository.getCategories();
    if (categoriesFromApi.isEmpty) {
      notifier.setError();
      return;
    }
    categories = categoriesFromApi;
    _goToNextJoke();
  }

  void setCategory(String? category) {
    currentCategory = category;
    jokes = [];
    _goToNextJoke();
  }

  void likeJoke() {
    statisticsManager.markSeen();
    statisticsManager.like();
    _goToNextJoke();
  }

  void dislikeJoke() {
    statisticsManager.markSeen();
    statisticsManager.dislike();
    _goToNextJoke();
  }

  Future<void> _goToNextJoke() async {
    if (jokes.isNotEmpty) {
      jokes.removeAt(0);
      notifier.updateJoke(jokes.first);
      if (jokes.length <= _loadingThreshold) {
        _loadJokes();
      }
    } else {
      notifier.setLoading();
      if (await _loadJokes(
        onError: () => notifier.setError(),
      )) _goToNextJoke();
    }
  }

  Future<bool> _loadJokes({VoidCallback? onError}) async {
    final jokesOrNull = await repository.getJokes(category: currentCategory);
    if (jokesOrNull != null) {
      jokes.addAll(jokesOrNull);
    } else {
      onError?.call();
    }
    return jokesOrNull != null;
  }
}

final cardsManagerProvider = Provider<CardsManager>((ref) {
  return CardsManager(
    ref.read(cardsScreenNotifierProvider.notifier),
    ref.read(jokesRepositoryProvider),
    ref.read(statisticsManagerProvider),
    ref.read(favouritesManagerProvider),
  );
});
