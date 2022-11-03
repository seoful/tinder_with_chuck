// ignore_for_file: invalid_annotation_target
import 'package:chuck_norris/domain/joke.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourites_state.freezed.dart';
part 'favourites_state.g.dart';

@freezed
class FavouritesState with _$FavouritesState {
  factory FavouritesState.data({
    required List<Joke> jokes,
  }) = Data;
  factory FavouritesState.empty() = Empty;

  factory FavouritesState.fromJson(Map<String, dynamic> json) =>
      _$FavouritesStateFromJson(json);
}
