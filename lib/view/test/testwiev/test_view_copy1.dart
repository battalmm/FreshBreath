// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/view/options/view/options_view.dart';
import 'package:smoking_application/view/test/test_modal_view/testmw.dart';
import 'package:smoking_application/view/test/testwiev/second_test_view.dart';

import '../../home/view/home.dart';
import '../../settings/view/settings.dart';

class TestView1 extends StatefulWidget {
  const TestView1({Key? key}) : super(key: key);

  @override
  State<TestView1> createState() => _TestViewState();
}

class _TestViewState extends State<TestView1> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return BaseView<TestModalWiev>(
      onInitModal: () {
        _tabController =
            TabController(length: _TabViews.values.length, vsync: this);
      },
      onBuilder: scaffoldBody,
    );
  }

  Widget scaffoldBody(BuildContext context) {
    return DefaultTabController(
      length: _TabViews.values.length,
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomAppBar(child: _tabView()),
        body: _tabBarView(),
      ),
    );
  }

  TabBar _tabView() {
    return TabBar(
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        controller: _tabController,
        tabs: _TabViews.values.map((e) => Tab(text: e.name)).toList());
  }

  TabBarView _tabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [
        OptionsView(),
        TestView2(),
        SettingsView(),
      ],
    );
  }
}

enum _TabViews { home, info, settings }
