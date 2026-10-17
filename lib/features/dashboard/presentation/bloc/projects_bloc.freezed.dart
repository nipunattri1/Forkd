// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProjectsEvent()';
}


}

/// @nodoc
class $ProjectsEventCopyWith<$Res>  {
$ProjectsEventCopyWith(ProjectsEvent _, $Res Function(ProjectsEvent) __);
}


/// Adds pattern-matching-related methods to [ProjectsEvent].
extension ProjectsEventPatterns on ProjectsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _Refreshed value)?  refreshed,TResult Function( _TabChanged value)?  tabChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refreshed() when refreshed != null:
return refreshed(_that);case _TabChanged() when tabChanged != null:
return tabChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _Refreshed value)  refreshed,required TResult Function( _TabChanged value)  tabChanged,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _Refreshed():
return refreshed(_that);case _TabChanged():
return tabChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _Refreshed value)?  refreshed,TResult? Function( _TabChanged value)?  tabChanged,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _Refreshed() when refreshed != null:
return refreshed(_that);case _TabChanged() when tabChanged != null:
return tabChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshed,TResult Function( ProjectTab tab)?  tabChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Refreshed() when refreshed != null:
return refreshed();case _TabChanged() when tabChanged != null:
return tabChanged(_that.tab);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshed,required TResult Function( ProjectTab tab)  tabChanged,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _Refreshed():
return refreshed();case _TabChanged():
return tabChanged(_that.tab);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshed,TResult? Function( ProjectTab tab)?  tabChanged,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _Refreshed() when refreshed != null:
return refreshed();case _TabChanged() when tabChanged != null:
return tabChanged(_that.tab);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ProjectsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProjectsEvent.started()';
}


}




/// @nodoc


class _Refreshed implements ProjectsEvent {
  const _Refreshed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ProjectsEvent.refreshed()';
}


}




/// @nodoc


class _TabChanged implements ProjectsEvent {
  const _TabChanged(this.tab);
  

 final  ProjectTab tab;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabChangedCopyWith<_TabChanged> get copyWith => __$TabChangedCopyWithImpl<_TabChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabChanged&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode {
    return Object.hash(runtimeType,tab);
}

@override
String toString() {
    return 'ProjectsEvent.tabChanged(tab: $tab)';
}


}

/// @nodoc
abstract mixin class _$TabChangedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory _$TabChangedCopyWith(_TabChanged value, $Res Function(_TabChanged) _then) = __$TabChangedCopyWithImpl;
@useResult
$Res call({
 ProjectTab tab
});




}
/// @nodoc
class __$TabChangedCopyWithImpl<$Res>
    implements _$TabChangedCopyWith<$Res> {
  __$TabChangedCopyWithImpl(this._self, this._then);

  final _TabChanged _self;
  final $Res Function(_TabChanged) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tab = null,}) {
  return _then(_TabChanged(
null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as ProjectTab,
  ));
}


}

/// @nodoc
mixin _$ProjectsState {

 ProjectTab get tab; Map<ProjectTab, int> get counts;
/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsStateCopyWith<ProjectsState> get copyWith => _$ProjectsStateCopyWithImpl<ProjectsState>(this as ProjectsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProjectsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsState&&(identical(other.tab, _this.tab) || other.tab == _this.tab)&&const DeepCollectionEquality().equals(other.counts, _this.counts));
}


@override
int get hashCode {
  final _this = this as ProjectsState;
  return Object.hash(runtimeType,_this.tab,const DeepCollectionEquality().hash(_this.counts));
}

@override
String toString() {
  final _this = this as ProjectsState;
  return 'ProjectsState(tab: ${_this.tab}, counts: ${_this.counts})';
}


}

