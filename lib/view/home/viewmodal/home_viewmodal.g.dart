// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodal.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModal on _HomeViewModalBase, Store {
  late final _$pickedTimeAtom =
      Atom(name: '_HomeViewModalBase.pickedTime', context: context);

  @override
  DateTime? get pickedTime {
    _$pickedTimeAtom.reportRead();
    return super.pickedTime;
  }

  @override
  set pickedTime(DateTime? value) {
    _$pickedTimeAtom.reportWrite(value, super.pickedTime, () {
      super.pickedTime = value;
    });
  }

  late final _$timeDifferenceAtom =
      Atom(name: '_HomeViewModalBase.timeDifference', context: context);

  @override
  Duration? get timeDifference {
    _$timeDifferenceAtom.reportRead();
    return super.timeDifference;
  }

  @override
  set timeDifference(Duration? value) {
    _$timeDifferenceAtom.reportWrite(value, super.timeDifference, () {
      super.timeDifference = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_HomeViewModalBase.user', context: context);

  @override
  UserModal? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModal? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$hourlySmokedCigaratteAtom =
      Atom(name: '_HomeViewModalBase.hourlySmokedCigaratte', context: context);

  @override
  int? get hourlySmokedCigaratte {
    _$hourlySmokedCigaratteAtom.reportRead();
    return super.hourlySmokedCigaratte;
  }

  @override
  set hourlySmokedCigaratte(int? value) {
    _$hourlySmokedCigaratteAtom.reportWrite(value, super.hourlySmokedCigaratte,
        () {
      super.hourlySmokedCigaratte = value;
    });
  }

  late final _$_currentTimeAtom =
      Atom(name: '_HomeViewModalBase._currentTime', context: context);

  @override
  DateTime? get _currentTime {
    _$_currentTimeAtom.reportRead();
    return super._currentTime;
  }

  @override
  set _currentTime(DateTime? value) {
    _$_currentTimeAtom.reportWrite(value, super._currentTime, () {
      super._currentTime = value;
    });
  }

  late final _$timeDifferenceListAtom =
      Atom(name: '_HomeViewModalBase.timeDifferenceList', context: context);

  @override
  List<dynamic>? get timeDifferenceList {
    _$timeDifferenceListAtom.reportRead();
    return super.timeDifferenceList;
  }

  @override
  set timeDifferenceList(List<dynamic>? value) {
    _$timeDifferenceListAtom.reportWrite(value, super.timeDifferenceList, () {
      super.timeDifferenceList = value;
    });
  }

  late final _$_HomeViewModalBaseActionController =
      ActionController(name: '_HomeViewModalBase', context: context);

  @override
  String hourlySmokedCigaratteCalcullation(int hour) {
    final _$actionInfo = _$_HomeViewModalBaseActionController.startAction(
        name: '_HomeViewModalBase.hourlySmokedCigaratteCalcullation');
    try {
      return super.hourlySmokedCigaratteCalcullation(hour);
    } finally {
      _$_HomeViewModalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String moneyCalculation(int? hourlySmokedCigaratte) {
    final _$actionInfo = _$_HomeViewModalBaseActionController.startAction(
        name: '_HomeViewModalBase.moneyCalculation');
    try {
      return super.moneyCalculation(hourlySmokedCigaratte);
    } finally {
      _$_HomeViewModalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String savedTimeCalculation(int? hourlySmokedCigaratte,
      {String minutesLanguage = "", String hoursLanguage = ""}) {
    final _$actionInfo = _$_HomeViewModalBaseActionController.startAction(
        name: '_HomeViewModalBase.savedTimeCalculation');
    try {
      return super.savedTimeCalculation(hourlySmokedCigaratte,
          minutesLanguage: minutesLanguage, hoursLanguage: hoursLanguage);
    } finally {
      _$_HomeViewModalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _calculateTime() {
    final _$actionInfo = _$_HomeViewModalBaseActionController.startAction(
        name: '_HomeViewModalBase._calculateTime');
    try {
      return super._calculateTime();
    } finally {
      _$_HomeViewModalBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pickedTime: ${pickedTime},
timeDifference: ${timeDifference},
user: ${user},
hourlySmokedCigaratte: ${hourlySmokedCigaratte},
timeDifferenceList: ${timeDifferenceList}
    ''';
  }
}
