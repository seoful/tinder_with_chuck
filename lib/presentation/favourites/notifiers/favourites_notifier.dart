import 'package:chuck_norris/presentation/favourites/notifiers/favourites_state.dart';
import 'package:riverpod/riverpod.dart';

class FavouritesNotifier extends StateNotifier<FavouritesState> {
  FavouritesNotifier() : super(FavouritesState.empty());

  void setState(FavouritesState state) {
    this.state = state;
  }
}

final favouritesNotifierProvider =
    StateNotifierProvider<FavouritesNotifier, FavouritesState>((ref) {
  return FavouritesNotifier();
});
