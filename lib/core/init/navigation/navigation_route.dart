import 'package:flutter/material.dart';
import 'package:smoking_application/view/home/view/home.dart';
import 'package:smoking_application/view/information/informations_view.dart';
import 'package:smoking_application/view/test/testwiev/second_test_view.dart';

import '../../../view/settings/view/settings.dart';

class NavigationRoutesPathGeneration {
  static Route<dynamic>? onGenerateRoute(RouteSettings controller) {
    final _route = controller.name == "/"
        ? NavigationRoutes.home
        : NavigationRoutes.values.byName(controller.name!);

    // UPDATE WHEN PAGES DONE
    switch (_route) {
      case NavigationRoutes.home:
        return _normalRoute(const HomeView());

      case NavigationRoutes.information:
        List valueList = [controller.arguments];
        return _normalRoute(InformationsView(
          userInfo: valueList,
        ));

      case NavigationRoutes.settingsTest:
        return _normalRoute(TestView2());

      case NavigationRoutes.settings:
        return _normalRoute(const SettingsView());

      case NavigationRoutes.test:
        return _normalRoute(TestView2());
    }
  }

  static Route<dynamic>? _normalRoute(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}

enum NavigationRoutes { home, information, settingsTest, settings, test }
