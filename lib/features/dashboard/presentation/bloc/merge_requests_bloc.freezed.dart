// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merge_requests_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MergeRequestsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MergeRequestsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'MergeRequestsEvent()';
}


}

/// @nodoc
class $MergeRequestsEventCopyWith<$Res>  {
$MergeRequestsEventCopyWith(MergeRequestsEvent _, $Res Function(MergeRequestsEvent) __);
}


/// Adds pattern-matching-related methods to [MergeRequestsEvent].
extension MergeRequestsEventPatterns on MergeRequestsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Refreshed value)?  refreshed,TResult Function( _FilterChanged value)?  filterChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refreshed() when refreshed != null:
return refreshed(_that);case _FilterChanged() when filterChanged != null:
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Refreshed value)  refreshed,required TResult Function( _FilterChanged value)  filterChanged,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Refreshed():
return refreshed(_that);case _FilterChanged():
return filterChanged(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Refreshed value)?  refreshed,TResult? Function( _FilterChanged value)?  filterChanged,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refreshed() when refreshed != null:
return refreshed(_that);case _FilterChanged() when filterChanged != null:
return filterChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshed,TResult Function( MergeRequestFilter filter)?  filterChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Refreshed() when refreshed != null:
return refreshed();case _FilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshed,required TResult Function( MergeRequestFilter filter)  filterChanged,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Refreshed():
return refreshed();case _FilterChanged():
return filterChanged(_that.filter);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshed,TResult? Function( MergeRequestFilter filter)?  filterChanged,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Refreshed() when refreshed != null:
return refreshed();case _FilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements MergeRequestsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'MergeRequestsEvent.started()';
}


}




/// @nodoc


class _Refreshed implements MergeRequestsEvent {
  const _Refreshed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'MergeRequestsEvent.refreshed()';
}


}




/// @nodoc


class _FilterChanged implements MergeRequestsEvent {
  const _FilterChanged(this.filter);
  

 final  MergeRequestFilter filter;

/// Create a copy of MergeRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterChangedCopyWith<_FilterChanged> get copyWith => __$FilterChangedCopyWithImpl<_FilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode {
    return Object.hash(runtimeType,filter);
}

@override
String toString() {
    return 'MergeRequestsEvent.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$FilterChangedCopyWith<$Res> implements $MergeRequestsEventCopyWith<$Res> {
  factory _$FilterChangedCopyWith(_FilterChanged value, $Res Function(_FilterChanged) _then) = __$FilterChangedCopyWithImpl;
@useResult
$Res call({
 MergeRequestFilter filter
});




}
/// @nodoc
class __$FilterChangedCopyWithImpl<$Res>
    implements _$FilterChangedCopyWith<$Res> {
  __$FilterChangedCopyWithImpl(this._self, this._then);

  final _FilterChanged _self;
  final $Res Function(_FilterChanged) _then;

/// Create a copy of MergeRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_FilterChanged(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as MergeRequestFilter,
  ));
}


}

/// @nodoc
mixin _$MergeRequestsState {

 MergeRequestFilter get filter;
/// Create a copy of MergeRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MergeRequestsStateCopyWith<MergeRequestsState> get copyWith => _$MergeRequestsStateCopyWithImpl<MergeRequestsState>(this as MergeRequestsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MergeRequestsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MergeRequestsState&&(identical(other.filter, _this.filter) || other.filter == _this.filter));
}


@override
int get hashCode {
  final _this = this as MergeRequestsState;
  return Object.hash(runtimeType,_this.filter);
}

@override
String toString() {
  final _this = this as MergeRequestsState;
  return 'MergeRequestsState(filter: ${_this.filter})';
}


}

