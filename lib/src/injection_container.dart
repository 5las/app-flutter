import 'package:app_5las/src/data/datasources/local_data_source.dart';
import 'package:app_5las/src/data/datasources/remote_data_source.dart';
import 'package:app_5las/src/data/repositories/auth_repository_impl.dart';
import 'package:app_5las/src/data/repositories/onboarding_repository_impl.dart';
import 'package:app_5las/src/data/repositories/signup_repository_impl.dart';
import 'package:app_5las/src/features/auth/domain/repositories/login_repository.dart';
import 'package:app_5las/src/features/auth/domain/usecases/login_attempt.dart';
import 'package:app_5las/src/features/auth/presentation/bloc/login_bloc.dart';
import 'package:app_5las/src/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:app_5las/src/features/onboarding/domain/usecases/get_districts.dart';
import 'package:app_5las/src/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:app_5las/src/features/signup/domain/repositories/signup_repository.dart';
import 'package:app_5las/src/features/signup/domain/usecases/get_districts.dart';
import 'package:app_5las/src/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  ///BLOCS
  serviceLocator.registerFactory(() => SignupBloc(getDistricts: serviceLocator()));
  serviceLocator.registerFactory(() => AuthBloc(loginAttempt: serviceLocator()));
  serviceLocator.registerFactory(() => OnBoardingBloc(getDistricts: serviceLocator()));

  ///use cases
  serviceLocator.registerLazySingleton(() => GetDistricts(signUpRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => LoginAttempt(authRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetDistrict(onBoardingRepository: serviceLocator()));

  ///repositories
  serviceLocator.registerLazySingleton<SignUpRepository>(() => SignUpRepositoryImpl(remoteDataSource: serviceLocator()));
  serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: serviceLocator()));
  serviceLocator.registerLazySingleton<OnBoardingRepository>(() => OnBoardingRepositoryImpl(remoteDataSource: serviceLocator()));

  ///data sources
  serviceLocator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: serviceLocator()));

  serviceLocator.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: serviceLocator()));

  ///http client
  serviceLocator.registerLazySingleton(() => http.Client());
}
