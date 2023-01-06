import 'package:dartz/dartz.dart';
import 'package:paras_test/data/source/account_data_source.dart';
import 'package:paras_test/domain/repository/account_repository.dart';
import 'package:paras_test/domain/uimodel/account.dart';
import 'package:paras_test/utils/extentions/account_extentions.dart';
import 'package:paras_test/utils/failure.dart';

class AccountRepositoryImpl extends AccountRepository {
  final AccountRemoteDataSource _remoteDataSource;

  AccountRepositoryImpl(this._remoteDataSource);


  @override
  Future<Either<Failure, AccountUiModel>> doSignIn() async {
    try {
      final result = await _remoteDataSource.doSignIn();
      if (result != null) {
        return Right(result.toUiModel());
      }

      return const Left(
        Failure('Account not found')
      );
    } catch(e) {
      return const Left(
        Failure('Sign in error')
      );
    }
  }

  @override
  Future<Either<Failure, bool>> doCheckSignInStatus() async {
    try {
      final result = await _remoteDataSource.doCheckSignInStatus();

      return Right(result);
    } on Exception {
      return const Left(
        Failure('No account have to signed in')
      );
    }
  }

  @override
  Future<Either<Failure, AccountUiModel>> getAccount() async {
    try {
      final result = await _remoteDataSource.getAccount();
      if (result != null) {
        return Right(result.toUiModel());
      }

      return const Left(
          Failure('Account not found')
      );
    } catch(e) {
      return const Left(
          Failure('Sign in error')
      );
    }
  }

  @override
  Future<Either<Failure, bool>> doSignOut() async {
    try {
      await _remoteDataSource.doSignOut();
      return const Right(true);
    } catch(e) {
      return const Left(
          Failure('Sign in error')
      );
    }
  }

}