/// @nodoc
abstract mixin class $ProjectsStateCopyWith<$Res>  {
  factory $ProjectsStateCopyWith(ProjectsState value, $Res Function(ProjectsState) _then) = _$ProjectsStateCopyWithImpl;
@useResult
$Res call({
 ProjectTab tab, Map<ProjectTab, int> counts
});




}
/// @nodoc
class _$ProjectsStateCopyWithImpl<$Res>
    implements $ProjectsStateCopyWith<$Res> {
  _$ProjectsStateCopyWithImpl(this._self, this._then);

  final ProjectsState _self;
  final $Res Function(ProjectsState) _then;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tab = null,Object? counts = null,}) {
  return _then(_self.copyWith(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as ProjectTab,counts: null == counts ? _self.counts : counts // ignore: cast_nullable_to_non_nullable
as Map<ProjectTab, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectsState].
extension ProjectsStatePatterns on ProjectsState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ProjectTab tab,  Map<ProjectTab, int> counts)?  loading,TResult Function( List<ProjectEntity> items,  ProjectTab tab,  Map<ProjectTab, int> counts,  bool isRefreshing)?  data,TResult Function( Object err,  ProjectTab tab,  Map<ProjectTab, int> counts)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that.tab,_that.counts);case _Data() when data != null:
return data(_that.items,_that.tab,_that.counts,_that.isRefreshing);case _Error() when error != null:
return error(_that.err,_that.tab,_that.counts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ProjectTab tab,  Map<ProjectTab, int> counts)  loading,required TResult Function( List<ProjectEntity> items,  ProjectTab tab,  Map<ProjectTab, int> counts,  bool isRefreshing)  data,required TResult Function( Object err,  ProjectTab tab,  Map<ProjectTab, int> counts)  error,}) {final _that = this;
switch (_that) {
case _Loading():
return loading(_that.tab,_that.counts);case _Data():
return data(_that.items,_that.tab,_that.counts,_that.isRefreshing);case _Error():
return error(_that.err,_that.tab,_that.counts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ProjectTab tab,  Map<ProjectTab, int> counts)?  loading,TResult? Function( List<ProjectEntity> items,  ProjectTab tab,  Map<ProjectTab, int> counts,  bool isRefreshing)?  data,TResult? Function( Object err,  ProjectTab tab,  Map<ProjectTab, int> counts)?  error,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that.tab,_that.counts);case _Data() when data != null:
return data(_that.items,_that.tab,_that.counts,_that.isRefreshing);case _Error() when error != null:
return error(_that.err,_that.tab,_that.counts);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements ProjectsState {
  const _Loading({required this.tab,  Map<ProjectTab, int> counts = const <ProjectTab, int>{}}): _counts = counts;
  

@override final  ProjectTab tab;
 final  Map<ProjectTab, int> _counts;
@override@JsonKey() Map<ProjectTab, int> get counts {
  if (_counts is EqualUnmodifiableMapView) return _counts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_counts);
}


/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.tab, tab) || other.tab == tab)&&const DeepCollectionEquality().equals(other.counts, _counts));
}


@override
int get hashCode {
    return Object.hash(runtimeType,tab,const DeepCollectionEquality().hash(_counts));
}

@override
String toString() {
    return 'ProjectsState.loading(tab: $tab, counts: $counts)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $ProjectsStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 ProjectTab tab, Map<ProjectTab, int> counts
});




}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tab = null,Object? counts = null,}) {
  return _then(_Loading(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as ProjectTab,counts: null == counts ? _self._counts : counts // ignore: cast_nullable_to_non_nullable
as Map<ProjectTab, int>,
  ));
}


}

/// @nodoc


class _Data implements ProjectsState {
  const _Data({required  List<ProjectEntity> items, required this.tab,  Map<ProjectTab, int> counts = const <ProjectTab, int>{}, this.isRefreshing = false}): _items = items,_counts = counts;
  

 final  List<ProjectEntity> _items;
 List<ProjectEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  ProjectTab tab;
 final  Map<ProjectTab, int> _counts;
@override@JsonKey() Map<ProjectTab, int> get counts {
  if (_counts is EqualUnmodifiableMapView) return _counts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_counts);
}

@JsonKey() final  bool isRefreshing;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<_Data> get copyWith => __$DataCopyWithImpl<_Data>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.tab, tab) || other.tab == tab)&&const DeepCollectionEquality().equals(other.counts, _counts)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),tab,const DeepCollectionEquality().hash(_counts),isRefreshing);
}

@override
String toString() {
    return 'ProjectsState.data(items: $items, tab: $tab, counts: $counts, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $ProjectsStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) = __$DataCopyWithImpl;
@override @useResult
$Res call({
 List<ProjectEntity> items, ProjectTab tab, Map<ProjectTab, int> counts, bool isRefreshing
});




}
/// @nodoc
class __$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? tab = null,Object? counts = null,Object? isRefreshing = null,}) {
  return _then(_Data(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProjectEntity>,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as ProjectTab,counts: null == counts ? _self._counts : counts // ignore: cast_nullable_to_non_nullable
as Map<ProjectTab, int>,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Error implements ProjectsState {
  const _Error({required this.err, required this.tab,  Map<ProjectTab, int> counts = const <ProjectTab, int>{}}): _counts = counts;
  

 final  Object err;
@override final  ProjectTab tab;
 final  Map<ProjectTab, int> _counts;
@override@JsonKey() Map<ProjectTab, int> get counts {
  if (_counts is EqualUnmodifiableMapView) return _counts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_counts);
}


/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&const DeepCollectionEquality().equals(other.err, err)&&(identical(other.tab, tab) || other.tab == tab)&&const DeepCollectionEquality().equals(other.counts, _counts));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(err),tab,const DeepCollectionEquality().hash(_counts));
}

@override
String toString() {
    return 'ProjectsState.error(err: $err, tab: $tab, counts: $counts)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ProjectsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 Object err, ProjectTab tab, Map<ProjectTab, int> counts
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? err = null,Object? tab = null,Object? counts = null,}) {
  return _then(_Error(
err: null == err ? _self.err : err ,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as ProjectTab,counts: null == counts ? _self._counts : counts // ignore: cast_nullable_to_non_nullable
as Map<ProjectTab, int>,
  ));
}


}

// dart format on
