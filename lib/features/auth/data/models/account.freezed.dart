// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
AccountModel _$AccountModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'github':
          return GithubAccModel.fromJson(
            json
          );
                case 'gitee':
          return GiteeAccModel.fromJson(
            json
          );
                case 'gitlab':
          return GitlabAccModel.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'AccountModel',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$AccountModel {

 String get tokenHash; String get avatarUrl; String get domain;
/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountModelCopyWith<AccountModel> get copyWith => _$AccountModelCopyWithImpl<AccountModel>(this as AccountModel, _$identity);

  /// Serializes this AccountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AccountModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountModel&&(identical(other.tokenHash, _this.tokenHash) || other.tokenHash == _this.tokenHash)&&(identical(other.avatarUrl, _this.avatarUrl) || other.avatarUrl == _this.avatarUrl)&&(identical(other.domain, _this.domain) || other.domain == _this.domain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AccountModel;
  return Object.hash(runtimeType,_this.tokenHash,_this.avatarUrl,_this.domain);
}

@override
String toString() {
  final _this = this as AccountModel;
  return 'AccountModel(tokenHash: ${_this.tokenHash}, avatarUrl: ${_this.avatarUrl}, domain: ${_this.domain})';
}


}

/// @nodoc
abstract mixin class $AccountModelCopyWith<$Res>  {
  factory $AccountModelCopyWith(AccountModel value, $Res Function(AccountModel) _then) = _$AccountModelCopyWithImpl;
@useResult
$Res call({
 String tokenHash, String avatarUrl, String domain
});




}
/// @nodoc
class _$AccountModelCopyWithImpl<$Res>
    implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._self, this._then);

  final AccountModel _self;
  final $Res Function(AccountModel) _then;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokenHash = null,Object? avatarUrl = null,Object? domain = null,}) {
  return _then(_self.copyWith(
tokenHash: null == tokenHash ? _self.tokenHash : tokenHash // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountModel].
extension AccountModelPatterns on AccountModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GithubAccModel value)?  github,TResult Function( GiteeAccModel value)?  gitee,TResult Function( GitlabAccModel value)?  gitlab,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GithubAccModel() when github != null:
return github(_that);case GiteeAccModel() when gitee != null:
return gitee(_that);case GitlabAccModel() when gitlab != null:
return gitlab(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GithubAccModel value)  github,required TResult Function( GiteeAccModel value)  gitee,required TResult Function( GitlabAccModel value)  gitlab,}){
final _that = this;
switch (_that) {
case GithubAccModel():
return github(_that);case GiteeAccModel():
return gitee(_that);case GitlabAccModel():
return gitlab(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GithubAccModel value)?  github,TResult? Function( GiteeAccModel value)?  gitee,TResult? Function( GitlabAccModel value)?  gitlab,}){
final _that = this;
switch (_that) {
case GithubAccModel() when github != null:
return github(_that);case GiteeAccModel() when gitee != null:
return gitee(_that);case GitlabAccModel() when gitlab != null:
return gitlab(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String tokenHash,  String login,  String avatarUrl,  String domain)?  github,TResult Function( String tokenHash,  String login,  String avatarUrl,  String domain)?  gitee,TResult Function( String tokenHash,  String username,  String name,  String avatarUrl,  String bio,  int gitlabId,  int? accessLevel,  String domain,  String clientId)?  gitlab,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GithubAccModel() when github != null:
return github(_that.tokenHash,_that.login,_that.avatarUrl,_that.domain);case GiteeAccModel() when gitee != null:
return gitee(_that.tokenHash,_that.login,_that.avatarUrl,_that.domain);case GitlabAccModel() when gitlab != null:
return gitlab(_that.tokenHash,_that.username,_that.name,_that.avatarUrl,_that.bio,_that.gitlabId,_that.accessLevel,_that.domain,_that.clientId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String tokenHash,  String login,  String avatarUrl,  String domain)  github,required TResult Function( String tokenHash,  String login,  String avatarUrl,  String domain)  gitee,required TResult Function( String tokenHash,  String username,  String name,  String avatarUrl,  String bio,  int gitlabId,  int? accessLevel,  String domain,  String clientId)  gitlab,}) {final _that = this;
switch (_that) {
case GithubAccModel():
return github(_that.tokenHash,_that.login,_that.avatarUrl,_that.domain);case GiteeAccModel():
return gitee(_that.tokenHash,_that.login,_that.avatarUrl,_that.domain);case GitlabAccModel():
return gitlab(_that.tokenHash,_that.username,_that.name,_that.avatarUrl,_that.bio,_that.gitlabId,_that.accessLevel,_that.domain,_that.clientId);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String tokenHash,  String login,  String avatarUrl,  String domain)?  github,TResult? Function( String tokenHash,  String login,  String avatarUrl,  String domain)?  gitee,TResult? Function( String tokenHash,  String username,  String name,  String avatarUrl,  String bio,  int gitlabId,  int? accessLevel,  String domain,  String clientId)?  gitlab,}) {final _that = this;
switch (_that) {
case GithubAccModel() when github != null:
return github(_that.tokenHash,_that.login,_that.avatarUrl,_that.domain);case GiteeAccModel() when gitee != null:
return gitee(_that.tokenHash,_that.login,_that.avatarUrl,_that.domain);case GitlabAccModel() when gitlab != null:
return gitlab(_that.tokenHash,_that.username,_that.name,_that.avatarUrl,_that.bio,_that.gitlabId,_that.accessLevel,_that.domain,_that.clientId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GithubAccModel extends AccountModel {
   GithubAccModel({required this.tokenHash, required this.login, required this.avatarUrl, this.domain = 'github.com',  String? $type}): $type = $type ?? 'github',super._();
  factory GithubAccModel.fromJson(Map<String, dynamic> json) => _$GithubAccModelFromJson(json);

@override final  String tokenHash;
 final  String login;
@override final  String avatarUrl;
@override@JsonKey() final  String domain;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GithubAccModelCopyWith<GithubAccModel> get copyWith => _$GithubAccModelCopyWithImpl<GithubAccModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GithubAccModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GithubAccModel&&(identical(other.tokenHash, tokenHash) || other.tokenHash == tokenHash)&&(identical(other.login, login) || other.login == login)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.domain, domain) || other.domain == domain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tokenHash,login,avatarUrl,domain);
}

@override
String toString() {
    return 'AccountModel.github(tokenHash: $tokenHash, login: $login, avatarUrl: $avatarUrl, domain: $domain)';
}


}

