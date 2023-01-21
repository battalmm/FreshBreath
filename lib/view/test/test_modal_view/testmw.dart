import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:smoking_application/core/base/base_wiev_modal/base_view_modal.dart';
import 'package:smoking_application/core/init/cache/cache_manager.dart';
import 'package:smoking_application/core/init/cache/shared_keys.dart';
import 'package:smoking_application/view/home/modal/user_modal.dart';

part 'testmw.g.dart';

class TestModalWiev = _TestModalWievBase with _$TestModalWiev;

abstract class _TestModalWievBase with Store, BaseViewModel {
  @override
  void init() {
    _calculateTime();
  }

  @observable
  DateTime? pickedTime;

  @observable
  DateTime? _currentTime;

  @observable
  Duration? timeDifference;

  @observable
  UserModal? user;

  void _initializeUser() {
    user = UserModal();
  }

  Future<void> refreshPickedTimeAndSave() async {
    pickedTime = DateTime.now();

    await CacheManager.instance
        .setStringValue(SharedKeys.pickedTime, pickedTime.toString());
  }

  void _initializePickedTime() {
    final date = CacheManager.instance.getStringValue(SharedKeys.pickedTime);

    if (date != null) {
      pickedTime = DateTime.parse(date.toString());
    } else {
      refreshPickedTimeAndSave();
    }
  }

  @action
  void _calculateTime() {
    _initializeUser();
    _initializePickedTime();

    Timer.periodic(const Duration(seconds: 1), (_) {
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

      // SİLİNECEK
      debugPrint(user.toString());
    });
  }
}
