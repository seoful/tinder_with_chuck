// ignore_for_file: invalid_annotation_target
import 'package:chuck_norris/domain/joke.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cards_screen_state.freezed.dart';

@freezed
class CardsScreenState with _$CardsScreenState {
  factory CardsScreenState.start() = Empty;
  factory CardsScreenState.data({
    required Joke joke,
  }) = Data;
  factory CardsScreenState.error() = Error;
  factory CardsScreenState.loading() = Loading;
}
