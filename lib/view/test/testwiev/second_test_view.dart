import 'package:flutter/material.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/view/home/view/home.dart';
import 'package:smoking_application/view/information/view/information_view_v2.dart';
import 'package:smoking_application/view/options/view/options_view.dart';

class BottomBatTest extends StatefulWidget {
  const BottomBatTest({Key? key}) : super(key: key);

  @override
  _BottomBatTestState createState() => _BottomBatTestState();
}

class _BottomBatTestState extends State<BottomBatTest> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onDispose: () {},
      onBuilder: scaffold,
      onInitModal: () {},
    );
  }

  Widget scaffold(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: _bottomNavigationItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    InformationsView(),
    OptionsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> get _bottomNavigationItems {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_outlined),
        label: "Notes",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "Settings",
      ),
    ];
  }
}
