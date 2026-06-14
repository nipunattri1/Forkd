// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_counts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
UserCounts _$UserCountsFromJson(
  Map<String, dynamic> json
) {
    return _GitlabUserCounts.fromJson(
      json
    );
}

/// @nodoc
mixin _$UserCounts {

 int get mergeRequests; int get assignedIssues; int get assignedMergeRequests; int get reviewRequestedMergeRequests; int get todos;
/// Create a copy of UserCounts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCountsCopyWith<UserCounts> get copyWith => _$UserCountsCopyWithImpl<UserCounts>(this as UserCounts, _$identity);

  /// Serializes this UserCounts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCounts&&(identical(other.mergeRequests, mergeRequests) || other.mergeRequests == mergeRequests)&&(identical(other.assignedIssues, assignedIssues) || other.assignedIssues == assignedIssues)&&(identical(other.assignedMergeRequests, assignedMergeRequests) || other.assignedMergeRequests == assignedMergeRequests)&&(identical(other.reviewRequestedMergeRequests, reviewRequestedMergeRequests) || other.reviewRequestedMergeRequests == reviewRequestedMergeRequests)&&(identical(other.todos, todos) || other.todos == todos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mergeRequests,assignedIssues,assignedMergeRequests,reviewRequestedMergeRequests,todos);

@override
String toString() {
  return 'UserCounts(mergeRequests: $mergeRequests, assignedIssues: $assignedIssues, assignedMergeRequests: $assignedMergeRequests, reviewRequestedMergeRequests: $reviewRequestedMergeRequests, todos: $todos)';
}


}