/// @nodoc
abstract mixin class $GithubAccModelCopyWith<$Res> implements $AccountModelCopyWith<$Res> {
  factory $GithubAccModelCopyWith(GithubAccModel value, $Res Function(GithubAccModel) _then) = _$GithubAccModelCopyWithImpl;
@override @useResult
$Res call({
 String tokenHash, String login, String avatarUrl, String domain
});




}
/// @nodoc
class _$GithubAccModelCopyWithImpl<$Res>
    implements $GithubAccModelCopyWith<$Res> {
  _$GithubAccModelCopyWithImpl(this._self, this._then);

  final GithubAccModel _self;
  final $Res Function(GithubAccModel) _then;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokenHash = null,Object? login = null,Object? avatarUrl = null,Object? domain = null,}) {
  return _then(GithubAccModel(
tokenHash: null == tokenHash ? _self.tokenHash : tokenHash // ignore: cast_nullable_to_non_nullable
as String,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GiteeAccModel extends AccountModel {
   GiteeAccModel({required this.tokenHash, required this.login, required this.avatarUrl, this.domain = 'gitee.com',  String? $type}): $type = $type ?? 'gitee',super._();
  factory GiteeAccModel.fromJson(Map<String, dynamic> json) => _$GiteeAccModelFromJson(json);

@override final  String tokenHash;
 final  String login;
@override final  String avatarUrl;
@override@JsonKey() final  String domain;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GiteeAccModelCopyWith<GiteeAccModel> get copyWith => _$GiteeAccModelCopyWithImpl<GiteeAccModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GiteeAccModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GiteeAccModel&&(identical(other.tokenHash, tokenHash) || other.tokenHash == tokenHash)&&(identical(other.login, login) || other.login == login)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.domain, domain) || other.domain == domain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tokenHash,login,avatarUrl,domain);
}

@override
String toString() {
    return 'AccountModel.gitee(tokenHash: $tokenHash, login: $login, avatarUrl: $avatarUrl, domain: $domain)';
}


}

