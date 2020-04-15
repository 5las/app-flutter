import 'package:app_5las/src/core/error/failures.dart';
import 'package:app_5las/src/core/usecases/usecase.dart';
import 'package:app_5las/src/features/onboarding/domain/entities/ticket.dart';
import 'package:app_5las/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class GenerateTickets extends UseCase<Ticket, TicketsParams>{
  final OnBoardingRepository onBoardingRepository;

  GenerateTickets({@required this.onBoardingRepository});

  @override
  Future<Either<Failure, Ticket>> call(TicketsParams ticketsParams)async {
    return await onBoardingRepository.getTicket(ticketsParams);
  }
}

class TicketsParams extends Equatable {

  final int turnId;

  TicketsParams({@required this.turnId});

  @override
  List<Object> get props => [turnId];

}