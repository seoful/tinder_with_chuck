import 'package:chuck_norris/data/memory/local_storage_constants.dart';
import 'package:chuck_norris/domain/joke.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod/riverpod.dart';

class FavouritesLocalStorage {
  late Box<Joke> box;

  Future<void> init() async {
    box = await Hive.openBox(LocalStorageConstants.fafavouritesBoxName);
  }

  Future<void> add(Joke joke) async {
    if (!box.values.contains(joke)) {
      await box.put(joke.id, joke);
    }
  }

  Future<void> remove(String id) async {
    await box.delete(id);
  }

  List<Joke> get jokes => box.values.toList();
}

final favouritesLocalStorageProvider = Provider<FavouritesLocalStorage>((ref) {
  return FavouritesLocalStorage();
});
