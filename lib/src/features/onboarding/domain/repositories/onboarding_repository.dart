import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/data/models/company_model.dart';
import 'package:app_5las/src/data/models/onboarding/schedule_response_model.dart';
import 'package:app_5las/src/data/models/signup/district_model.dart';
import 'package:app_5las/src/features/auth/domain/entities/login_response.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/company.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/ticket.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/generate_ticket.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_companies.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_districts.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_schedule.dart';
import 'package:dartz/dartz.dart';

abstract class OnBoardingRepository {
  Future<Either<Failure, Ticket>> getTicket(TicketsParams ticketsParams);
  Future<Either<Failure, List<DistrictModel>>> getDistrict(
      DistrictsParams districts);
  Future<Either<Failure, List<Company>>> getCompany(
      CompaniesParams companiesParams);
  Future<Either<Failure, LoginResponse>> getUserData(NoParams noParams);
  Future<Either<Failure, ScheduleResponseModel>> getScheduleForBranch(
      GetScheduleParams params);
}
