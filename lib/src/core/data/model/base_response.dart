import 'package:app_5las/src/core/data/model/access_token.dart';
import 'package:app_5las/src/core/data/model/error_api.dart';
import 'package:app_5las/src/features/signin/data/models/response/signin_response.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable(explicitToJson: true)
class BaseResponse<T> {
  int statusCode;

  String message;

  String error;

  @_Converter()
  final T data;


  BaseResponse(this.statusCode, this.message, this.error, this.data);

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse<T>(
        json['statusCode'] as int,
        json['message'] as String,
        (json['error'] as String),
        json['data'] == null ? null : _Converter<T>().fromJson(
            (json['data'] == json['accessToken'])
                ? (accessToken(json['data']))
                : json['data']
        )
    );
  }
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    switch (T) {
      case SignInResponse:
        return SignInResponse.fromJson(json) as T;
      default:
        throw Exception('Unhandled parsing type');
    }
    // return json as T;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}
