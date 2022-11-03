// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'statistics_model.freezed.dart';
part 'statistics_model.g.dart';

@HiveType(typeId: 1)
@unfreezed
class StatisticsModel with _$StatisticsModel {
  factory StatisticsModel({
    @HiveField(0) required int liked,
    @HiveField(1) required int disliked,
    @HiveField(2) required int seen,
  }) = _StatisticsModel;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticsModelFromJson(json);
}
