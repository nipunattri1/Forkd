// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AddGithubAccountEvent value)?  addGithubOAuthAccount,TResult Function( _AddGitlabOAuthAccountEvent value)?  addGitlabOAuthAccount,TResult Function( _AddGitlabTokenAccountEvent value)?  addGitlabTokenAccount,TResult Function( _HydarateAuth value)?  hydrate,TResult Function( _RemoveForkdAccountEvent value)?  removeforkdAccount,TResult Function( _SetActiveAccountEvent value)?  setActiveAccount,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddGithubAccountEvent() when addGithubOAuthAccount != null:
return addGithubOAuthAccount(_that);case _AddGitlabOAuthAccountEvent() when addGitlabOAuthAccount != null:
return addGitlabOAuthAccount(_that);case _AddGitlabTokenAccountEvent() when addGitlabTokenAccount != null:
return addGitlabTokenAccount(_that);case _HydarateAuth() when hydrate != null:
return hydrate(_that);case _RemoveForkdAccountEvent() when removeforkdAccount != null:
return removeforkdAccount(_that);case _SetActiveAccountEvent() when setActiveAccount != null:
return setActiveAccount(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AddGithubAccountEvent value)  addGithubOAuthAccount,required TResult Function( _AddGitlabOAuthAccountEvent value)  addGitlabOAuthAccount,required TResult Function( _AddGitlabTokenAccountEvent value)  addGitlabTokenAccount,required TResult Function( _HydarateAuth value)  hydrate,required TResult Function( _RemoveForkdAccountEvent value)  removeforkdAccount,required TResult Function( _SetActiveAccountEvent value)  setActiveAccount,}){
final _that = this;
switch (_that) {
case _AddGithubAccountEvent():
return addGithubOAuthAccount(_that);case _AddGitlabOAuthAccountEvent():
return addGitlabOAuthAccount(_that);case _AddGitlabTokenAccountEvent():
return addGitlabTokenAccount(_that);case _HydarateAuth():
return hydrate(_that);case _RemoveForkdAccountEvent():
return removeforkdAccount(_that);case _SetActiveAccountEvent():
return setActiveAccount(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AddGithubAccountEvent value)?  addGithubOAuthAccount,TResult? Function( _AddGitlabOAuthAccountEvent value)?  addGitlabOAuthAccount,TResult? Function( _AddGitlabTokenAccountEvent value)?  addGitlabTokenAccount,TResult? Function( _HydarateAuth value)?  hydrate,TResult? Function( _RemoveForkdAccountEvent value)?  removeforkdAccount,TResult? Function( _SetActiveAccountEvent value)?  setActiveAccount,}){
final _that = this;
switch (_that) {
case _AddGithubAccountEvent() when addGithubOAuthAccount != null:
return addGithubOAuthAccount(_that);case _AddGitlabOAuthAccountEvent() when addGitlabOAuthAccount != null:
return addGitlabOAuthAccount(_that);case _AddGitlabTokenAccountEvent() when addGitlabTokenAccount != null:
return addGitlabTokenAccount(_that);case _HydarateAuth() when hydrate != null:
return hydrate(_that);case _RemoveForkdAccountEvent() when removeforkdAccount != null:
return removeforkdAccount(_that);case _SetActiveAccountEvent() when setActiveAccount != null:
return setActiveAccount(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  addGithubOAuthAccount,TResult Function( String domain)?  addGitlabOAuthAccount,TResult Function( String token,  String domain)?  addGitlabTokenAccount,TResult Function()?  hydrate,TResult Function( AccountEntity account)?  removeforkdAccount,TResult Function( AccountEntity account)?  setActiveAccount,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddGithubAccountEvent() when addGithubOAuthAccount != null:
return addGithubOAuthAccount();case _AddGitlabOAuthAccountEvent() when addGitlabOAuthAccount != null:
return addGitlabOAuthAccount(_that.domain);case _AddGitlabTokenAccountEvent() when addGitlabTokenAccount != null:
return addGitlabTokenAccount(_that.token,_that.domain);case _HydarateAuth() when hydrate != null:
return hydrate();case _RemoveForkdAccountEvent() when removeforkdAccount != null:
return removeforkdAccount(_that.account);case _SetActiveAccountEvent() when setActiveAccount != null:
return setActiveAccount(_that.account);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  addGithubOAuthAccount,required TResult Function( String domain)  addGitlabOAuthAccount,required TResult Function( String token,  String domain)  addGitlabTokenAccount,required TResult Function()  hydrate,required TResult Function( AccountEntity account)  removeforkdAccount,required TResult Function( AccountEntity account)  setActiveAccount,}) {final _that = this;
switch (_that) {
case _AddGithubAccountEvent():
return addGithubOAuthAccount();case _AddGitlabOAuthAccountEvent():
return addGitlabOAuthAccount(_that.domain);case _AddGitlabTokenAccountEvent():
return addGitlabTokenAccount(_that.token,_that.domain);case _HydarateAuth():
return hydrate();case _RemoveForkdAccountEvent():
return removeforkdAccount(_that.account);case _SetActiveAccountEvent():
return setActiveAccount(_that.account);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  addGithubOAuthAccount,TResult? Function( String domain)?  addGitlabOAuthAccount,TResult? Function( String token,  String domain)?  addGitlabTokenAccount,TResult? Function()?  hydrate,TResult? Function( AccountEntity account)?  removeforkdAccount,TResult? Function( AccountEntity account)?  setActiveAccount,}) {final _that = this;
switch (_that) {
case _AddGithubAccountEvent() when addGithubOAuthAccount != null:
return addGithubOAuthAccount();case _AddGitlabOAuthAccountEvent() when addGitlabOAuthAccount != null:
return addGitlabOAuthAccount(_that.domain);case _AddGitlabTokenAccountEvent() when addGitlabTokenAccount != null:
return addGitlabTokenAccount(_that.token,_that.domain);case _HydarateAuth() when hydrate != null:
return hydrate();case _RemoveForkdAccountEvent() when removeforkdAccount != null:
return removeforkdAccount(_that.account);case _SetActiveAccountEvent() when setActiveAccount != null:
return setActiveAccount(_that.account);case _:
  return null;

}
}

}

