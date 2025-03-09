import 'package:freezed_annotation/freezed_annotation.dart';

part 'res_response.freezed.dart';
part 'res_response.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class Res<T> with _$Res<T> {
  const factory Res({
    @JsonKey(name: "code") required int code,
    @JsonKey(name: "message") required String message,
    @JsonKey(name: "data") T? data,
  }) = _Res;

  factory Res.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ResFromJson(json, fromJsonT);
}
