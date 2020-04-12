import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ErrorApi {
  @JsonKey(name: 'field')
  String field;

  @JsonKey(name: 'message')
  String message;

  ErrorApi(this.field, this.message);

  factory ErrorApi.fromJson(Map<String, dynamic> json) {
    return ErrorApi(
        json['field'] as String,
        json['message'] as String
    );
  }

  static Map<String, String> toMap(List<ErrorApi> errors) {
    Map<String, String> mapErrors = {};

    errors.forEach(
            (error) => {mapErrors.putIfAbsent(error.field, () => error.message)});

    return mapErrors;
  }

  Map<String, dynamic> toJson() {
    return {
      'field': field,
      'message': message
    };
  }
}
