import 'dart:async';

import 'package:github_summary/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:github_summary/services_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: String.fromEnvironment("API_KEY"),
      authDomain: String.fromEnvironment("AUTH_DOMAIN"),
      projectId: String.fromEnvironment("PROJECT_ID"),
      storageBucket: String.fromEnvironment("STORAGE_BUCKET"),
      messagingSenderId: String.fromEnvironment("MESSAGING_SENDER_ID"),
      appId: String.fromEnvironment("APP_ID"),
      measurementId: String.fromEnvironment("MEASUREMENT_ID"),
    ),
  );
  await setupServiceLocator();

  runApp(const ProviderScope(child: App()));
}
