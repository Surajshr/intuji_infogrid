// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MemberState {

 List<MemberDetailEntity>? get searchMembers; List<MemberDetailEntity>? get members; bool get isLoading; bool get isError;
/// Create a copy of MemberState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberStateCopyWith<MemberState> get copyWith => _$MemberStateCopyWithImpl<MemberState>(this as MemberState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberState&&const DeepCollectionEquality().equals(other.searchMembers, searchMembers)&&const DeepCollectionEquality().equals(other.members, members)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(searchMembers),const DeepCollectionEquality().hash(members),isLoading,isError);

@override
String toString() {
  return 'MemberState(searchMembers: $searchMembers, members: $members, isLoading: $isLoading, isError: $isError)';
}


}

/// @nodoc
abstract mixin class $MemberStateCopyWith<$Res>  {
  factory $MemberStateCopyWith(MemberState value, $Res Function(MemberState) _then) = _$MemberStateCopyWithImpl;
@useResult
$Res call({
 List<MemberDetailEntity>? searchMembers, List<MemberDetailEntity>? members, bool isLoading, bool isError
});




}
/// @nodoc
class _$MemberStateCopyWithImpl<$Res>
    implements $MemberStateCopyWith<$Res> {
  _$MemberStateCopyWithImpl(this._self, this._then);

  final MemberState _self;
  final $Res Function(MemberState) _then;

/// Create a copy of MemberState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchMembers = freezed,Object? members = freezed,Object? isLoading = null,Object? isError = null,}) {
  return _then(_self.copyWith(
searchMembers: freezed == searchMembers ? _self.searchMembers : searchMembers // ignore: cast_nullable_to_non_nullable
as List<MemberDetailEntity>?,members: freezed == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<MemberDetailEntity>?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _MemberState extends MemberState {
  const _MemberState({final  List<MemberDetailEntity>? searchMembers = null, final  List<MemberDetailEntity>? members = null, this.isLoading = false, this.isError = false}): _searchMembers = searchMembers,_members = members,super._();
  

 final  List<MemberDetailEntity>? _searchMembers;
@override@JsonKey() List<MemberDetailEntity>? get searchMembers {
  final value = _searchMembers;
  if (value == null) return null;
  if (_searchMembers is EqualUnmodifiableListView) return _searchMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<MemberDetailEntity>? _members;
@override@JsonKey() List<MemberDetailEntity>? get members {
  final value = _members;
  if (value == null) return null;
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;

/// Create a copy of MemberState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberStateCopyWith<_MemberState> get copyWith => __$MemberStateCopyWithImpl<_MemberState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberState&&const DeepCollectionEquality().equals(other._searchMembers, _searchMembers)&&const DeepCollectionEquality().equals(other._members, _members)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_searchMembers),const DeepCollectionEquality().hash(_members),isLoading,isError);

@override
String toString() {
  return 'MemberState(searchMembers: $searchMembers, members: $members, isLoading: $isLoading, isError: $isError)';
}


}

/// @nodoc
abstract mixin class _$MemberStateCopyWith<$Res> implements $MemberStateCopyWith<$Res> {
  factory _$MemberStateCopyWith(_MemberState value, $Res Function(_MemberState) _then) = __$MemberStateCopyWithImpl;
@override @useResult
$Res call({
 List<MemberDetailEntity>? searchMembers, List<MemberDetailEntity>? members, bool isLoading, bool isError
});




}
/// @nodoc
class __$MemberStateCopyWithImpl<$Res>
    implements _$MemberStateCopyWith<$Res> {
  __$MemberStateCopyWithImpl(this._self, this._then);

  final _MemberState _self;
  final $Res Function(_MemberState) _then;

/// Create a copy of MemberState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchMembers = freezed,Object? members = freezed,Object? isLoading = null,Object? isError = null,}) {
  return _then(_MemberState(
searchMembers: freezed == searchMembers ? _self._searchMembers : searchMembers // ignore: cast_nullable_to_non_nullable
as List<MemberDetailEntity>?,members: freezed == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<MemberDetailEntity>?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
