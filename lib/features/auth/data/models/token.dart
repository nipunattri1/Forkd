import 'package:freezed_annotation/freezed_annotation.dart';
part 'token.freezed.dart';
part 'token.g.dart';

@Freezed(fromJson: true)
@JsonSerializable(fieldRename: FieldRename.snake)
class TokenModel with _$TokenModel {
  TokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.createdAt,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  final String accessToken;
  final String? refreshToken;
  final int? expiresIn;
  final int? createdAt;
}