/// @nodoc


class _AddGithubAccountEvent with DiagnosticableTreeMixin implements AuthEvent {
  const _AddGithubAccountEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.addGithubOAuthAccount'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddGithubAccountEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.addGithubOAuthAccount()';
}


}




/// @nodoc


class _AddGitlabOAuthAccountEvent with DiagnosticableTreeMixin implements AuthEvent {
  const _AddGitlabOAuthAccountEvent({required this.domain});
  

 final  String domain;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddGitlabOAuthAccountEventCopyWith<_AddGitlabOAuthAccountEvent> get copyWith => __$AddGitlabOAuthAccountEventCopyWithImpl<_AddGitlabOAuthAccountEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.addGitlabOAuthAccount'))
    ..add(DiagnosticsProperty('domain', domain));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddGitlabOAuthAccountEvent&&(identical(other.domain, domain) || other.domain == domain));
}


@override
int get hashCode => Object.hash(runtimeType,domain);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.addGitlabOAuthAccount(domain: $domain)';
}


}

/// @nodoc
abstract mixin class _$AddGitlabOAuthAccountEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AddGitlabOAuthAccountEventCopyWith(_AddGitlabOAuthAccountEvent value, $Res Function(_AddGitlabOAuthAccountEvent) _then) = __$AddGitlabOAuthAccountEventCopyWithImpl;
@useResult
$Res call({
 String domain
});




}
/// @nodoc
class __$AddGitlabOAuthAccountEventCopyWithImpl<$Res>
    implements _$AddGitlabOAuthAccountEventCopyWith<$Res> {
  __$AddGitlabOAuthAccountEventCopyWithImpl(this._self, this._then);

  final _AddGitlabOAuthAccountEvent _self;
  final $Res Function(_AddGitlabOAuthAccountEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? domain = null,}) {
  return _then(_AddGitlabOAuthAccountEvent(
domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AddGitlabTokenAccountEvent with DiagnosticableTreeMixin implements AuthEvent {
  const _AddGitlabTokenAccountEvent({required this.token, this.domain = 'gitlab.com'});
  

 final  String token;
@JsonKey() final  String domain;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddGitlabTokenAccountEventCopyWith<_AddGitlabTokenAccountEvent> get copyWith => __$AddGitlabTokenAccountEventCopyWithImpl<_AddGitlabTokenAccountEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.addGitlabTokenAccount'))
    ..add(DiagnosticsProperty('token', token))..add(DiagnosticsProperty('domain', domain));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddGitlabTokenAccountEvent&&(identical(other.token, token) || other.token == token)&&(identical(other.domain, domain) || other.domain == domain));
}


@override
int get hashCode => Object.hash(runtimeType,token,domain);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.addGitlabTokenAccount(token: $token, domain: $domain)';
}


}