/// @nodoc
abstract mixin class $UserCountsCopyWith<$Res>  {
  factory $UserCountsCopyWith(UserCounts value, $Res Function(UserCounts) _then) = _$UserCountsCopyWithImpl;
@useResult
$Res call({
 int mergeRequests, int assignedIssues, int assignedMergeRequests, int reviewRequestedMergeRequests, int todos
});




}
/// @nodoc
class _$UserCountsCopyWithImpl<$Res>
    implements $UserCountsCopyWith<$Res> {
  _$UserCountsCopyWithImpl(this._self, this._then);

  final UserCounts _self;
  final $Res Function(UserCounts) _then;

/// Create a copy of UserCounts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mergeRequests = null,Object? assignedIssues = null,Object? assignedMergeRequests = null,Object? reviewRequestedMergeRequests = null,Object? todos = null,}) {
  return _then(_self.copyWith(
mergeRequests: null == mergeRequests ? _self.mergeRequests : mergeRequests // ignore: cast_nullable_to_non_nullable
as int,assignedIssues: null == assignedIssues ? _self.assignedIssues : assignedIssues // ignore: cast_nullable_to_non_nullable
as int,assignedMergeRequests: null == assignedMergeRequests ? _self.assignedMergeRequests : assignedMergeRequests // ignore: cast_nullable_to_non_nullable
as int,reviewRequestedMergeRequests: null == reviewRequestedMergeRequests ? _self.reviewRequestedMergeRequests : reviewRequestedMergeRequests // ignore: cast_nullable_to_non_nullable
as int,todos: null == todos ? _self.todos : todos // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserCounts].
extension UserCountsPatterns on UserCounts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GitlabUserCounts value)?  gitlab,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GitlabUserCounts() when gitlab != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GitlabUserCounts value)  gitlab,}){
final _that = this;
switch (_that) {
case _GitlabUserCounts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GitlabUserCounts value)?  gitlab,}){
final _that = this;
switch (_that) {
case _GitlabUserCounts() when gitlab != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int mergeRequests,  int assignedIssues,  int assignedMergeRequests,  int reviewRequestedMergeRequests,  int todos)?  gitlab,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GitlabUserCounts() when gitlab != null:
return gitlab(_that.mergeRequests,_that.assignedIssues,_that.assignedMergeRequests,_that.reviewRequestedMergeRequests,_that.todos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int mergeRequests,  int assignedIssues,  int assignedMergeRequests,  int reviewRequestedMergeRequests,  int todos)  gitlab,}) {final _that = this;
switch (_that) {
case _GitlabUserCounts():
return gitlab(_that.mergeRequests,_that.assignedIssues,_that.assignedMergeRequests,_that.reviewRequestedMergeRequests,_that.todos);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int mergeRequests,  int assignedIssues,  int assignedMergeRequests,  int reviewRequestedMergeRequests,  int todos)?  gitlab,}) {final _that = this;
switch (_that) {
case _GitlabUserCounts() when gitlab != null:
return gitlab(_that.mergeRequests,_that.assignedIssues,_that.assignedMergeRequests,_that.reviewRequestedMergeRequests,_that.todos);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _GitlabUserCounts extends UserCounts {
   _GitlabUserCounts({required this.mergeRequests, required this.assignedIssues, required this.assignedMergeRequests, required this.reviewRequestedMergeRequests, required this.todos}): super._();
  factory _GitlabUserCounts.fromJson(Map<String, dynamic> json) => _$GitlabUserCountsFromJson(json);

@override final  int mergeRequests;
@override final  int assignedIssues;
@override final  int assignedMergeRequests;
@override final  int reviewRequestedMergeRequests;
@override final  int todos;

/// Create a copy of UserCounts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GitlabUserCountsCopyWith<_GitlabUserCounts> get copyWith => __$GitlabUserCountsCopyWithImpl<_GitlabUserCounts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GitlabUserCountsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GitlabUserCounts&&(identical(other.mergeRequests, mergeRequests) || other.mergeRequests == mergeRequests)&&(identical(other.assignedIssues, assignedIssues) || other.assignedIssues == assignedIssues)&&(identical(other.assignedMergeRequests, assignedMergeRequests) || other.assignedMergeRequests == assignedMergeRequests)&&(identical(other.reviewRequestedMergeRequests, reviewRequestedMergeRequests) || other.reviewRequestedMergeRequests == reviewRequestedMergeRequests)&&(identical(other.todos, todos) || other.todos == todos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mergeRequests,assignedIssues,assignedMergeRequests,reviewRequestedMergeRequests,todos);

@override
String toString() {
  return 'UserCounts.gitlab(mergeRequests: $mergeRequests, assignedIssues: $assignedIssues, assignedMergeRequests: $assignedMergeRequests, reviewRequestedMergeRequests: $reviewRequestedMergeRequests, todos: $todos)';
}


}

/// @nodoc
abstract mixin class _$GitlabUserCountsCopyWith<$Res> implements $UserCountsCopyWith<$Res> {
  factory _$GitlabUserCountsCopyWith(_GitlabUserCounts value, $Res Function(_GitlabUserCounts) _then) = __$GitlabUserCountsCopyWithImpl;
@override @useResult
$Res call({
 int mergeRequests, int assignedIssues, int assignedMergeRequests, int reviewRequestedMergeRequests, int todos
});




}
/// @nodoc
class __$GitlabUserCountsCopyWithImpl<$Res>
    implements _$GitlabUserCountsCopyWith<$Res> {
  __$GitlabUserCountsCopyWithImpl(this._self, this._then);

  final _GitlabUserCounts _self;
  final $Res Function(_GitlabUserCounts) _then;

/// Create a copy of UserCounts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mergeRequests = null,Object? assignedIssues = null,Object? assignedMergeRequests = null,Object? reviewRequestedMergeRequests = null,Object? todos = null,}) {
  return _then(_GitlabUserCounts(
mergeRequests: null == mergeRequests ? _self.mergeRequests : mergeRequests // ignore: cast_nullable_to_non_nullable
as int,assignedIssues: null == assignedIssues ? _self.assignedIssues : assignedIssues // ignore: cast_nullable_to_non_nullable
as int,assignedMergeRequests: null == assignedMergeRequests ? _self.assignedMergeRequests : assignedMergeRequests // ignore: cast_nullable_to_non_nullable
as int,reviewRequestedMergeRequests: null == reviewRequestedMergeRequests ? _self.reviewRequestedMergeRequests : reviewRequestedMergeRequests // ignore: cast_nullable_to_non_nullable
as int,todos: null == todos ? _self.todos : todos // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
