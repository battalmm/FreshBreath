import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/core/extensions/string_extension.dart';
import 'package:smoking_application/core/init/cache/cache_manager.dart';
import '../../../core/base/state/base_state.dart';
import '../../../core/init/cache/shared_keys.dart';
import '../../../core/init/language/locale_keys.g.dart';

class InformationsViewTest extends StatefulWidget {
  const InformationsViewTest({Key? key}) : super(key: key);

  @override
  State<InformationsViewTest> createState() => _InformationsViewTestState();
}

class _InformationsViewTestState extends BaseState<InformationsViewTest> {
  late List<int>? userInfo;

  DateTime initializePickedTime() {
    DateTime? pickedTime;
    final date = CacheManager.instance.getStringValue(SharedKeys.pickedTime);
    if (date != null) {
      pickedTime = DateTime.parse(date.toString());
    } else {
      pickedTime = DateTime.now();
    }
    return pickedTime;
  }

  List<int> calculateTimeDifference() {
    Duration? _timeDifference;
    DateTime? _pickedTime;
    DateTime? _currentTime;
    _currentTime = DateTime.now();
    _pickedTime = initializePickedTime();

    _timeDifference = _pickedTime != null
        ? _currentTime.difference(_pickedTime)
        : const Duration();

    List<int> timeDifferenceList = [
      _timeDifference.inMinutes,
      _timeDifference.inHours,
      _timeDifference.inDays
    ];
    debugPrint(_timeDifference.toString());
    return timeDifferenceList;
  }

  // UPDATE WİTH LOCALS
  Map<String, String> timeAndHealthInfos = {
    LocaleKeys.home_minuteOneChar.translate: "WillChange",
    "8 hours ": "WillChange",
    "12 hours ": "WillChange",
    "24 hours ": "WillChange",
    "48 hours ": "WillChange",
    "3 days ": "WillChange",
    "3 months ": "WillChange",
    "6 months ": "WillChange",
    "1 year ": "WillChange",
    "5 years ": "WillChange",
    "10 years ": "WillChange",
    "15 years ": "WillChange",
  };

  List<double> timeTarget = [
    20, // minute
    8, // hours
    12, // hours
    24, // hours
    48, // hours
    3, // days
    30 * 3, // days*months
    30 * 6, // days*months
    30 * 12 + 5, // days*months+5
    (30 * 12 + 5) * 5, // days*months*years
    (30 * 12 + 5) * 10, // days*months*years
    (30 * 12 + 5) * 15, // days*months*years
  ];

  double timeCalculation(int index) {
    double minute = userInfo?[0].toDouble() ?? 0;
    double hour = userInfo?[1].toDouble() ?? 0;
    double day = userInfo?[2].toDouble() ?? 0;
    double target = timeTarget[index];
    double value = 0;

    if (index == 0) {
      if (hour > 0 || day > 0) {
        value = 1;
      } else {
        value = (minute / target) >= 1 ? 1 : (minute / target);
      }
    } else if (index > 0 && index < 5) {
      if (day > 0) {
        value = 1;
      } else {
        value = (hour / target) >= 1 ? 1 : (hour / target);
      }
    } else if (index == 5) {
      value = (day / target) >= 1 ? 1 : (day / target);
    } else if (index > 5 && index < 8) {
      value = (day / target) < 1.0 ? (day / target) : 1.0;
    } else {
      value = (day / target) >= 1 ? 1 : (day / target);
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onBuilder: _scaffoldBody,
      onInitModal: () {
        userInfo = calculateTimeDifference();
      },
      onDispose: () {},
    );
  }

  Widget _scaffoldBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: Text("Info"),
        centerTitle: true,
      ),
      body: _listViewBuilder(),
    );
  }

  ListView _listViewBuilder() {
    return ListView.builder(
      itemCount: timeAndHealthInfos.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: Card(
            child: ListTile(
              onTap: (() {
                //SHOW POPUP
                debugPrint(userInfo?[0].toString());
                debugPrint(index.toString());
              }),
              leading: _circlePercentIndicator(index, context),
              subtitle: Text(timeAndHealthInfos.values.elementAt(index)),
              title: Text(timeAndHealthInfos.keys.elementAt(index)),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
          ),
        );
      },
    );
  }

  CircularPercentIndicator _circlePercentIndicator(
    int index,
    BuildContext context,
  ) {
    return CircularPercentIndicator(
      curve: Curves.easeOut,
      animationDuration: 2000,
      animation: true,
      radius: 24.0,
      lineWidth: 5,
      percent: timeCalculation(index),
      progressColor: Theme.of(context).colorScheme.primary,
      center: Text("${(timeCalculation(index) * 100).toStringAsFixed(0)}%"),
    );
  }
}
