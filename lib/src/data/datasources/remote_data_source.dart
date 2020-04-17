import 'dart:convert';
import 'package:app_5las/src/core/error/exceptions.dart';
import 'package:app_5las/src/data/models/auth/response/login_response_model.dart';
import 'package:app_5las/src/data/models/company_model.dart';
import 'package:app_5las/src/data/models/generateticket/ticket_reponse_model.dart';
import 'package:app_5las/src/data/models/signup/district_model.dart';
import 'package:app_5las/src/data/models/signup/signup_response_model.dart';
import 'package:app_5las/src/features/auth/domain/usecases/login_attempt.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/generate_ticket.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_companies.dart';
import 'package:app_5las/src/features/signup/domain/usecases/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../../core/utils/session.dart';

const API_URL = 'https://5las.renatocenteno.com';

abstract class RemoteDataSource {
  Future<LoginResponseModel> login(LoginParams loginParams);

  Future<SignUpResponseModel> signUp(SignUpParams params);

  Future<List<DistrictModel>> getDistricts(int districtId);

  Future<List<CompanyModel>> getCompaniesByDistrict(String token, CompaniesParams companiesParams);

  Future<TicketResponseModel> postGenerateTicket(String token, TicketsParams ticketsParams);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  final Session _session = Session();

  RemoteDataSourceImpl({@required this.client});

  @override
  Future<LoginResponseModel> login(LoginParams loginParams) async{
    try{
      final Map<String, String> data = {
        'email': loginParams.email,
        'password': loginParams.password
      };

      final response =
          await client.post(
              '$API_URL/auth/signin',
              headers: {
                'Content-Type': 'application/json'
              },
              body: json.encode(data)
          );

      if (response.statusCode == 201) {
        return LoginResponseModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } on PlatformException catch(e){
      return null;
    }
  }


  @override
  Future<SignUpResponseModel> signUp(SignUpParams params) async {
    final Map<String, dynamic> data = {
      'fullname': params.fullname,
      'address': params.address,
      'dni': params.dni,
      'email': params.email,
      'password': params.password,
      'gender': params.gender,
      'district_id': params.districtId
    };

    final response =
        await client.post('$API_URL/auth/signup',
            headers: {
              'Content-Type': 'application/json'
            },
            body: json.encode(data));
    //201: Created
    if (response.statusCode == 201) {
      return SignUpResponseModel();
    } else if (response.statusCode == 409) {
      throw DuplicatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DistrictModel>> getDistricts(int departmentId) async {
    final response =
        await client.get(
            '$API_URL/companies/districts/$departmentId',
            headers: {
              'Content-Type' : 'application/json'
            }
        );

    if (response.statusCode == 200) {
      //convirtiendo el JSONarray a un List<DistrictModel>
      return (json.decode(response.body) as List)
          .map((e) => DistrictModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  Future<List<CompanyModel>> getCompaniesByDistrict(String token, CompaniesParams companiesParams)async{
    final response = await client.get(
        '$API_URL/companies/byDistrict/${companiesParams.districtId}',
      headers: {
        'Authorization': 'bearer $token',
        'Content-Type' : 'application/json'
      }
    );
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => CompanyModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }
  
  Future<TicketResponseModel> postGenerateTicket(String token, TicketsParams ticketsParams )async{
    try{
      final Map<String, int> data = {
        'turnId': ticketsParams.turnId,
      };

      final response =
      await client.post(
          '$API_URL/tickets/generate',
          headers: {
            'authorization': 'bearer $token',
            'Content-Type' : 'application/json'
          },
          body: json.encode(data)
      );

      if (response.statusCode == 201) {
        return TicketResponseModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } on PlatformException catch(e){
      return null;
    }

  }


}
