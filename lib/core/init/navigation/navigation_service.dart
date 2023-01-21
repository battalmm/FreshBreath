import 'package:flutter/cupertino.dart';

import 'navigation.dart';
import 'navigation_route.dart';

class NavigationService extends INavigationService {
  NavigationService._();
  static final NavigationService _instance = NavigationService._();
  static NavigationService get instance => _instance;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  get removeAllOldRoutes => (Route<dynamic> route) => false;

  @override
  Future<void> pushNamed({required NavigationRoutes path, Object? args}) async {
    await navigatorKey.currentState?.pushNamed(
      path.name,
      arguments: args,
    );
  }

  @override
  Future<void> pushNamedClear(
      {required NavigationRoutes path, Object? args}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      path.name,
      removeAllOldRoutes,
      arguments: args,
    );
  }

  @override
  void pop() {
    navigatorKey.currentState?.pop();
  }
}
