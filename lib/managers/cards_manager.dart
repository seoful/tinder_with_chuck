import 'package:chuck_norris/domain/joke.dart';
import 'package:chuck_norris/managers/memory_manager.dart';
import 'package:chuck_norris/presentation/notifier/cards_screen_notifier.dart';
import 'package:chuck_norris/repositories/jokes_repository.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardsManager {
  final CardsScreenNotifier notifier;
  final JokesRepository repository;
  final MemoryManager memoryManager;

  static const int _loadingThreshold = 2;

  CardsManager(this.notifier, this.repository, this.memoryManager);

  List<Joke> jokes = [];

  Future<void> init() async {
    await memoryManager.init();
  }

  void start() {
    _goToNextJoke();
  }

  void likeJoke() {
    memoryManager.markSeen();
    memoryManager.like();
    _goToNextJoke();
  }

  void dislikeJoke() {
    memoryManager.markSeen();
    memoryManager.dislike();
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
    final jokesOrNull = await repository.getJokes();
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
    ref.read(memoryManagerProvider),
  );
});
