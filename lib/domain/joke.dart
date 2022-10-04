// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'joke.freezed.dart';
part 'joke.g.dart';

@freezed
class Joke with _$Joke {
  factory Joke({
    @Default([]) List<String> categories,
    required String id,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "icon_url") required String iconUrl,
    @JsonKey(name: "updated_at") required String updatedAt,
    required String url,
    required String value,
  }) = _Joke;

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);
}
