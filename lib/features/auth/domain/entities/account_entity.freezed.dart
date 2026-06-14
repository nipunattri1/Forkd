// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountEntity {

 String get tokenHash; String get avatarUrl; String get domain;
/// Create a copy of AccountEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountEntityCopyWith<AccountEntity> get copyWith => _$AccountEntityCopyWithImpl<AccountEntity>(this as AccountEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountEntity&&(identical(other.tokenHash, tokenHash) || other.tokenHash == tokenHash)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.domain, domain) || other.domain == domain));
}


@override
int get hashCode => Object.hash(runtimeType,tokenHash,avatarUrl,domain);

@override
String toString() {
  return 'AccountEntity(tokenHash: $tokenHash, avatarUrl: $avatarUrl, domain: $domain)';
}


}

/// @nodoc
abstract mixin class $AccountEntityCopyWith<$Res>  {
  factory $AccountEntityCopyWith(AccountEntity value, $Res Function(AccountEntity) _then) = _$AccountEntityCopyWithImpl;
@useResult
$Res call({
 String tokenHash, String avatarUrl, String domain
});




}
/// @nodoc
class _$AccountEntityCopyWithImpl<$Res>
    implements $AccountEntityCopyWith<$Res> {
  _$AccountEntityCopyWithImpl(this._self, this._then);

  final AccountEntity _self;
  final $Res Function(AccountEntity) _then;

/// Create a copy of AccountEntity
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


/// Adds pattern-matching-related methods to [AccountEntity].
extension AccountEntityPatterns on AccountEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GithubAccountEntity value)?  github,TResult Function( GitlabAccountEntity value)?  gitlab,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GithubAccountEntity() when github != null:
return github(_that);case GitlabAccountEntity() when gitlab != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GithubAccountEntity value)  github,required TResult Function( GitlabAccountEntity value)  gitlab,}){
final _that = this;
switch (_that) {
case GithubAccountEntity():
return github(_that);case GitlabAccountEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GithubAccountEntity value)?  github,TResult? Function( GitlabAccountEntity value)?  gitlab,}){
final _that = this;
switch (_that) {
case GithubAccountEntity() when github != null:
return github(_that);case GitlabAccountEntity() when gitlab != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String tokenHash,  String login,  String avatarUrl,  String domain)?  github,TResult Function( String tokenHash,  String username,  String name,  String avatarUrl,  String bio,  int gitlabId,  int? accessLevel,  String domain)?  gitlab,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GithubAccountEntity() when github != null:
return github(_that.tokenHash,_that.login,_that.avatarUrl,_that.domain);case GitlabAccountEntity() when gitlab != null:
return gitlab(_that.tokenHash,_that.username,_that.name,_that.avatarUrl,_that.bio,_that.gitlabId,_that.accessLevel,_that.domain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String tokenHash,  String login,  String avatarUrl,  String domain)  github,required TResult Function( String tokenHash,  String username,  String name,  String avatarUrl,  String bio,  int gitlabId,  int? accessLevel,  String domain)  gitlab,}) {final _that = this;
switch (_that) {
case GithubAccountEntity():
return github(_that.tokenHash,_that.login,_that.avatarUrl,_that.domain);case GitlabAccountEntity():
return gitlab(_that.tokenHash,_that.username,_that.name,_that.avatarUrl,_that.bio,_that.gitlabId,_that.accessLevel,_that.domain);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String tokenHash,  String login,  String avatarUrl,  String domain)?  github,TResult? Function( String tokenHash,  String username,  String name,  String avatarUrl,  String bio,  int gitlabId,  int? accessLevel,  String domain)?  gitlab,}) {final _that = this;
switch (_that) {
case GithubAccountEntity() when github != null:
return github(_that.tokenHash,_that.login,_that.avatarUrl,_that.domain);case GitlabAccountEntity() when gitlab != null:
return gitlab(_that.tokenHash,_that.username,_that.name,_that.avatarUrl,_that.bio,_that.gitlabId,_that.accessLevel,_that.domain);case _:
  return null;

}
}

}

/// @nodoc


class GithubAccountEntity extends AccountEntity {
  const GithubAccountEntity({required this.tokenHash, required this.login, required this.avatarUrl, required this.domain}): super._();
  

@override final  String tokenHash;
 final  String login;
@override final  String avatarUrl;
@override final  String domain;

/// Create a copy of AccountEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GithubAccountEntityCopyWith<GithubAccountEntity> get copyWith => _$GithubAccountEntityCopyWithImpl<GithubAccountEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GithubAccountEntity&&(identical(other.tokenHash, tokenHash) || other.tokenHash == tokenHash)&&(identical(other.login, login) || other.login == login)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.domain, domain) || other.domain == domain));
}


