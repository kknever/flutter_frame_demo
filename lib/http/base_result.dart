import 'package:json_annotation/json_annotation.dart';

part 'base_result.g.dart';

/// 网络请求返回数据结构体
@JsonSerializable(genericArgumentFactories: true)
class BaseResult<T> {
  T data;
  int errorCode;
  String errorMsg;

  BaseResult({
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  factory BaseResult.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) => _$BaseResultFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$BaseResultToJson<T>(this, toJsonT);
}