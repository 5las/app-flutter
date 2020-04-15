import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/company.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/district.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/ticket.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/generate_ticket.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_companies.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_districts.dart';
import 'package:dartz/dartz.dart';

abstract class OnBoardingRepository{
  Future<Either<Failure, Ticket>> getTicket(TicketsParams ticketsParams);
  Future<Either<Failure, List<District>>> getDistrict(DistrictsParams districts);
  Future<Either<Failure, List<Company>>> getCompany(CompaniesParams companiesParams);
}