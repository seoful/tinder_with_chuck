// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chuck_norris/data/memory/favourites_local_storage.dart';
import 'package:chuck_norris/domain/joke.dart';
import 'package:chuck_norris/presentation/favourites/notifiers/favourites_notifier.dart';
import 'package:chuck_norris/presentation/favourites/notifiers/favourites_state.dart';
import 'package:riverpod/riverpod.dart';

class FavouritesManager {
  final FavouritesLocalStorage favouritesLocalStorage;
  final FavouritesNotifier favouritesNotifier;
  FavouritesManager(
    this.favouritesNotifier, {
    required this.favouritesLocalStorage,
  });

  void init() {
    final jokes = favouritesLocalStorage.jokes;
    favouritesNotifier.setState(FavouritesState.data(jokes: jokes));
  }

  void addToFavourites(Joke joke) {
    final jokes = favouritesLocalStorage.jokes;
    jokes.add(joke);
    favouritesNotifier.setState(FavouritesState.data(jokes: jokes));
    favouritesLocalStorage.add(joke);
  }

  void removeFromFavourites(String id) {
    if (favouritesLocalStorage.box.containsKey(id)) {
      if (favouritesLocalStorage.jokes.length == 1) {
        favouritesNotifier.setState(FavouritesState.empty());
      } else {
        final jokes = favouritesLocalStorage.jokes;
        jokes.removeWhere(
          (element) => element.id == id,
        );
        favouritesNotifier.setState(FavouritesState.data(jokes: jokes));
      }
      favouritesLocalStorage.remove(id);
    }
  }

  List<Joke> getJokes() {
    return favouritesLocalStorage.jokes;
  }
}

final favouritesManagerProvider = Provider<FavouritesManager>((ref) {
  return FavouritesManager(
    favouritesLocalStorage: ref.read(favouritesLocalStorageProvider),
    ref.read(favouritesNotifierProvider.notifier),
  );
});
