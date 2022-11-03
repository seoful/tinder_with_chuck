import 'package:chuck_norris/data/memory/statistics_local_storage.dart';
import 'package:chuck_norris/state_holders/statistics_state_notifier.dart';
import 'package:riverpod/riverpod.dart';

class StatisticsManager {
  final StatisticsLocalStorage statisticsLocalStorage;
  final StatisticsNotifier statisticsNotifier;

  StatisticsManager(this.statisticsLocalStorage, this.statisticsNotifier);

  void init() {
    statisticsNotifier.setInitialState(statisticsLocalStorage.getMemoryData());
  }

  void like() {
    statisticsLocalStorage.addLiked();
    statisticsNotifier.addLiked();
  }

  void dislike() {
    statisticsLocalStorage.addDisliked();
    statisticsNotifier.addDisiked();
  }

  void markSeen() {
    statisticsLocalStorage.addSeen();
    statisticsNotifier.addSeen();
  }
}

final statisticsManagerProvider = Provider<StatisticsManager>((ref) {
  return StatisticsManager(
    ref.read(statisticsLocalStorageProvider),
    ref.read(statisticsNotifierProvider.notifier),
  );
});
