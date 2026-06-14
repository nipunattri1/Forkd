// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkError()';
}


}

/// @nodoc
class $NetworkErrorCopyWith<$Res>  {
$NetworkErrorCopyWith(NetworkError _, $Res Function(NetworkError) __);
}


/// Adds pattern-matching-related methods to [NetworkError].
extension NetworkErrorPatterns on NetworkError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NetworkNoRefreshToken value)?  noRefreshToken,TResult Function( _NetworkUnknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkNoRefreshToken() when noRefreshToken != null:
return noRefreshToken(_that);case _NetworkUnknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NetworkNoRefreshToken value)  noRefreshToken,required TResult Function( _NetworkUnknown value)  unknown,}){
final _that = this;
switch (_that) {
case _NetworkNoRefreshToken():
return noRefreshToken(_that);case _NetworkUnknown():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NetworkNoRefreshToken value)?  noRefreshToken,TResult? Function( _NetworkUnknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _NetworkNoRefreshToken() when noRefreshToken != null:
return noRefreshToken(_that);case _NetworkUnknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  noRefreshToken,TResult Function( Exception exception)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkNoRefreshToken() when noRefreshToken != null:
return noRefreshToken();case _NetworkUnknown() when unknown != null:
return unknown(_that.exception);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  noRefreshToken,required TResult Function( Exception exception)  unknown,}) {final _that = this;
switch (_that) {
case _NetworkNoRefreshToken():
return noRefreshToken();case _NetworkUnknown():
return unknown(_that.exception);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  noRefreshToken,TResult? Function( Exception exception)?  unknown,}) {final _that = this;
switch (_that) {
case _NetworkNoRefreshToken() when noRefreshToken != null:
return noRefreshToken();case _NetworkUnknown() when unknown != null:
return unknown(_that.exception);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkNoRefreshToken extends NetworkError {
   _NetworkNoRefreshToken(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkNoRefreshToken);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkError.noRefreshToken()';
}


}




/// @nodoc


class _NetworkUnknown extends NetworkError {
   _NetworkUnknown(this.exception): super._();
  

 final  Exception exception;

/// Create a copy of NetworkError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkUnknownCopyWith<_NetworkUnknown> get copyWith => __$NetworkUnknownCopyWithImpl<_NetworkUnknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkUnknown&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,exception);

@override
String toString() {
  return 'NetworkError.unknown(exception: $exception)';
}


}

/// @nodoc
abstract mixin class _$NetworkUnknownCopyWith<$Res> implements $NetworkErrorCopyWith<$Res> {
  factory _$NetworkUnknownCopyWith(_NetworkUnknown value, $Res Function(_NetworkUnknown) _then) = __$NetworkUnknownCopyWithImpl;
@useResult
$Res call({
 Exception exception
});




}
/// @nodoc
class __$NetworkUnknownCopyWithImpl<$Res>
    implements _$NetworkUnknownCopyWith<$Res> {
  __$NetworkUnknownCopyWithImpl(this._self, this._then);

  final _NetworkUnknown _self;
  final $Res Function(_NetworkUnknown) _then;

/// Create a copy of NetworkError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exception = null,}) {
  return _then(_NetworkUnknown(
null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as Exception,
  ));
}


}

/// @nodoc
mixin _$AuthError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthError()';
}


}

/// @nodoc
class $AuthErrorCopyWith<$Res>  {
$AuthErrorCopyWith(AuthError _, $Res Function(AuthError) __);
}


/// Adds pattern-matching-related methods to [AuthError].
extension AuthErrorPatterns on AuthError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthLaunchError value)?  launchError,TResult Function( _AuthTimeOutError value)?  timeout,TResult Function( _AuthUnknownError value)?  unknown,TResult Function( _AuthSecurityError value)?  securityFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthLaunchError() when launchError != null:
return launchError(_that);case _AuthTimeOutError() when timeout != null:
return timeout(_that);case _AuthUnknownError() when unknown != null:
return unknown(_that);case _AuthSecurityError() when securityFailure != null:
return securityFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthLaunchError value)  launchError,required TResult Function( _AuthTimeOutError value)  timeout,required TResult Function( _AuthUnknownError value)  unknown,required TResult Function( _AuthSecurityError value)  securityFailure,}){
final _that = this;
switch (_that) {
case _AuthLaunchError():
return launchError(_that);case _AuthTimeOutError():
return timeout(_that);case _AuthUnknownError():
return unknown(_that);case _AuthSecurityError():
return securityFailure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthLaunchError value)?  launchError,TResult? Function( _AuthTimeOutError value)?  timeout,TResult? Function( _AuthUnknownError value)?  unknown,TResult? Function( _AuthSecurityError value)?  securityFailure,}){
final _that = this;
switch (_that) {
case _AuthLaunchError() when launchError != null:
return launchError(_that);case _AuthTimeOutError() when timeout != null:
return timeout(_that);case _AuthUnknownError() when unknown != null:
return unknown(_that);case _AuthSecurityError() when securityFailure != null:
return securityFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  launchError,TResult Function()?  timeout,TResult Function()?  unknown,TResult Function()?  securityFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthLaunchError() when launchError != null:
return launchError();case _AuthTimeOutError() when timeout != null:
return timeout();case _AuthUnknownError() when unknown != null:
return unknown();case _AuthSecurityError() when securityFailure != null:
return securityFailure();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  launchError,required TResult Function()  timeout,required TResult Function()  unknown,required TResult Function()  securityFailure,}) {final _that = this;
switch (_that) {
case _AuthLaunchError():
return launchError();case _AuthTimeOutError():
return timeout();case _AuthUnknownError():
return unknown();case _AuthSecurityError():
return securityFailure();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  launchError,TResult? Function()?  timeout,TResult? Function()?  unknown,TResult? Function()?  securityFailure,}) {final _that = this;
switch (_that) {
case _AuthLaunchError() when launchError != null:
return launchError();case _AuthTimeOutError() when timeout != null:
return timeout();case _AuthUnknownError() when unknown != null:
return unknown();case _AuthSecurityError() when securityFailure != null:
return securityFailure();case _:
  return null;

}
}

}

/// @nodoc


class _AuthLaunchError extends AuthError {
   _AuthLaunchError(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLaunchError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthError.launchError()';
}


}




/// @nodoc


class _AuthTimeOutError extends AuthError {
   _AuthTimeOutError(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthTimeOutError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthError.timeout()';
}


}




/// @nodoc


class _AuthUnknownError extends AuthError {
   _AuthUnknownError(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUnknownError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthError.unknown()';
}


}




/// @nodoc


class _AuthSecurityError extends AuthError {
   _AuthSecurityError(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSecurityError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthError.securityFailure()';
}


}




// dart format on
