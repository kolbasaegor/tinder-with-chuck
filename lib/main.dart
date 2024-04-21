import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tinder_with_chuck/app.dart';
import 'package:tinder_with_chuck/models/joke.dart';
import 'package:tinder_with_chuck/repositories/joke_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'firebase_options.dart';

const jokeBoxName = 'joke_box';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await Hive.initFlutter();
  Hive.registerAdapter(JokeAdapter());

  final dio = Dio();
  final jokeBox = await Hive.openBox<Joke>(jokeBoxName);

  GetIt.I
      .registerLazySingleton(() => JokeRepository(dio: dio, jokeBox: jokeBox));

  runApp(const TinderWithChuckApp());
}
