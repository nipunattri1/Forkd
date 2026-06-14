import 'package:forkd/features/auth/data/models/token.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class GithubAuthRepo {
  Future<Either<Exception, (AccountEntity, TokenModel)>> loginWithToken(
    String token,
  );
  Future<Either<Exception, (AccountEntity, TokenModel)>> loginWithOAuth();
}
