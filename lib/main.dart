import 'dart:async';

import 'package:chuck_norris/app.dart';
import 'package:chuck_norris/data/memory/favourites_local_storage.dart';
import 'package:chuck_norris/data/memory/statistics_local_storage.dart';
import 'package:chuck_norris/domain/joke.dart';
import 'package:chuck_norris/domain/statistics_model.dart';
import 'package:chuck_norris/error_handler.dart';
import 'package:chuck_norris/firebase_options.dart';
import 'package:chuck_norris/managers/statistics_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final container = ProviderContainer();

      await initHive(container);

      container.read(statisticsManagerProvider).init();

      runApp(
        UncontrolledProviderScope(
          container: container,
          child: const App(),
        ),
      );
    },
    ErrorHandler.recordError,
  );
}

Future<void> initHive(ProviderContainer container) async {
  await Hive.initFlutter();
  Hive.registerAdapter(JokeAdapter());
  Hive.registerAdapter(StatisticsModelAdapter());
  await container.read(statisticsLocalStorageProvider).init();
  await container.read(favouritesLocalStorageProvider).init();
}
