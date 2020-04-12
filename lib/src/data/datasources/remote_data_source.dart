import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const API_URL = 'https://5las.renatocenteno.com';
abstract class RemoteDataSource {
  
}

class RemoteDataSourceIml implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceIml({@required this.client});
}