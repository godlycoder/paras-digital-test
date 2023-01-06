import 'package:paras_test/domain/uimodel/account.dart';

abstract class AccountState {}

class InitialAccountState extends AccountState {}

class ErrorSignInState extends AccountState {
  final String message;

  ErrorSignInState(this.message);
}

class SuccessSignInState extends AccountState {
  final AccountUiModel data;

  SuccessSignInState(this.data);
}

class SignInStatusState extends AccountState {
  final bool isLoggedIn;

  SignInStatusState(this.isLoggedIn);
}

class SuccessSignOutState extends AccountState {}

class ErrorSignOutState extends AccountState {
  final String message;

  ErrorSignOutState(this.message);
}

class SuccessGetAccountState extends AccountState {
  final AccountUiModel data;

  SuccessGetAccountState(this.data);
}

class ErrorGetAccountState extends AccountState {
  final String message;

  ErrorGetAccountState(this.message);
}