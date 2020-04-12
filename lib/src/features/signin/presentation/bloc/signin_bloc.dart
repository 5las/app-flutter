import 'package:app_5las/src/features/signin/presentation/bloc/signin_event.dart';
import 'package:app_5las/src/features/signin/presentation/bloc/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input';

class SignInBloc extends Bloc<SignInEvent,SignInState>{
  @override
  // TODO: implement initialState
  SignInState get initialState => null;

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) {
    // TODO: implement mapEventToState
    return null;
  }

}