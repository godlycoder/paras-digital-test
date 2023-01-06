import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paras_test/app/cubit/account/account_state.dart';
import 'package:paras_test/domain/usecase/do_check_sign_in_status.dart';
import 'package:paras_test/domain/usecase/do_sign_in.dart';
import 'package:paras_test/domain/usecase/do_sign_out.dart';
import 'package:paras_test/domain/usecase/get_account.dart';

class AccountCubit extends Cubit<AccountState> {
  final DoSignIn _doSignIn;
  final DoCheckSignInStatus _doCheckSignInStatus;
  final GetAccount _getAccount;
  final DoSignOut _doSignOut;

  AccountCubit(this._doSignIn, this._doCheckSignInStatus, this._getAccount, this._doSignOut) : super(InitialAccountState());

  void doSignIn() async {
    final result = await _doSignIn.execute();
    result.fold(
      (failure) => emit(ErrorSignInState(failure.message)),
      (success) => emit(SuccessSignInState(success))
    );
  }

  void doCheckSignInStatus() async {
    final result = await _doCheckSignInStatus.execute();
    result.fold(
      (failure) => emit(SignInStatusState(false)),
      (success) => emit(SignInStatusState(success))
    );
  }

  void getAccount() async {
    final result = await _getAccount.execute();
    result.fold(
        (failure) => emit(ErrorGetAccountState(failure.message)),
        (success) => emit(SuccessGetAccountState(success))
    );
  }

  void doSignOut() async {
    final result = await _doSignOut.execute();
    result.fold(
        (failure) => emit(ErrorSignOutState(failure.message)),
        (success) => emit(SuccessSignOutState())
    );
  }


}