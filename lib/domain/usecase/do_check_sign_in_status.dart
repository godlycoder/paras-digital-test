import 'package:dartz/dartz.dart';
import 'package:paras_test/domain/repository/account_repository.dart';
import 'package:paras_test/utils/failure.dart';

class DoCheckSignInStatus {
  final AccountRepository _repository;

  DoCheckSignInStatus(this._repository);

  Future<Either<Failure, bool>> execute() {
    return _repository.doCheckSignInStatus();
  }

}