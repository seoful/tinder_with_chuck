// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatisticsModelAdapter extends TypeAdapter<StatisticsModel> {
  @override
  final int typeId = 1;

  @override
  StatisticsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatisticsModel(
      liked: fields[0] as int,
      disliked: fields[1] as int,
      seen: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StatisticsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.liked)
      ..writeByte(1)
      ..write(obj.disliked)
      ..writeByte(2)
      ..write(obj.seen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatisticsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StatisticsModel _$$_StatisticsModelFromJson(Map<String, dynamic> json) =>
    _$_StatisticsModel(
      liked: json['liked'] as int,
      disliked: json['disliked'] as int,
      seen: json['seen'] as int,
    );

Map<String, dynamic> _$$_StatisticsModelToJson(_$_StatisticsModel instance) =>
    <String, dynamic>{
      'liked': instance.liked,
      'disliked': instance.disliked,
      'seen': instance.seen,
    };
