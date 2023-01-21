// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModal _$UserModalFromJson(Map<String, dynamic> json) => UserModal(
      pickedTime: json['pickedTime'] == null
          ? null
          : DateTime.parse(json['pickedTime'] as String),
      year: json['year'] as int?,
      month: json['month'] as int?,
      week: json['week'] as int?,
      day: json['day'] as int?,
      hour: json['hour'] as int?,
      minute: json['minute'] as int?,
      second: json['second'] as int?,
    );

Map<String, dynamic> _$UserModalToJson(UserModal instance) => <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'week': instance.week,
      'day': instance.day,
      'hour': instance.hour,
      'minute': instance.minute,
      'second': instance.second,
      'pickedTime': instance.pickedTime?.toIso8601String(),
    };