@override
int get hashCode => Object.hash(runtimeType,tokenHash,login,avatarUrl,domain);

@override
String toString() {
  return 'AccountEntity.github(tokenHash: $tokenHash, login: $login, avatarUrl: $avatarUrl, domain: $domain)';
}


}

/// @nodoc
abstract mixin class $GithubAccountEntityCopyWith<$Res> implements $AccountEntityCopyWith<$Res> {
  factory $GithubAccountEntityCopyWith(GithubAccountEntity value, $Res Function(GithubAccountEntity) _then) = _$GithubAccountEntityCopyWithImpl;
@override @useResult
$Res call({
 String tokenHash, String login, String avatarUrl, String domain
});




}
/// @nodoc
class _$GithubAccountEntityCopyWithImpl<$Res>
    implements $GithubAccountEntityCopyWith<$Res> {
  _$GithubAccountEntityCopyWithImpl(this._self, this._then);

  final GithubAccountEntity _self;
  final $Res Function(GithubAccountEntity) _then;

/// Create a copy of AccountEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokenHash = null,Object? login = null,Object? avatarUrl = null,Object? domain = null,}) {
  return _then(GithubAccountEntity(
tokenHash: null == tokenHash ? _self.tokenHash : tokenHash // ignore: cast_nullable_to_non_nullable
as String,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GitlabAccountEntity extends AccountEntity {
  const GitlabAccountEntity({required this.tokenHash, required this.username, required this.name, required this.avatarUrl, required this.bio, required this.gitlabId, required this.accessLevel, required this.domain}): super._();
  

@override final  String tokenHash;
 final  String username;
 final  String name;
@override final  String avatarUrl;
 final  String bio;
 final  int gitlabId;
 final  int? accessLevel;
@override final  String domain;

/// Create a copy of AccountEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GitlabAccountEntityCopyWith<GitlabAccountEntity> get copyWith => _$GitlabAccountEntityCopyWithImpl<GitlabAccountEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GitlabAccountEntity&&(identical(other.tokenHash, tokenHash) || other.tokenHash == tokenHash)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.gitlabId, gitlabId) || other.gitlabId == gitlabId)&&(identical(other.accessLevel, accessLevel) || other.accessLevel == accessLevel)&&(identical(other.domain, domain) || other.domain == domain));
}


@override
int get hashCode => Object.hash(runtimeType,tokenHash,username,name,avatarUrl,bio,gitlabId,accessLevel,domain);

@override
String toString() {
  return 'AccountEntity.gitlab(tokenHash: $tokenHash, username: $username, name: $name, avatarUrl: $avatarUrl, bio: $bio, gitlabId: $gitlabId, accessLevel: $accessLevel, domain: $domain)';
}


}

/// @nodoc
abstract mixin class $GitlabAccountEntityCopyWith<$Res> implements $AccountEntityCopyWith<$Res> {
  factory $GitlabAccountEntityCopyWith(GitlabAccountEntity value, $Res Function(GitlabAccountEntity) _then) = _$GitlabAccountEntityCopyWithImpl;
@override @useResult
$Res call({
 String tokenHash, String username, String name, String avatarUrl, String bio, int gitlabId, int? accessLevel, String domain
});




}
/// @nodoc
class _$GitlabAccountEntityCopyWithImpl<$Res>
    implements $GitlabAccountEntityCopyWith<$Res> {
  _$GitlabAccountEntityCopyWithImpl(this._self, this._then);

  final GitlabAccountEntity _self;
  final $Res Function(GitlabAccountEntity) _then;

/// Create a copy of AccountEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokenHash = null,Object? username = null,Object? name = null,Object? avatarUrl = null,Object? bio = null,Object? gitlabId = null,Object? accessLevel = freezed,Object? domain = null,}) {
  return _then(GitlabAccountEntity(
tokenHash: null == tokenHash ? _self.tokenHash : tokenHash // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,gitlabId: null == gitlabId ? _self.gitlabId : gitlabId // ignore: cast_nullable_to_non_nullable
as int,accessLevel: freezed == accessLevel ? _self.accessLevel : accessLevel // ignore: cast_nullable_to_non_nullable
as int?,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
