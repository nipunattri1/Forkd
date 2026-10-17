import 'package:flutter_test/flutter_test.dart';
import 'package:forkd/core/common/strings.dart';
import 'package:forkd/features/auth/data/models/account.dart';

void main() {
  group('GitlabAccModel clientId', () {
    test('round-trips a custom-domain clientId', () {
      final model = AccountModel.fromJson({
        'runtimeType': 'gitlab',
        'tokenHash': 'h',
        'username': 'u',
        'name': 'n',
        'avatarUrl': 'a',
        'bio': 'b',
        'gitlabId': 1,
        'accessLevel': 10,
        'domain': 'gitlab.company.com',
        'clientId': 'custom-client-id',
      });

      final json = model.toJson();
      expect(json['domain'], 'gitlab.company.com');
      expect((model as GitlabAccModel).clientId, 'custom-client-id');
    });

    test('backfills gitlabClientId when stored accounts predate the field', () {
      final model = AccountModel.fromJson({
        'runtimeType': 'gitlab',
        'tokenHash': 'h',
        'username': 'u',
        'name': 'n',
        'avatarUrl': 'a',
        'bio': 'b',
        'gitlabId': 1,
        'accessLevel': 10,
        // No 'clientId' or 'domain' key.
      });

      expect((model as GitlabAccModel).clientId, gitlabClientId);
      expect(model.domain, 'gitlab.com');
    });
  });
}
