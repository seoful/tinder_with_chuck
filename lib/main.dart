import 'dart:async';
import 'dart:io';

import 'package:chuck_norris/app.dart';
import 'package:chuck_norris/domain/joke.dart';
import 'package:chuck_norris/managers/cards_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Hive.initFlutter();
      Hive.registerAdapter(JokeAdapter());
      final container = ProviderContainer();
      await container.read(cardsManagerProvider).init();
      runApp(
        UncontrolledProviderScope(
          container: container,
          child: const App(),
        ),
      );
    },
    (error, stack) {
      exit(1);
    },
  );
}
