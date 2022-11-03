import 'package:chuck_norris/domain/statistics_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsNotifier extends StateNotifier<StatisticsModel> {
  StatisticsNotifier()
      : super(
          StatisticsModel(
            liked: 0,
            disliked: 0,
            seen: 0,
          ),
        );

  void setInitialState(StatisticsModel state) {
    this.state = state;
  }

  void addLiked() {
    state = state.copyWith(liked: state.liked + 1);
  }

  void addDisiked() {
    state = state.copyWith(disliked: state.disliked + 1);
  }

  void addSeen() {
    state = state.copyWith(seen: state.seen + 1);
  }
}

final statisticsNotifierProvider =
    StateNotifierProvider<StatisticsNotifier, StatisticsModel>((ref) {
  return StatisticsNotifier();
});
