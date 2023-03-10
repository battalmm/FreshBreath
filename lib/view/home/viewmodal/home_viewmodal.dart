import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:smoking_application/core/base/base_wiev_modal/base_view_modal.dart';
import 'package:smoking_application/core/init/cache/cache_manager.dart';
import 'package:smoking_application/core/init/cache/shared_keys.dart';
import 'package:smoking_application/view/home/modal/user_modal.dart';
part 'home_viewmodal.g.dart';

class HomeViewModal = _HomeViewModalBase with _$HomeViewModal;

abstract class _HomeViewModalBase with Store, BaseViewModel {
  @override
  void init() {
    _calculateTime();
  }

  void dispose() {
    _calculateTime();
  }

  @observable
  DateTime? pickedTime;

  @observable
  Duration? timeDifference;

  @observable
  UserModal? user;

  @observable
  int? hourlySmokedCigaratte;

  @observable
  DateTime? _currentTime;

  @observable
  List? timeDifferenceList;

  @action
  String hourlySmokedCigaratteCalcullation(int hour) {
    int dailySmokingCigaratte =
        CacheManager.instance.getIntValue(SharedKeys.dailySmoked) ?? 0;
    //debugPrint("dailySmokingCigaratte " + dailySmokingCigaratte.toString());
    int passedTimeByHours = hour;

    hourlySmokedCigaratte =
        ((dailySmokingCigaratte / 24) * passedTimeByHours).toInt();

    //cache kaydet

    return hourlySmokedCigaratte.toString();

    // req Günlük içilen sigara miktarı
    // req geçen saat
    //
    // (günlük içilen sigara miktarı / 24) * geçen saat = saate göre içilen sigara miktarı
  }

  @action
  String moneyCalculation(int? hourlySmokedCigaratte) {
    int cigaratteInOnePackage =
        CacheManager.instance.getIntValue(SharedKeys.countPackage) ?? 0;
    //debugPrint("cigaratteInOnePackage  " + cigaratteInOnePackage.toString());

    int moneyOfOnePackage =
        CacheManager.instance.getIntValue(SharedKeys.pricePackage) ?? 1;
    //debugPrint("moneyOfOnePackage  " + moneyOfOnePackage.toString());

    double perStockPrice = cigaratteInOnePackage /
        (moneyOfOnePackage == 0 ? 1 : moneyOfOnePackage);

    double totalMoney = ((hourlySmokedCigaratte ?? 0) * perStockPrice);
    //debugPrint("hourlySmokedCigaratte  " + hourlySmokedCigaratte.toString());
    //cache kaydet

    return totalMoney.toStringAsFixed(2);

    // req Paketin miktarı
    // req Paketin fiyatı
    // içilmeyen sigara
    //
    // paketin fiyatı / Paketin miktarı = bir dal sigara fiyatı
    // içilmeyen sigara * bir dal sigara fiyatı = toplma kazanç
  }

  @action
  String savedTimeCalculation(
    int? hourlySmokedCigaratte, {
    String minutesLanguage = "",
    String hoursLanguage = "",
  }) {
    int smokingTime =
        CacheManager.instance.getIntValue(SharedKeys.smokingTime) ?? 1;
    //debugPrint("smokingTime  " + smokingTime.toString());

    int savedTime = (smokingTime * (hourlySmokedCigaratte ?? 0)).toInt();

    double hour = savedTime / 60;

    return savedTime >= 1000
        ? hour.toStringAsFixed(1) + hoursLanguage
        : savedTime.toStringAsFixed(1) + minutesLanguage;
  }

  @action
  void _calculateTime() {
    _initializeUser();
    _initializePickedTime();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentTime = DateTime.now();

      timeDifference = pickedTime != null
          ? _currentTime?.difference(pickedTime!)
          : const Duration();

      int? years = (timeDifference!.inDays ~/ 365);
      int? months = (timeDifference!.inDays ~/ 30) % 12;
      int? weeks = (timeDifference!.inDays ~/ 7) % 4;
      int? days = timeDifference!.inDays % 7;
      int? hours = timeDifference!.inHours % 24;
      int? minutes = timeDifference!.inMinutes % 60;
      int? seconds = timeDifference!.inSeconds % 60;

      user = user!.copyWith(
        pickedTimes: pickedTime,
        years: years,
        months: months,
        weeks: weeks,
        days: days,
        hours: hours,
        minutes: minutes,
        seconds: seconds,
      );

      timeDifferenceList = [
        timeDifference?.inMinutes ?? 0,
        timeDifference?.inHours ?? 0,
        timeDifference?.inDays ?? 0
      ];

      // SİLİNECEK
      debugPrint(user.toString());
    });
  }

  // Taşıncak
  Future<void> refreshPickedTimeAndSave() async {
    pickedTime = DateTime.now();

    await CacheManager.instance
        .setStringValue(SharedKeys.pickedTime, pickedTime.toString());
  }

  String onScreen(int? timeOption) {
    return timeOption.toString() == "null" ? "0" : timeOption.toString();
  }

  String showPassedTime(int? timeOption) {
    return timeOption.toString() == "null" ? "0" : timeOption.toString();
  }

  void _initializePickedTime() {
    final date = CacheManager.instance.getStringValue(SharedKeys.pickedTime);
    //debugPrint("Date  " + date.toString());
    //debugPrint("Date   " + date.toString());
    if (date != null) {
      pickedTime = DateTime.parse(date.toString());
    } else {
      pickedTime = DateTime.now();
      CacheManager.instance
          .setStringValue(SharedKeys.pickedTime, pickedTime.toString());
    }
  }

  void _initializeUser() {
    user = UserModal();
  }
}
