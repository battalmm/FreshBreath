import 'navigation_route.dart';

abstract class INavigationService {
  Future<void> pushNamed({required NavigationRoutes path, Object? args});
  Future<void> pushNamedClear({required NavigationRoutes path, Object? args});
  Future<void> pushtest({required NavigationRoutes path, Object? args});
  void pop();
}
