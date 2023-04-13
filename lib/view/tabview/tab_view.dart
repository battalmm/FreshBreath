import 'package:flutter/material.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/core/extensions/context_extension.dart';
import 'package:smoking_application/view/options/view/options_view.dart';
import 'package:smoking_application/view/test/test_modal_view/testmw.dart';
import '../home/view/home.dart';
import '../information/view/information_view_v2.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _TestViewState();
}

class _TestViewState extends State<HomeTabView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return BaseView<TestModalWiev>(
      onInitModal: () {
        _tabController =
            TabController(length: _TabViews.values.length, vsync: this);
      },
      onDispose: () {
        _tabController.dispose();
      },
      onBuilder: scaffoldBody,
    );
  }

  Widget scaffoldBody(BuildContext context) {
    return DefaultTabController(
      length: _TabViews.values.length,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: _tabView(),
          color: Theme.of(context).colorScheme.background,
        ),
        body: _tabBarView(),
      ),
    );
  }

  TabBar _tabView() {
    return TabBar(
        onTap: (int index) {},
        splashBorderRadius:
            BorderRadius.circular(context.mediumCircularBorderRadius),
        splashFactory: NoSplash.splashFactory,
        controller: _tabController,
        indicatorColor: Colors.transparent,
        labelColor: Theme.of(context).colorScheme.primary,
        unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
        tabs: _bottomTabs());
  }

  TabBarView _tabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [
        HomeView(),
        InformationsView(),
        OptionsView(),
      ],
    );
  }

  List<Tab> _bottomTabs() {
    return const [
      Tab(icon: Icon(Icons.home)),
      Tab(icon: Icon(Icons.assignment_outlined)),
      Tab(icon: Icon(Icons.settings))
    ];
  }
}

enum _TabViews { home, info, settings }
