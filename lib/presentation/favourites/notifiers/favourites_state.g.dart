// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Data _$$DataFromJson(Map<String, dynamic> json) => _$Data(
      jokes: (json['jokes'] as List<dynamic>)
          .map((e) => Joke.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DataToJson(_$Data instance) => <String, dynamic>{
      'jokes': instance.jokes,
      'runtimeType': instance.$type,
    };

_$Empty _$$EmptyFromJson(Map<String, dynamic> json) => _$Empty(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$EmptyToJson(_$Empty instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };
