// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_tab_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardTabState {

 int get selectedIndex;
/// Create a copy of DashboardTabState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardTabStateCopyWith<DashboardTabState> get copyWith => _$DashboardTabStateCopyWithImpl<DashboardTabState>(this as DashboardTabState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardTabState&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex));
}


@override
int get hashCode => Object.hash(runtimeType,selectedIndex);

@override
String toString() {
  return 'DashboardTabState(selectedIndex: $selectedIndex)';
}


}

/// @nodoc
abstract mixin class $DashboardTabStateCopyWith<$Res>  {
  factory $DashboardTabStateCopyWith(DashboardTabState value, $Res Function(DashboardTabState) _then) = _$DashboardTabStateCopyWithImpl;
@useResult
$Res call({
 int selectedIndex
});




}
/// @nodoc
class _$DashboardTabStateCopyWithImpl<$Res>
    implements $DashboardTabStateCopyWith<$Res> {
  _$DashboardTabStateCopyWithImpl(this._self, this._then);

  final DashboardTabState _self;
  final $Res Function(DashboardTabState) _then;

/// Create a copy of DashboardTabState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedIndex = null,}) {
  return _then(_self.copyWith(
selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _DashboardTabState extends DashboardTabState {
  const _DashboardTabState({this.selectedIndex = 0}): super._();
  

@override@JsonKey() final  int selectedIndex;

/// Create a copy of DashboardTabState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardTabStateCopyWith<_DashboardTabState> get copyWith => __$DashboardTabStateCopyWithImpl<_DashboardTabState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardTabState&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex));
}


@override
int get hashCode => Object.hash(runtimeType,selectedIndex);

@override
String toString() {
  return 'DashboardTabState(selectedIndex: $selectedIndex)';
}


}

/// @nodoc
abstract mixin class _$DashboardTabStateCopyWith<$Res> implements $DashboardTabStateCopyWith<$Res> {
  factory _$DashboardTabStateCopyWith(_DashboardTabState value, $Res Function(_DashboardTabState) _then) = __$DashboardTabStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedIndex
});




}
/// @nodoc
class __$DashboardTabStateCopyWithImpl<$Res>
    implements _$DashboardTabStateCopyWith<$Res> {
  __$DashboardTabStateCopyWithImpl(this._self, this._then);

  final _DashboardTabState _self;
  final $Res Function(_DashboardTabState) _then;

/// Create a copy of DashboardTabState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedIndex = null,}) {
  return _then(_DashboardTabState(
selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
