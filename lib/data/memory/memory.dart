import 'package:chuck_norris/domain/memory_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Memory {
  static const String likedKey = 'liked';
  static const String dislikedKey = 'disliked';
  static const String seenKey = 'seen';

  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  MemoryModel getMemoryData() {
    return MemoryModel(
      liked: prefs.getInt(likedKey) ?? 0,
      disliked: prefs.getInt(dislikedKey) ?? 0,
      seen: prefs.getInt(seenKey) ?? 0,
    );
  }

  Future<void> addDisliked() async {
    await prefs.setInt(dislikedKey, (prefs.getInt(dislikedKey) ?? 0) + 1);
  }

  Future<void> addLiked() async {
    await prefs.setInt(likedKey, (prefs.getInt(likedKey) ?? 0) + 1);
  }

  Future<void> addSeen() async {
    await prefs.setInt(seenKey, (prefs.getInt(seenKey) ?? 0) + 1);
  }
}

final memoryProvider = Provider<Memory>((ref) {
  return Memory();
});
