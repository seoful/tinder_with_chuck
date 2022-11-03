// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatisticsModel _$StatisticsModelFromJson(Map<String, dynamic> json) {
  return _StatisticsModel.fromJson(json);
}

/// @nodoc
mixin _$StatisticsModel {
  @HiveField(0)
  int get liked => throw _privateConstructorUsedError;
  @HiveField(0)
  set liked(int value) => throw _privateConstructorUsedError;
  @HiveField(1)
  int get disliked => throw _privateConstructorUsedError;
  @HiveField(1)
  set disliked(int value) => throw _privateConstructorUsedError;
  @HiveField(2)
  int get seen => throw _privateConstructorUsedError;
  @HiveField(2)
  set seen(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticsModelCopyWith<StatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsModelCopyWith<$Res> {
  factory $StatisticsModelCopyWith(
          StatisticsModel value, $Res Function(StatisticsModel) then) =
      _$StatisticsModelCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int liked,
      @HiveField(1) int disliked,
      @HiveField(2) int seen});
}

/// @nodoc
class _$StatisticsModelCopyWithImpl<$Res>
    implements $StatisticsModelCopyWith<$Res> {
  _$StatisticsModelCopyWithImpl(this._value, this._then);

  final StatisticsModel _value;
  // ignore: unused_field
  final $Res Function(StatisticsModel) _then;

  @override
  $Res call({
    Object? liked = freezed,
    Object? disliked = freezed,
    Object? seen = freezed,
  }) {
    return _then(_value.copyWith(
      liked: liked == freezed
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as int,
      disliked: disliked == freezed
          ? _value.disliked
          : disliked // ignore: cast_nullable_to_non_nullable
              as int,
      seen: seen == freezed
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_StatisticsModelCopyWith<$Res>
    implements $StatisticsModelCopyWith<$Res> {
  factory _$$_StatisticsModelCopyWith(
          _$_StatisticsModel value, $Res Function(_$_StatisticsModel) then) =
      __$$_StatisticsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int liked,
      @HiveField(1) int disliked,
      @HiveField(2) int seen});
}

/// @nodoc
class __$$_StatisticsModelCopyWithImpl<$Res>
    extends _$StatisticsModelCopyWithImpl<$Res>
    implements _$$_StatisticsModelCopyWith<$Res> {
  __$$_StatisticsModelCopyWithImpl(
      _$_StatisticsModel _value, $Res Function(_$_StatisticsModel) _then)
      : super(_value, (v) => _then(v as _$_StatisticsModel));

  @override
  _$_StatisticsModel get _value => super._value as _$_StatisticsModel;

  @override
  $Res call({
    Object? liked = freezed,
    Object? disliked = freezed,
    Object? seen = freezed,
  }) {
    return _then(_$_StatisticsModel(
      liked: liked == freezed
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as int,
      disliked: disliked == freezed
          ? _value.disliked
          : disliked // ignore: cast_nullable_to_non_nullable
              as int,
      seen: seen == freezed
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatisticsModel implements _StatisticsModel {
  _$_StatisticsModel(
      {@HiveField(0) required this.liked,
      @HiveField(1) required this.disliked,
      @HiveField(2) required this.seen});

  factory _$_StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$$_StatisticsModelFromJson(json);

  @override
  @HiveField(0)
  int liked;
  @override
  @HiveField(1)
  int disliked;
  @override
  @HiveField(2)
  int seen;

  @override
  String toString() {
    return 'StatisticsModel(liked: $liked, disliked: $disliked, seen: $seen)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_StatisticsModelCopyWith<_$_StatisticsModel> get copyWith =>
      __$$_StatisticsModelCopyWithImpl<_$_StatisticsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatisticsModelToJson(
      this,
    );
  }
}

abstract class _StatisticsModel implements StatisticsModel {
  factory _StatisticsModel(
      {@HiveField(0) required int liked,
      @HiveField(1) required int disliked,
      @HiveField(2) required int seen}) = _$_StatisticsModel;

  factory _StatisticsModel.fromJson(Map<String, dynamic> json) =
      _$_StatisticsModel.fromJson;

  @override
  @HiveField(0)
  int get liked;
  @HiveField(0)
  set liked(int value);
  @override
  @HiveField(1)
  int get disliked;
  @HiveField(1)
  set disliked(int value);
  @override
  @HiveField(2)
  int get seen;
  @HiveField(2)
  set seen(int value);
  @override
  @JsonKey(ignore: true)
  _$$_StatisticsModelCopyWith<_$_StatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