/// @nodoc
abstract mixin class $GiteeAccModelCopyWith<$Res> implements $AccountModelCopyWith<$Res> {
  factory $GiteeAccModelCopyWith(GiteeAccModel value, $Res Function(GiteeAccModel) _then) = _$GiteeAccModelCopyWithImpl;
@override @useResult
$Res call({
 String tokenHash, String login, String avatarUrl, String domain
});




}
/// @nodoc
class _$GiteeAccModelCopyWithImpl<$Res>
    implements $GiteeAccModelCopyWith<$Res> {
  _$GiteeAccModelCopyWithImpl(this._self, this._then);

  final GiteeAccModel _self;
  final $Res Function(GiteeAccModel) _then;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokenHash = null,Object? login = null,Object? avatarUrl = null,Object? domain = null,}) {
  return _then(GiteeAccModel(
tokenHash: null == tokenHash ? _self.tokenHash : tokenHash // ignore: cast_nullable_to_non_nullable
as String,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GitlabAccModel extends AccountModel {
   GitlabAccModel({required this.tokenHash, required this.username, required this.name, required this.avatarUrl, required this.bio, required this.gitlabId, required this.accessLevel, this.domain = 'gitlab.com', this.clientId = gitlabClientId,  String? $type}): $type = $type ?? 'gitlab',super._();
  factory GitlabAccModel.fromJson(Map<String, dynamic> json) => _$GitlabAccModelFromJson(json);

@override final  String tokenHash;
 final  String username;
 final  String name;
@override final  String avatarUrl;
 final  String bio;
 final  int gitlabId;
 final  int? accessLevel;
@override@JsonKey() final  String domain;
@JsonKey() final  String clientId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GitlabAccModelCopyWith<GitlabAccModel> get copyWith => _$GitlabAccModelCopyWithImpl<GitlabAccModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GitlabAccModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GitlabAccModel&&(identical(other.tokenHash, tokenHash) || other.tokenHash == tokenHash)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.gitlabId, gitlabId) || other.gitlabId == gitlabId)&&(identical(other.accessLevel, accessLevel) || other.accessLevel == accessLevel)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.clientId, clientId) || other.clientId == clientId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tokenHash,username,name,avatarUrl,bio,gitlabId,accessLevel,domain,clientId);
}

@override
String toString() {
    return 'AccountModel.gitlab(tokenHash: $tokenHash, username: $username, name: $name, avatarUrl: $avatarUrl, bio: $bio, gitlabId: $gitlabId, accessLevel: $accessLevel, domain: $domain, clientId: $clientId)';
}


}

/// @nodoc
abstract mixin class $GitlabAccModelCopyWith<$Res> implements $AccountModelCopyWith<$Res> {
  factory $GitlabAccModelCopyWith(GitlabAccModel value, $Res Function(GitlabAccModel) _then) = _$GitlabAccModelCopyWithImpl;
@override @useResult
$Res call({
 String tokenHash, String username, String name, String avatarUrl, String bio, int gitlabId, int? accessLevel, String domain, String clientId
});




}
/// @nodoc
class _$GitlabAccModelCopyWithImpl<$Res>
    implements $GitlabAccModelCopyWith<$Res> {
  _$GitlabAccModelCopyWithImpl(this._self, this._then);

  final GitlabAccModel _self;
  final $Res Function(GitlabAccModel) _then;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokenHash = null,Object? username = null,Object? name = null,Object? avatarUrl = null,Object? bio = null,Object? gitlabId = null,Object? accessLevel = freezed,Object? domain = null,Object? clientId = null,}) {
  return _then(GitlabAccModel(
tokenHash: null == tokenHash ? _self.tokenHash : tokenHash // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,gitlabId: null == gitlabId ? _self.gitlabId : gitlabId // ignore: cast_nullable_to_non_nullable
as int,accessLevel: freezed == accessLevel ? _self.accessLevel : accessLevel // ignore: cast_nullable_to_non_nullable
as int?,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
