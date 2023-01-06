import 'package:dartz/dartz.dart';
import 'package:paras_test/domain/repository/account_repository.dart';
import 'package:paras_test/domain/uimodel/account.dart';
import 'package:paras_test/utils/failure.dart';

class GetAccount {
  final AccountRepository _repository;

  GetAccount(this._repository);

  Future<Either<Failure, AccountUiModel>> execute() {
    return _repository.getAccount();
  }

}