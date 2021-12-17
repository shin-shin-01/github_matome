import 'dart:async';

import 'package:github_matome/app.dart';
import 'package:flutter/material.dart';
import 'package:github_matome/services_locator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();

  runApp(const ProviderScope(child: App()));
}
