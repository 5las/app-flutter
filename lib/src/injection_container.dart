import 'package:app_5las/src/data/datasources/remote_data_source.dart';
import 'package:app_5las/src/data/repositories/signup_repository_impl.dart';
import 'package:app_5las/src/features/signup/domain/repositories/signup_repository.dart';
import 'package:app_5las/src/features/signup/domain/usecases/get_districts.dart';
import 'package:app_5las/src/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //BLOCS
  serviceLocator
      .registerFactory(() => SignupBloc(getDistricts: serviceLocator()));
  //use cases
  serviceLocator.registerLazySingleton(
      () => GetDistricts(signUpRepository: serviceLocator()));

  //repositories
  serviceLocator.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(remoteDataSource: serviceLocator()));

  //data sources
  serviceLocator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: serviceLocator()));

  //http client
  serviceLocator.registerLazySingleton(() => http.Client());
}
