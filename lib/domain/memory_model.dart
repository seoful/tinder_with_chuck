// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'memory_model.freezed.dart';
part 'memory_model.g.dart';

@freezed
class MemoryModel with _$MemoryModel {
  factory MemoryModel({
    required int liked,
    required int disliked,
    required int seen,
  }) = _MemoryModel;

  factory MemoryModel.fromJson(Map<String, dynamic> json) =>
      _$MemoryModelFromJson(json);
}
