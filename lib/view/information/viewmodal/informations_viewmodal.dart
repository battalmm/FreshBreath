import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:smoking_application/core/extensions/string_extension.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../core/init/cache/shared_keys.dart';
import '../../../core/init/language/locale_keys.g.dart';

part 'informations_viewmodal.g.dart';

class InformationsViewModal = _InformationsViewModalBase
    with _$InformationsViewModal;

abstract class _InformationsViewModalBase with Store {
  void init() {
    userInfo = calculateTimeDifference();
  }

  @observable
  Map<String, String> timeAndHealthInfos = {
    LocaleKeys.Informations_times_twentyMinutes.translate:
        LocaleKeys.Informations_infosRelatedTimes_twentyMinutesBrief.translate,
    LocaleKeys.Informations_times_eightHours.translate:
        LocaleKeys.Informations_infosRelatedTimes_eightHoursBrief.translate,
    LocaleKeys.Informations_times_twelveHours.translate:
        LocaleKeys.Informations_infosRelatedTimes_twelveHoursBrief.translate,
    LocaleKeys.Informations_times_twentyFourHours.translate: LocaleKeys
        .Informations_infosRelatedTimes_twentyFourHoursBrief.translate,
    LocaleKeys.Informations_times_fourtyEightHours.translate: LocaleKeys
        .Informations_infosRelatedTimes_fourtyEightHoursBrief.translate,
    LocaleKeys.Informations_times_threeDays.translate:
        LocaleKeys.Informations_infosRelatedTimes_threeDaysBrief.translate,
    LocaleKeys.Informations_times_threeMonths.translate:
        LocaleKeys.Informations_infosRelatedTimes_threeMonthsBrief.translate,
    LocaleKeys.Informations_times_sixMonths.translate:
        LocaleKeys.Informations_infosRelatedTimes_sixMonthsBrief.translate,
    LocaleKeys.Informations_times_oneYear.translate:
        LocaleKeys.Informations_infosRelatedTimes_oneYearBrief.translate,
    LocaleKeys.Informations_times_fiveYear.translate:
        LocaleKeys.Informations_infosRelatedTimes_fiveYearBrief.translate,
    LocaleKeys.Informations_times_tenYear.translate:
        LocaleKeys.Informations_infosRelatedTimes_tenYearBrief.translate,
    LocaleKeys.Informations_times_fifteenYear.translate:
        LocaleKeys.Informations_infosRelatedTimes_fifteenYearBrief.translate,
  };

  List<int>? userInfo;

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

    // ignore: unnecessary_null_comparison
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
}
