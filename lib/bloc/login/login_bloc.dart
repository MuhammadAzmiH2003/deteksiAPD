import 'package:bloc/bloc.dart';
import 'package:safetycheck/data/datasources/auth_datasources.dart';
import 'package:safetycheck/data/localsources/auth_local_storage.dart';
import 'package:safetycheck/data/models/requests/login_model.dart';
import 'package:safetycheck/data/models/response/login_response.dart';

import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthDatasource authDatasource;

  LoginBloc(this.authDatasource) : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final result = await authDatasource.login(event.loginModel);
        await AuthLocalStorage().saveToken(result.accessToken);
        emit(LoginLoaded(loginResponseModel: result));
      } catch (e) {
        emit(LoginError(message: "Jaringan Terputus"));
      }
    });
  }
}