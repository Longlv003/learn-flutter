import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/login/login_state.dart';
import 'package:learn_flutter/common/utils/validators/login/login_validator.dart';
import 'package:learn_flutter/services/login/login_api.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final loginApi = LoginApi();

  Future<void> loginHandle(String email, String pass) async {
    try {
      emit(LoginLoading());

      final error = LoginValidator.validate(email, pass);
      if (error != null) {
        emit(LoginFailed(error));
        return;
      }

      final account = await loginApi.loginApi(email.trim(), pass.trim());

      emit(LoginSuccess(account));
    } catch (e) {
      final msg = e.toString();
      if (msg.contains("INVALID_EMAIL")) {
        emit(LoginFailed("INVALID_EMAIL"));
      } else if (msg.contains("WRONG_CREDENTIALS")) {
        emit(LoginFailed("WRONG_CREDENTIALS"));
      }
    }
  }
}
