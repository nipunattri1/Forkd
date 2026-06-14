// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forkd_sliver_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForkdListTileData {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForkdListTileData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForkdListTileData()';
}


}

/// @nodoc
class $ForkdListTileDataCopyWith<$Res>  {
$ForkdListTileDataCopyWith(ForkdListTileData _, $Res Function(ForkdListTileData) __);
}


/// Adds pattern-matching-related methods to [ForkdListTileData].
extension ForkdListTileDataPatterns on ForkdListTileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForkdDefaultListTileData value)?  $default,{TResult Function( _ForkdTileWidget value)?  custom,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForkdDefaultListTileData() when $default != null:
return $default(_that);case _ForkdTileWidget() when custom != null:
return custom(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForkdDefaultListTileData value)  $default,{required TResult Function( _ForkdTileWidget value)  custom,}){
final _that = this;
switch (_that) {
case _ForkdDefaultListTileData():
return $default(_that);case _ForkdTileWidget():
return custom(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForkdDefaultListTileData value)?  $default,{TResult? Function( _ForkdTileWidget value)?  custom,}){
final _that = this;
switch (_that) {
case _ForkdDefaultListTileData() when $default != null:
return $default(_that);case _ForkdTileWidget() when custom != null:
return custom(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Widget? leading,  Widget title,  Widget? subtitle,  Widget? trailing,  VoidCallback? onTap,  bool decoration)?  $default,{TResult Function( Widget child)?  custom,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForkdDefaultListTileData() when $default != null:
return $default(_that.leading,_that.title,_that.subtitle,_that.trailing,_that.onTap,_that.decoration);case _ForkdTileWidget() when custom != null:
return custom(_that.child);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Widget? leading,  Widget title,  Widget? subtitle,  Widget? trailing,  VoidCallback? onTap,  bool decoration)  $default,{required TResult Function( Widget child)  custom,}) {final _that = this;
switch (_that) {
case _ForkdDefaultListTileData():
return $default(_that.leading,_that.title,_that.subtitle,_that.trailing,_that.onTap,_that.decoration);case _ForkdTileWidget():
return custom(_that.child);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Widget? leading,  Widget title,  Widget? subtitle,  Widget? trailing,  VoidCallback? onTap,  bool decoration)?  $default,{TResult? Function( Widget child)?  custom,}) {final _that = this;
switch (_that) {
case _ForkdDefaultListTileData() when $default != null:
return $default(_that.leading,_that.title,_that.subtitle,_that.trailing,_that.onTap,_that.decoration);case _ForkdTileWidget() when custom != null:
return custom(_that.child);case _:
  return null;

}
}

}

/// @nodoc


class _ForkdDefaultListTileData extends ForkdListTileData {
   _ForkdDefaultListTileData({this.leading, required this.title, this.subtitle, this.trailing, this.onTap, this.decoration = true}): super._();
  

 final  Widget? leading;
 final  Widget title;
 final  Widget? subtitle;
 final  Widget? trailing;
 final  VoidCallback? onTap;
@JsonKey() final  bool decoration;

/// Create a copy of ForkdListTileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForkdDefaultListTileDataCopyWith<_ForkdDefaultListTileData> get copyWith => __$ForkdDefaultListTileDataCopyWithImpl<_ForkdDefaultListTileData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForkdDefaultListTileData&&(identical(other.leading, leading) || other.leading == leading)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.trailing, trailing) || other.trailing == trailing)&&(identical(other.onTap, onTap) || other.onTap == onTap)&&(identical(other.decoration, decoration) || other.decoration == decoration));
}


@override
int get hashCode => Object.hash(runtimeType,leading,title,subtitle,trailing,onTap,decoration);

@override
String toString() {
  return 'ForkdListTileData(leading: $leading, title: $title, subtitle: $subtitle, trailing: $trailing, onTap: $onTap, decoration: $decoration)';
}


}

/// @nodoc
abstract mixin class _$ForkdDefaultListTileDataCopyWith<$Res> implements $ForkdListTileDataCopyWith<$Res> {
  factory _$ForkdDefaultListTileDataCopyWith(_ForkdDefaultListTileData value, $Res Function(_ForkdDefaultListTileData) _then) = __$ForkdDefaultListTileDataCopyWithImpl;
@useResult
$Res call({
 Widget? leading, Widget title, Widget? subtitle, Widget? trailing, VoidCallback? onTap, bool decoration
});




}
/// @nodoc
class __$ForkdDefaultListTileDataCopyWithImpl<$Res>
    implements _$ForkdDefaultListTileDataCopyWith<$Res> {
  __$ForkdDefaultListTileDataCopyWithImpl(this._self, this._then);

  final _ForkdDefaultListTileData _self;
  final $Res Function(_ForkdDefaultListTileData) _then;

/// Create a copy of ForkdListTileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? leading = freezed,Object? title = null,Object? subtitle = freezed,Object? trailing = freezed,Object? onTap = freezed,Object? decoration = null,}) {
  return _then(_ForkdDefaultListTileData(
leading: freezed == leading ? _self.leading : leading // ignore: cast_nullable_to_non_nullable
as Widget?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Widget,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as Widget?,trailing: freezed == trailing ? _self.trailing : trailing // ignore: cast_nullable_to_non_nullable
as Widget?,onTap: freezed == onTap ? _self.onTap : onTap // ignore: cast_nullable_to_non_nullable
as VoidCallback?,decoration: null == decoration ? _self.decoration : decoration // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ForkdTileWidget extends ForkdListTileData {
  const _ForkdTileWidget({required this.child}): super._();
  

 final  Widget child;

/// Create a copy of ForkdListTileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForkdTileWidgetCopyWith<_ForkdTileWidget> get copyWith => __$ForkdTileWidgetCopyWithImpl<_ForkdTileWidget>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForkdTileWidget&&(identical(other.child, child) || other.child == child));
}


@override
int get hashCode => Object.hash(runtimeType,child);

@override
String toString() {
  return 'ForkdListTileData.custom(child: $child)';
}


}

/// @nodoc
abstract mixin class _$ForkdTileWidgetCopyWith<$Res> implements $ForkdListTileDataCopyWith<$Res> {
  factory _$ForkdTileWidgetCopyWith(_ForkdTileWidget value, $Res Function(_ForkdTileWidget) _then) = __$ForkdTileWidgetCopyWithImpl;
@useResult
$Res call({
 Widget child
});




}
/// @nodoc
class __$ForkdTileWidgetCopyWithImpl<$Res>
    implements _$ForkdTileWidgetCopyWith<$Res> {
  __$ForkdTileWidgetCopyWithImpl(this._self, this._then);

  final _ForkdTileWidget _self;
  final $Res Function(_ForkdTileWidget) _then;

/// Create a copy of ForkdListTileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? child = null,}) {
  return _then(_ForkdTileWidget(
child: null == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as Widget,
  ));
}


}

// dart format on
