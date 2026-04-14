import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginHandle(String email, String pass) async {
    try {
      emit(LoginLoading());

      await Future.delayed(const Duration(seconds: 1));

      if (email.trim().isEmpty || pass.trim().isEmpty) {
        emit(LoginFailed("REQUIRED"));
        return;
      }

      if (!email.trim().endsWith("@gmail.com")) {
        emit(LoginFailed("INVALID_EMAIL"));
        return;
      }

      await Future.delayed(const Duration(seconds: 1));

      if (email.trim() == "admin@gmail.com" && pass.trim() == "admin123") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailed("WRONG_CREDENTIALS"));
      }
    } catch (e) {
      emit(LoginFailed("UNKNOWN_ERROR"));
    }
  }
}
