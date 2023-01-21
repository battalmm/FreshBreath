// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tes_modal_view_two.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SecondTestView on _SecondTestViewBase, Store {
  late final _$pickedTimeAtom =
      Atom(name: '_SecondTestViewBase.pickedTime', context: context);

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

  late final _$refreshPickedTimeAndSaveAsyncAction = AsyncAction(
      '_SecondTestViewBase.refreshPickedTimeAndSave',
      context: context);

  @override
  Future<void> refreshPickedTimeAndSave() {
    return _$refreshPickedTimeAndSaveAsyncAction
        .run(() => super.refreshPickedTimeAndSave());
  }

  @override
  String toString() {
    return '''
pickedTime: ${pickedTime}
    ''';
  }
}
