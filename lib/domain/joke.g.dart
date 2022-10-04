// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Joke _$$_JokeFromJson(Map<String, dynamic> json) => _$_Joke(
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      iconUrl: json['icon_url'] as String,
      updatedAt: json['updated_at'] as String,
      url: json['url'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_JokeToJson(_$_Joke instance) => <String, dynamic>{
      'categories': instance.categories,
      'id': instance.id,
      'created_at': instance.createdAt,
      'icon_url': instance.iconUrl,
      'updated_at': instance.updatedAt,
      'url': instance.url,
      'value': instance.value,
    };