/// @nodoc
abstract mixin class _$AddGitlabTokenAccountEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$AddGitlabTokenAccountEventCopyWith(_AddGitlabTokenAccountEvent value, $Res Function(_AddGitlabTokenAccountEvent) _then) = __$AddGitlabTokenAccountEventCopyWithImpl;
@useResult
$Res call({
 String token, String domain
});




}
/// @nodoc
class __$AddGitlabTokenAccountEventCopyWithImpl<$Res>
    implements _$AddGitlabTokenAccountEventCopyWith<$Res> {
  __$AddGitlabTokenAccountEventCopyWithImpl(this._self, this._then);

  final _AddGitlabTokenAccountEvent _self;
  final $Res Function(_AddGitlabTokenAccountEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,Object? domain = null,}) {
  return _then(_AddGitlabTokenAccountEvent(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _HydarateAuth with DiagnosticableTreeMixin implements AuthEvent {
  const _HydarateAuth();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.hydrate'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HydarateAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.hydrate()';
}


}




/// @nodoc


class _RemoveForkdAccountEvent with DiagnosticableTreeMixin implements AuthEvent {
  const _RemoveForkdAccountEvent(this.account);
  

 final  AccountEntity account;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveForkdAccountEventCopyWith<_RemoveForkdAccountEvent> get copyWith => __$RemoveForkdAccountEventCopyWithImpl<_RemoveForkdAccountEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.removeforkdAccount'))
    ..add(DiagnosticsProperty('account', account));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveForkdAccountEvent&&(identical(other.account, account) || other.account == account));
}


@override
int get hashCode => Object.hash(runtimeType,account);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.removeforkdAccount(account: $account)';
}


}

/// @nodoc
abstract mixin class _$RemoveForkdAccountEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RemoveForkdAccountEventCopyWith(_RemoveForkdAccountEvent value, $Res Function(_RemoveForkdAccountEvent) _then) = __$RemoveForkdAccountEventCopyWithImpl;
@useResult
$Res call({
 AccountEntity account
});


