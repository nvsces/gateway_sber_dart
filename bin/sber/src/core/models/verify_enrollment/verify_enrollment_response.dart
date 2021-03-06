import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';
import '../enums/enrolled.dart';

part 'verify_enrollment_response.g.dart';

/// {@template verify_enrollment_response}
/// Ответ проверки вовлечённости карты в 3DS
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class VerifyEnrollmentResponse extends AcquiringResponse {
  /// {@macro verify_enrollment_response}
  VerifyEnrollmentResponse({
    String? errorCode,
    String? errorMessage,
    this.enrolled,
    this.emitterName,
    this.emitterCountryCode,
  }) : super(
          errorCode: errorCode,
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory VerifyEnrollmentResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEnrollmentResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VerifyEnrollmentResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.enrolled: enrolled,
        JsonKeys.emitterName: emitterName,
        JsonKeys.emitterCountryCode: emitterCountryCode,
      };

  /// {@macro enrolled}
  @JsonKey(name: JsonKeys.enrolled)
  final Enrolled? enrolled;

  /// Наименование банка-эмитента.
  @JsonKey(name: JsonKeys.emitterName)
  final String? emitterName;

  /// Код страны банка-эмитента.
  @JsonKey(name: JsonKeys.emitterCountryCode)
  final int? emitterCountryCode;
}
