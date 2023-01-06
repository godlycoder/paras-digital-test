import 'package:dartz/dartz.dart';
import 'package:paras_test/domain/uimodel/account.dart';
import 'package:paras_test/utils/failure.dart';

abstract class AccountRepository {

  Future<Either<Failure, AccountUiModel>> doSignIn();

  Future<Either<Failure, bool>> doCheckSignInStatus();

  Future<Either<Failure, AccountUiModel>> getAccount();

  Future<Either<Failure, bool>> doSignOut();

}