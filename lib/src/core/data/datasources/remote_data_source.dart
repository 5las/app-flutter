
import 'package:app_5las/src/config/api_url.dart';
import 'package:app_5las/src/core/data/model/base_response.dart';
import 'package:app_5las/src/features/signin/data/models/request/signin_request.dart';
import 'package:app_5las/src/features/signin/data/models/response/signin_response.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

enum Method { GET, POST, PUT, DELETE }
enum ContentType { JSON, FORM_DATA }

class RemoteDataSource{
  static const String _json_content_type = 'application/json';
  static const int _connectTimeout = 180000;
  static const int _receiveTimeout = 180000;

  final apiUrl = ApiUrl();
  final Dio _httpClient = Dio();
  final _logger = Logger();

  Future<Response> requestApi(
      {@required dynamic endpoint,
        String extraPath,
        @required Method method,
        ContentType contentType = ContentType.JSON,
        bool needsAuthorization = true,
        bool needsToken = true,
        int statusCode,
        dynamic data}) async {
    Response response;
    String url = apiUrl.generateLigoUrlEnum(endpoint);

    if (url == null) {
      _logger.d('no se generó la url');
      return null;
    } else {
      url += (extraPath == null ? '' : extraPath);
      //url += (extraPath == null ? '/' : extraPath);

      _httpClient.options = await getOptions(
          needsAuthorization: needsAuthorization,
          needsToken: needsToken,
          contentType: contentType);
      try {
        switch (method) {
          case Method.GET:
            response = await _httpClient.get(url);
            break;
          case Method.POST:
            response = await _httpClient.post(url, data: data);
            break;
          case Method.PUT:
            response = await _httpClient.put(url, data: data);
            break;
          case Method.DELETE:
            response = await _httpClient.delete(url, data: data);
            break;
          default:
            return null;
            break;
        }
      } on DioError catch (e) {
        _logger.d(e.message);
        response = e.response;
      }
    }

    return response;
  }

  Future<BaseOptions> getOptions(
      {bool needsAuthorization = true,
        bool needsToken = true,
        ContentType contentType = ContentType.JSON}) async {
    BaseOptions options = BaseOptions(
        connectTimeout: _connectTimeout, receiveTimeout: _receiveTimeout);

    options.headers = {
      'Content-Type': getContentType(contentType),
    };

    return options;
  }

  String getContentType(ContentType contentType) {
    String contentTypeS;

    switch (contentType) {
      case ContentType.JSON:
        contentTypeS = _json_content_type;
        break;
      default:
        contentTypeS = _json_content_type;
        break;
    }

    return contentTypeS;
  }

  /// Login
 Future<BaseResponse<SignInResponse>> login(SignInRequest signInRequest) async{
    const String _login = '/signin';
   final response = await requestApi(
     endpoint: AuthApiEndpoints.auth,
     method: Method.POST,
     data: signInRequest.toJson(),
     extraPath: '/' + _login,
   );
   return BaseResponse<SignInResponse>.fromJson(response.data);
 }


}