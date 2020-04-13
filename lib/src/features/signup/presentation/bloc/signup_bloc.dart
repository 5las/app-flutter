import 'dart:async';

import 'package:app_5las/src/features/signup/domain/entities/district.dart';
import 'package:app_5las/src/features/signup/domain/usecases/get_districts.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final GetDistricts getDistricts;

  SignupBloc({@required this.getDistricts});

  @override
  SignupState get initialState => SignUpInitial();

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is GetDistrictsEvent) {
      yield SignUpLoading();
      //POR AHORA LE PASAMOS SOLO 1501 PARA LIMA
      final failureOrDistricts =
          await getDistricts.call(GetDistrictsParams(departmentId: 1501));
      //ACA DEBERIAMOS MANEJAR ERRORES, DESPUES LO HAGO
      yield failureOrDistricts.fold(
          (failure) => null, //FALTA IMPLEMENTAR ERRORES
          (districts) => SignUpLoaded(districts: districts));
    }
  }
}
