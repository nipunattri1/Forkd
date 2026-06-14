import 'package:forkd/features/auth/data/models/token.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class GitlabAuthRepo {
  Future<Either<Exception, (AccountEntity, TokenModel)>> loginWithToken({
    required String token,
    required String domain,
  });
  Future<Either<Exception, (AccountEntity, TokenModel)>> loginWithOAuth({
    required String domain,
  });
}
