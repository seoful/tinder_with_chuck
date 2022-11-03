import 'package:chuck_norris/data/memory/local_storage_constants.dart';
import 'package:chuck_norris/domain/statistics_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class StatisticsLocalStorage {
  late Box<StatisticsModel> box;

  Future<void> init() async {
    box = await Hive.openBox(LocalStorageConstants.statisticsBoxName);
    if (!box.containsKey(LocalStorageConstants.underscoreKey)) {
      await box.put(
        LocalStorageConstants.underscoreKey,
        StatisticsModel(liked: 0, disliked: 0, seen: 0),
      );
    }
  }

  StatisticsModel getMemoryData() {
    final value = box.get(LocalStorageConstants.underscoreKey)!;
    return value;
  }

  Future<void> addDisliked() async {
    final value = box.values.first;
    await box.put(
      LocalStorageConstants.underscoreKey,
      value.copyWith(disliked: value.disliked + 1),
    );
  }

  Future<void> addLiked() async {
    final value = box.values.first;
    await box.put(
      LocalStorageConstants.underscoreKey,
      value.copyWith(liked: value.liked + 1),
    );
  }

  Future<void> addSeen() async {
    final value = box.values.first;
    await box.put(
      LocalStorageConstants.underscoreKey,
      value.copyWith(seen: value.seen + 1),
    );
  }
}

final statisticsLocalStorageProvider = Provider<StatisticsLocalStorage>((ref) {
  return StatisticsLocalStorage();
});
