// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'memory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemoryModel _$MemoryModelFromJson(Map<String, dynamic> json) {
  return _MemoryModel.fromJson(json);
}

/// @nodoc
mixin _$MemoryModel {
  int get liked => throw _privateConstructorUsedError;
  int get disliked => throw _privateConstructorUsedError;
  int get seen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoryModelCopyWith<MemoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoryModelCopyWith<$Res> {
  factory $MemoryModelCopyWith(
          MemoryModel value, $Res Function(MemoryModel) then) =
      _$MemoryModelCopyWithImpl<$Res>;
  $Res call({int liked, int disliked, int seen});
}

/// @nodoc
class _$MemoryModelCopyWithImpl<$Res> implements $MemoryModelCopyWith<$Res> {
  _$MemoryModelCopyWithImpl(this._value, this._then);

  final MemoryModel _value;
  // ignore: unused_field
  final $Res Function(MemoryModel) _then;

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
abstract class _$$_MemoryModelCopyWith<$Res>
    implements $MemoryModelCopyWith<$Res> {
  factory _$$_MemoryModelCopyWith(
          _$_MemoryModel value, $Res Function(_$_MemoryModel) then) =
      __$$_MemoryModelCopyWithImpl<$Res>;
  @override
  $Res call({int liked, int disliked, int seen});
}

/// @nodoc
class __$$_MemoryModelCopyWithImpl<$Res> extends _$MemoryModelCopyWithImpl<$Res>
    implements _$$_MemoryModelCopyWith<$Res> {
  __$$_MemoryModelCopyWithImpl(
      _$_MemoryModel _value, $Res Function(_$_MemoryModel) _then)
      : super(_value, (v) => _then(v as _$_MemoryModel));

  @override
  _$_MemoryModel get _value => super._value as _$_MemoryModel;

  @override
  $Res call({
    Object? liked = freezed,
    Object? disliked = freezed,
    Object? seen = freezed,
  }) {
    return _then(_$_MemoryModel(
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
class _$_MemoryModel implements _MemoryModel {
  _$_MemoryModel(
      {required this.liked, required this.disliked, required this.seen});

  factory _$_MemoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_MemoryModelFromJson(json);

  @override
  final int liked;
  @override
  final int disliked;
  @override
  final int seen;

  @override
  String toString() {
    return 'MemoryModel(liked: $liked, disliked: $disliked, seen: $seen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemoryModel &&
            const DeepCollectionEquality().equals(other.liked, liked) &&
            const DeepCollectionEquality().equals(other.disliked, disliked) &&
            const DeepCollectionEquality().equals(other.seen, seen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(liked),
      const DeepCollectionEquality().hash(disliked),
      const DeepCollectionEquality().hash(seen));

  @JsonKey(ignore: true)
  @override
  _$$_MemoryModelCopyWith<_$_MemoryModel> get copyWith =>
      __$$_MemoryModelCopyWithImpl<_$_MemoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemoryModelToJson(
      this,
    );
  }
}

abstract class _MemoryModel implements MemoryModel {
  factory _MemoryModel(
      {required final int liked,
      required final int disliked,
      required final int seen}) = _$_MemoryModel;

  factory _MemoryModel.fromJson(Map<String, dynamic> json) =
      _$_MemoryModel.fromJson;

  @override
  int get liked;
  @override
  int get disliked;
  @override
  int get seen;
  @override
  @JsonKey(ignore: true)
  _$$_MemoryModelCopyWith<_$_MemoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