/// @nodoc
abstract mixin class $MergeRequestsStateCopyWith<$Res>  {
  factory $MergeRequestsStateCopyWith(MergeRequestsState value, $Res Function(MergeRequestsState) _then) = _$MergeRequestsStateCopyWithImpl;
@useResult
$Res call({
 MergeRequestFilter filter
});




}
/// @nodoc
class _$MergeRequestsStateCopyWithImpl<$Res>
    implements $MergeRequestsStateCopyWith<$Res> {
  _$MergeRequestsStateCopyWithImpl(this._self, this._then);

  final MergeRequestsState _self;
  final $Res Function(MergeRequestsState) _then;

/// Create a copy of MergeRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,}) {
  return _then(_self.copyWith(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as MergeRequestFilter,
  ));
}

}


/// Adds pattern-matching-related methods to [MergeRequestsState].
extension MergeRequestsStatePatterns on MergeRequestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Data value)?  data,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Data() when data != null:
return data(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Data value)  data,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Data():
return data(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Data value)?  data,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Data() when data != null:
return data(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( MergeRequestFilter filter)?  loading,TResult Function( List<MergeRequestEntity> items,  MergeRequestFilter filter,  bool isRefreshing)?  data,TResult Function( Object err,  MergeRequestFilter filter)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that.filter);case _Data() when data != null:
return data(_that.items,_that.filter,_that.isRefreshing);case _Error() when error != null:
return error(_that.err,_that.filter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( MergeRequestFilter filter)  loading,required TResult Function( List<MergeRequestEntity> items,  MergeRequestFilter filter,  bool isRefreshing)  data,required TResult Function( Object err,  MergeRequestFilter filter)  error,}) {final _that = this;
switch (_that) {
case _Loading():
return loading(_that.filter);case _Data():
return data(_that.items,_that.filter,_that.isRefreshing);case _Error():
return error(_that.err,_that.filter);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( MergeRequestFilter filter)?  loading,TResult? Function( List<MergeRequestEntity> items,  MergeRequestFilter filter,  bool isRefreshing)?  data,TResult? Function( Object err,  MergeRequestFilter filter)?  error,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that.filter);case _Data() when data != null:
return data(_that.items,_that.filter,_that.isRefreshing);case _Error() when error != null:
return error(_that.err,_that.filter);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements MergeRequestsState {
  const _Loading({required this.filter});
  

@override final  MergeRequestFilter filter;

/// Create a copy of MergeRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode {
    return Object.hash(runtimeType,filter);
}

@override
String toString() {
    return 'MergeRequestsState.loading(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $MergeRequestsStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 MergeRequestFilter filter
});




}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of MergeRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_Loading(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as MergeRequestFilter,
  ));
}


}

/// @nodoc


class _Data implements MergeRequestsState {
  const _Data({required  List<MergeRequestEntity> items, required this.filter, this.isRefreshing = false}): _items = items;
  

 final  List<MergeRequestEntity> _items;
 List<MergeRequestEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  MergeRequestFilter filter;
@JsonKey() final  bool isRefreshing;

/// Create a copy of MergeRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<_Data> get copyWith => __$DataCopyWithImpl<_Data>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),filter,isRefreshing);
}

@override
String toString() {
    return 'MergeRequestsState.data(items: $items, filter: $filter, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $MergeRequestsStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) = __$DataCopyWithImpl;
@override @useResult
$Res call({
 List<MergeRequestEntity> items, MergeRequestFilter filter, bool isRefreshing
});




}
/// @nodoc
class __$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

/// Create a copy of MergeRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? filter = null,Object? isRefreshing = null,}) {
  return _then(_Data(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MergeRequestEntity>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as MergeRequestFilter,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Error implements MergeRequestsState {
  const _Error({required this.err, required this.filter});
  

 final  Object err;
@override final  MergeRequestFilter filter;

/// Create a copy of MergeRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&const DeepCollectionEquality().equals(other.err, err)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(err),filter);
}

@override
String toString() {
    return 'MergeRequestsState.error(err: $err, filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $MergeRequestsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 Object err, MergeRequestFilter filter
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of MergeRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? err = null,Object? filter = null,}) {
  return _then(_Error(
err: null == err ? _self.err : err ,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as MergeRequestFilter,
  ));
}


}

// dart format on
