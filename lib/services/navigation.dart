import 'package:flutter/material.dart';
import 'package:github_summary/ui/home/home_view.dart';

/// Navigator を UI から取り出して、
/// 他の関数の中から使えるようにする
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// context を navigatorKey から取得
  BuildContext? get currentContext => navigatorKey.currentContext;

  NavigatorState? get currentState => navigatorKey.currentState;

  Future<dynamic> pushNamed({required String routeName, dynamic args}) {
    return currentState!.pushNamed(routeName, arguments: args);
  }

  Future<dynamic> pushReplacementNamed(
      {required String routeName, dynamic args}) {
    return currentState!.pushReplacementNamed(routeName, arguments: args);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
      {required String routeName, dynamic args}) {
    return currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: args);
  }

  void pop([Object? value]) => currentState!.pop(value);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// ホーム画面
      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => const HomeView());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('404: NotFound'),
            ),
          ),
        );
    }
  }
}
