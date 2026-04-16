import 'package:learn_flutter/model/account_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final AccountModel accountModel;

  LoginSuccess(this.accountModel);
}

class LoginFailed extends LoginState {
  final String error;

  LoginFailed(this.error);
}