$AccountEntityCopyWith<$Res> get account;

}
/// @nodoc
class __$RemoveForkdAccountEventCopyWithImpl<$Res>
    implements _$RemoveForkdAccountEventCopyWith<$Res> {
  __$RemoveForkdAccountEventCopyWithImpl(this._self, this._then);

  final _RemoveForkdAccountEvent _self;
  final $Res Function(_RemoveForkdAccountEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? account = null,}) {
  return _then(_RemoveForkdAccountEvent(
null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountEntity,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountEntityCopyWith<$Res> get account {
  
  return $AccountEntityCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

/// @nodoc


class _SetActiveAccountEvent with DiagnosticableTreeMixin implements AuthEvent {
  const _SetActiveAccountEvent(this.account);
  

 final  AccountEntity account;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetActiveAccountEventCopyWith<_SetActiveAccountEvent> get copyWith => __$SetActiveAccountEventCopyWithImpl<_SetActiveAccountEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.setActiveAccount'))
    ..add(DiagnosticsProperty('account', account));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetActiveAccountEvent&&(identical(other.account, account) || other.account == account));
}


@override
int get hashCode => Object.hash(runtimeType,account);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.setActiveAccount(account: $account)';
}


}

/// @nodoc
abstract mixin class _$SetActiveAccountEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$SetActiveAccountEventCopyWith(_SetActiveAccountEvent value, $Res Function(_SetActiveAccountEvent) _then) = __$SetActiveAccountEventCopyWithImpl;
@useResult
$Res call({
 AccountEntity account
});


$AccountEntityCopyWith<$Res> get account;

}
/// @nodoc
class __$SetActiveAccountEventCopyWithImpl<$Res>
    implements _$SetActiveAccountEventCopyWith<$Res> {
  __$SetActiveAccountEventCopyWithImpl(this._self, this._then);

  final _SetActiveAccountEvent _self;
  final $Res Function(_SetActiveAccountEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? account = null,}) {
  return _then(_SetActiveAccountEvent(
null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountEntity,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountEntityCopyWith<$Res> get account {
  
  return $AccountEntityCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

/// @nodoc
mixin _$AuthState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthLoading value)?  loading,TResult Function( _AuthData value)?  data,TResult Function( _AuthError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthLoading() when loading != null:
return loading(_that);case _AuthData() when data != null:
return data(_that);case _AuthError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthLoading value)  loading,required TResult Function( _AuthData value)  data,required TResult Function( _AuthError value)  error,}){
final _that = this;
switch (_that) {
case _AuthLoading():
return loading(_that);case _AuthData():
return data(_that);case _AuthError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthLoading value)?  loading,TResult? Function( _AuthData value)?  data,TResult? Function( _AuthError value)?  error,}){
final _that = this;
switch (_that) {
case _AuthLoading() when loading != null:
return loading(_that);case _AuthData() when data != null:
return data(_that);case _AuthError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<AccountEntity> accounts,  AccountEntity? activeAccount)?  data,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthLoading() when loading != null:
return loading();case _AuthData() when data != null:
return data(_that.accounts,_that.activeAccount);case _AuthError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<AccountEntity> accounts,  AccountEntity? activeAccount)  data,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _AuthLoading():
return loading();case _AuthData():
return data(_that.accounts,_that.activeAccount);case _AuthError():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<AccountEntity> accounts,  AccountEntity? activeAccount)?  data,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _AuthLoading() when loading != null:
return loading();case _AuthData() when data != null:
return data(_that.accounts,_that.activeAccount);case _AuthError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AuthLoading with DiagnosticableTreeMixin implements AuthState {
  const _AuthLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _AuthData with DiagnosticableTreeMixin implements AuthState {
  const _AuthData({required final  List<AccountEntity> accounts, required this.activeAccount}): _accounts = accounts;
  

 final  List<AccountEntity> _accounts;
 List<AccountEntity> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}

 final  AccountEntity? activeAccount;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthDataCopyWith<_AuthData> get copyWith => __$AuthDataCopyWithImpl<_AuthData>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.data'))
    ..add(DiagnosticsProperty('accounts', accounts))..add(DiagnosticsProperty('activeAccount', activeAccount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthData&&const DeepCollectionEquality().equals(other._accounts, _accounts)&&(identical(other.activeAccount, activeAccount) || other.activeAccount == activeAccount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_accounts),activeAccount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.data(accounts: $accounts, activeAccount: $activeAccount)';
}


}

/// @nodoc
abstract mixin class _$AuthDataCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthDataCopyWith(_AuthData value, $Res Function(_AuthData) _then) = __$AuthDataCopyWithImpl;
@useResult
$Res call({
 List<AccountEntity> accounts, AccountEntity? activeAccount
});


$AccountEntityCopyWith<$Res>? get activeAccount;

}
/// @nodoc
class __$AuthDataCopyWithImpl<$Res>
    implements _$AuthDataCopyWith<$Res> {
  __$AuthDataCopyWithImpl(this._self, this._then);

  final _AuthData _self;
  final $Res Function(_AuthData) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accounts = null,Object? activeAccount = freezed,}) {
  return _then(_AuthData(
accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<AccountEntity>,activeAccount: freezed == activeAccount ? _self.activeAccount : activeAccount // ignore: cast_nullable_to_non_nullable
as AccountEntity?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountEntityCopyWith<$Res>? get activeAccount {
    if (_self.activeAccount == null) {
    return null;
  }

  return $AccountEntityCopyWith<$Res>(_self.activeAccount!, (value) {
    return _then(_self.copyWith(activeAccount: value));
  });
}
}

/// @nodoc


class _AuthError with DiagnosticableTreeMixin implements AuthState {
  const _AuthError({required this.error});
  

 final  String error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthErrorCopyWith<_AuthError> get copyWith => __$AuthErrorCopyWithImpl<_AuthError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.error'))
    ..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$AuthErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthErrorCopyWith(_AuthError value, $Res Function(_AuthError) _then) = __$AuthErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$AuthErrorCopyWithImpl<$Res>
    implements _$AuthErrorCopyWith<$Res> {
  __$AuthErrorCopyWithImpl(this._self, this._then);

  final _AuthError _self;
  final $Res Function(_AuthError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_AuthError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
