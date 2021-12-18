import 'package:get_it/get_it.dart';
import 'package:github_summary/services/authentication.dart';
import 'package:github_summary/services/navigation.dart';

/// servicesLocator
GetIt servicesLocator = GetIt.instance;

/// setupServiceLocator
/// - register instance (single) of every services
/// that are going to be used in the app
Future<void> setupServiceLocator() async {
  servicesLocator.registerSingleton(NavigationService());
  servicesLocator.registerSingleton(AuthService());
}
