import 'package:chuck_norris/data/memory/memory.dart';
import 'package:chuck_norris/domain/memory_model.dart';
import 'package:riverpod/riverpod.dart';

class MemoryManager {
  final Memory memory;

  late MemoryModel memoryData;

  MemoryManager(this.memory);

  Future<void> init() async {
    await memory.init();
    memoryData = memory.getMemoryData();
  }

  void like() {
    memoryData = memoryData.copyWith(liked: memoryData.liked + 1);
    memory.addLiked();
  }

  void dislike() {
    memoryData = memoryData.copyWith(disliked: memoryData.disliked + 1);
    memory.addDisliked();
  }

  void markSeen() {
    memoryData = memoryData.copyWith(seen: memoryData.seen + 1);
    memory.addSeen();
  }
}

final memoryManagerProvider = Provider<MemoryManager>((ref) {
  return MemoryManager(ref.read(memoryProvider));
});
