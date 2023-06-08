// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResult<T> _$BaseResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResult<T>(
      data: fromJsonT(json['data']),
      errorCode: json['errorCode'] as int,
      errorMsg: json['errorMsg'] as String,
    );

Map<String, dynamic> _$BaseResultToJson<T>(
  BaseResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
