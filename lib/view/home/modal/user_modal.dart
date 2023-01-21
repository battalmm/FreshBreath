import 'package:json_annotation/json_annotation.dart';
import 'package:smoking_application/core/base/modal/base_modal.dart';

part 'user_modal.g.dart';

@JsonSerializable()
class UserModal extends BaseModal {
  final int? year;
  final int? month;
  final int? week;
  final int? day;
  final int? hour;
  final int? minute;
  final int? second;
  final DateTime? pickedTime;

  int? get getYears => year;
  int? get getMonths => month;
  int? get getWeeks => week;
  int? get getDays => day;
  int? get getHours => hour;
  int? get getMinutes => minute;
  int? get getSeconds => second;
  DateTime? get getPickedTime => pickedTime;

  UserModal({
    this.pickedTime,
    this.year,
    this.month,
    this.week,
    this.day,
    this.hour,
    this.minute,
    this.second,
  });

  UserModal copyWith({
    DateTime? pickedTimes,
    int? years,
    int? months,
    int? weeks,
    int? days,
    int? hours,
    int? minutes,
    int? seconds,
  }) =>
      UserModal(
          pickedTime: pickedTimes ?? pickedTime,
          year: years ?? year,
          month: months ?? month,
          week: weeks ?? week,
          day: days ?? day,
          hour: hours ?? hour,
          minute: minutes ?? minute,
          second: seconds ?? second);

  @override
  String toString() {
    return "Year: $getYears Month: $getMonths Week: $getWeeks Day: $getDays Hour: $getHours Minute: $getMinutes Second: $getSeconds - Started Date: $pickedTime";
  }

  @override
  UserModal fromJson(Map<String, dynamic> json) {
    return _$UserModalFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserModalToJson(this);
  }
}
