// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'joke.freezed.dart';
part 'joke.g.dart';

@HiveType(typeId: 0)
@freezed
class Joke with _$Joke {
  factory Joke({
    @HiveField(0) @Default([]) List<String> categories,
    @HiveField(1) required String id,
    @HiveField(2) @JsonKey(name: "created_at") required String createdAt,
    @HiveField(3) @JsonKey(name: "icon_url") required String iconUrl,
    @HiveField(4) @JsonKey(name: "updated_at") required String updatedAt,
    @HiveField(5) required String url,
    @HiveField(6) required String value,
  }) = _Joke;

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);
}
