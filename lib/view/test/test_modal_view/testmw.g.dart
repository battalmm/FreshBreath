// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testmw.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TestModalWiev on _TestModalWievBase, Store {
  late final _$pickedTimeAtom =
      Atom(name: '_TestModalWievBase.pickedTime', context: context);

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

  late final _$_currentTimeAtom =
      Atom(name: '_TestModalWievBase._currentTime', context: context);

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

  late final _$timeDifferenceAtom =
      Atom(name: '_TestModalWievBase.timeDifference', context: context);

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
      Atom(name: '_TestModalWievBase.user', context: context);

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

  late final _$_TestModalWievBaseActionController =
      ActionController(name: '_TestModalWievBase', context: context);

  @override
  void _calculateTime() {
    final _$actionInfo = _$_TestModalWievBaseActionController.startAction(
        name: '_TestModalWievBase._calculateTime');
    try {
      return super._calculateTime();
    } finally {
      _$_TestModalWievBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pickedTime: ${pickedTime},
timeDifference: ${timeDifference},
user: ${user}
    ''';
  }
}
