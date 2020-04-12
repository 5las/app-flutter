
import 'package:app_5las/src/core/utils/enum_utils.dart';

enum AuthApiEndpoints { auth }

enum CompaniesAPIEndpoints { companies }

class ApiUrl{
  static final ApiUrl _apiUrlTheme = ApiUrl._internal();

  factory ApiUrl() {
    return _apiUrlTheme;
  }

  ApiUrl._internal();

  static const c5lasApiDomain = 'https://5las.renatocenteno.com';

  static const c5lasApiPath = '/';

  String generateUrl(String domain, String path, String method) {
    String url = '';

    if (domain != null && path != null && method != null) {
      url = domain;
      url += path + method;
    }

    return url;
  }

  String generateLigoUrl(String method) {
    return generateUrl(c5lasApiDomain, c5lasApiPath, method);
  }

  String generateLigoUrlEnum(dynamic endpoint) {
    if (validEndpoint(endpoint)) {
      return generateLigoUrl(EnumUtils.describeEnum(endpoint.toString()));
    } else {
      return null;
    }
  }

  bool validEndpoint(dynamic endpoint) {
    if ((endpoint is AuthApiEndpoints) ||
        (endpoint is CompaniesAPIEndpoints) ) {
      return true;
    } else {
      return false;
    }
  }

}
