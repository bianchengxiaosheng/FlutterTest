// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindNew _$FindNewFromJson(Map<String, dynamic> json) {
  return FindNew(json['bookName'] as String, json['describe'] as String,
      json['detail'] as String, json['picURL'] as String);
}

Map<String, dynamic> _$FindNewToJson(FindNew instance) => <String, dynamic>{
      'bookName': instance.bookName,
      'describe': instance.describe,
      'detail': instance.detail,
      'picURL': instance.picURL
    };
