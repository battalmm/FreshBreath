import 'package:flutter/material.dart';
import 'package:smoking_application/view/home/view/home.dart';
import 'package:smoking_application/view/options/view/options_view.dart';
import 'package:smoking_application/view/tabview/tab_view.dart';
import 'package:smoking_application/view/test/testwiev/test_view_copy1.dart';
import '../../../view/information/view/information_view_v2.dart';
import '../../../view/settings/view/settings.dart';

class NavigationRoutesPathGeneration {
  static Route<dynamic>? onGenerateRoute(RouteSettings controller) {
    final _route = controller.name == "/"
        ? NavigationRoutes.home
        : NavigationRoutes.values.byName(controller.name!);

    switch (_route) {
      case NavigationRoutes.home:
        return _normalRoute(const HomeTabView());

      case NavigationRoutes.mainView:
        return _normalRoute(const HomeView());

      case NavigationRoutes.informationView:
        return _normalRoute(const InformationsView());

      case NavigationRoutes.optionsView:
        return _normalRoute(const OptionsView());

      case NavigationRoutes.userInformationView:
        return _normalRoute(const SettingsView());

      case NavigationRoutes.testView:
        return _normalRoute(const TestView1());
    }
  }

  static Route<dynamic>? _normalRoute(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}

enum NavigationRoutes {
  home,
  mainView,
  informationView,
  optionsView,
  userInformationView,
  testView
}
