// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardBlocEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DashboardBlocEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardBlocEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DashboardBlocEvent()';
}


}

/// @nodoc
class $DashboardBlocEventCopyWith<$Res>  {
$DashboardBlocEventCopyWith(DashboardBlocEvent _, $Res Function(DashboardBlocEvent) __);
}


/// Adds pattern-matching-related methods to [DashboardBlocEvent].
extension DashboardBlocEventPatterns on DashboardBlocEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadDataEvent value)?  reloadData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadDataEvent() when reloadData != null:
return reloadData(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadDataEvent value)  reloadData,}){
final _that = this;
switch (_that) {
case _LoadDataEvent():
return reloadData(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadDataEvent value)?  reloadData,}){
final _that = this;
switch (_that) {
case _LoadDataEvent() when reloadData != null:
return reloadData(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  reloadData,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadDataEvent() when reloadData != null:
return reloadData();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  reloadData,}) {final _that = this;
switch (_that) {
case _LoadDataEvent():
return reloadData();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  reloadData,}) {final _that = this;
switch (_that) {
case _LoadDataEvent() when reloadData != null:
return reloadData();case _:
  return null;

}
}

}

/// @nodoc


class _LoadDataEvent with DiagnosticableTreeMixin implements DashboardBlocEvent {
  const _LoadDataEvent();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DashboardBlocEvent.reloadData'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadDataEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DashboardBlocEvent.reloadData()';
}


}




/// @nodoc
mixin _$DashboardBlocState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DashboardBlocState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardBlocState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DashboardBlocState()';
}


}

/// @nodoc
class $DashboardBlocStateCopyWith<$Res>  {
$DashboardBlocStateCopyWith(DashboardBlocState _, $Res Function(DashboardBlocState) __);
}


/// Adds pattern-matching-related methods to [DashboardBlocState].
extension DashboardBlocStatePatterns on DashboardBlocState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DashboardLoading value)?  loading,TResult Function( _DashboardData value)?  data,TResult Function( _DashboardError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardLoading() when loading != null:
return loading(_that);case _DashboardData() when data != null:
return data(_that);case _DashboardError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DashboardLoading value)  loading,required TResult Function( _DashboardData value)  data,required TResult Function( _DashboardError value)  error,}){
final _that = this;
switch (_that) {
case _DashboardLoading():
return loading(_that);case _DashboardData():
return data(_that);case _DashboardError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DashboardLoading value)?  loading,TResult? Function( _DashboardData value)?  data,TResult? Function( _DashboardError value)?  error,}){
final _that = this;
switch (_that) {
case _DashboardLoading() when loading != null:
return loading(_that);case _DashboardData() when data != null:
return data(_that);case _DashboardError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( DashboardEntity data)?  data,TResult Function( Exception err)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardLoading() when loading != null:
return loading();case _DashboardData() when data != null:
return data(_that.data);case _DashboardError() when error != null:
return error(_that.err);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( DashboardEntity data)  data,required TResult Function( Exception err)  error,}) {final _that = this;
switch (_that) {
case _DashboardLoading():
return loading();case _DashboardData():
return data(_that.data);case _DashboardError():
return error(_that.err);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( DashboardEntity data)?  data,TResult? Function( Exception err)?  error,}) {final _that = this;
switch (_that) {
case _DashboardLoading() when loading != null:
return loading();case _DashboardData() when data != null:
return data(_that.data);case _DashboardError() when error != null:
return error(_that.err);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardLoading with DiagnosticableTreeMixin implements DashboardBlocState {
  const _DashboardLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DashboardBlocState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DashboardBlocState.loading()';
}


}




/// @nodoc


class _DashboardData with DiagnosticableTreeMixin implements DashboardBlocState {
  const _DashboardData({required this.data});
  

 final  DashboardEntity data;

/// Create a copy of DashboardBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardDataCopyWith<_DashboardData> get copyWith => __$DashboardDataCopyWithImpl<_DashboardData>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DashboardBlocState.data'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardData&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DashboardBlocState.data(data: $data)';
}


}

/// @nodoc
abstract mixin class _$DashboardDataCopyWith<$Res> implements $DashboardBlocStateCopyWith<$Res> {
  factory _$DashboardDataCopyWith(_DashboardData value, $Res Function(_DashboardData) _then) = __$DashboardDataCopyWithImpl;
@useResult
$Res call({
 DashboardEntity data
});




}
/// @nodoc
class __$DashboardDataCopyWithImpl<$Res>
    implements _$DashboardDataCopyWith<$Res> {
  __$DashboardDataCopyWithImpl(this._self, this._then);

  final _DashboardData _self;
  final $Res Function(_DashboardData) _then;

/// Create a copy of DashboardBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_DashboardData(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DashboardEntity,
  ));
}


}

/// @nodoc


class _DashboardError with DiagnosticableTreeMixin implements DashboardBlocState {
  const _DashboardError({required this.err});
  

 final  Exception err;

/// Create a copy of DashboardBlocState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardErrorCopyWith<_DashboardError> get copyWith => __$DashboardErrorCopyWithImpl<_DashboardError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DashboardBlocState.error'))
    ..add(DiagnosticsProperty('err', err));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardError&&(identical(other.err, err) || other.err == err));
}


@override
int get hashCode => Object.hash(runtimeType,err);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DashboardBlocState.error(err: $err)';
}


}

/// @nodoc
abstract mixin class _$DashboardErrorCopyWith<$Res> implements $DashboardBlocStateCopyWith<$Res> {
  factory _$DashboardErrorCopyWith(_DashboardError value, $Res Function(_DashboardError) _then) = __$DashboardErrorCopyWithImpl;
@useResult
$Res call({
 Exception err
});




}
/// @nodoc
class __$DashboardErrorCopyWithImpl<$Res>
    implements _$DashboardErrorCopyWith<$Res> {
  __$DashboardErrorCopyWithImpl(this._self, this._then);

  final _DashboardError _self;
  final $Res Function(_DashboardError) _then;

/// Create a copy of DashboardBlocState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? err = null,}) {
  return _then(_DashboardError(
err: null == err ? _self.err : err // ignore: cast_nullable_to_non_nullable
as Exception,
  ));
}


}

// dart format on
