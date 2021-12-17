import 'dart:async';

import 'package:github_matome/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_matome/services_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kReleaseMode) {
    debugPrint = (message, {wrapWidth}) {};
  }

  await setupServiceLocator();

  runZonedGuarded(() {
    runApp(const ProviderScope(child: App()));
  }, (error, stackTrace) {});
}
