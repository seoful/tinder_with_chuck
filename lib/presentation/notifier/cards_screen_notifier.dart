import 'package:chuck_norris/domain/joke.dart';
import 'package:chuck_norris/presentation/notifier/cards_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardsScreenNotifier extends StateNotifier<CardsScreenState> {
  CardsScreenNotifier() : super(CardsScreenState.start());

  void updateJoke(Joke joke) {
    state = CardsScreenState.data(joke: joke);
  }

  void setLoading() {
    state = CardsScreenState.loading();
  }

  void setError() {
    state = CardsScreenState.error();
  }
}

final cardsScreenNotifierProvider =
    StateNotifierProvider<CardsScreenNotifier, CardsScreenState>((ref) {
  return CardsScreenNotifier();
});
