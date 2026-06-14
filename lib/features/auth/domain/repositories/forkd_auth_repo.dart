import 'package:forkd/features/auth/data/models/token.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ForkdAuthRepo {
  Future<Either<Exception, void>> addAccount(
    AccountEntity account,
    TokenModel token,
  );
  Future<Either<Exception, void>> setActiveAccount(AccountEntity account);
  Future<Either<Exception, void>> removeAccount(AccountEntity account);
  // Future<Either<Exception, void>> removeToken(String tokenHash);
  // Future<Either<Exception, String>> addToken(String token);
  // Future<Either<Exception, String>> getToken(String tokenHash);

  Future<AccountEntity?> get getActiveAccount;
  Future<List<AccountEntity>> get getallAccounts;
  Future<bool> get isLoggedIn;
}
