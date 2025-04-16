// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardState {

 LinearChartDataEntity? get quotesDataPoints; LinearChartDataEntity? get ordersDataPoints; BudgetEntity? get budget; bool get isLoading; bool get isError; bool get isQuotesDataError; bool get isOrdersDataError; bool get isBudgetError; int get currentPage;
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateCopyWith<DashboardState> get copyWith => _$DashboardStateCopyWithImpl<DashboardState>(this as DashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState&&(identical(other.quotesDataPoints, quotesDataPoints) || other.quotesDataPoints == quotesDataPoints)&&(identical(other.ordersDataPoints, ordersDataPoints) || other.ordersDataPoints == ordersDataPoints)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.isQuotesDataError, isQuotesDataError) || other.isQuotesDataError == isQuotesDataError)&&(identical(other.isOrdersDataError, isOrdersDataError) || other.isOrdersDataError == isOrdersDataError)&&(identical(other.isBudgetError, isBudgetError) || other.isBudgetError == isBudgetError)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,quotesDataPoints,ordersDataPoints,budget,isLoading,isError,isQuotesDataError,isOrdersDataError,isBudgetError,currentPage);

@override
String toString() {
  return 'DashboardState(quotesDataPoints: $quotesDataPoints, ordersDataPoints: $ordersDataPoints, budget: $budget, isLoading: $isLoading, isError: $isError, isQuotesDataError: $isQuotesDataError, isOrdersDataError: $isOrdersDataError, isBudgetError: $isBudgetError, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res>  {
  factory $DashboardStateCopyWith(DashboardState value, $Res Function(DashboardState) _then) = _$DashboardStateCopyWithImpl;
@useResult
$Res call({
 LinearChartDataEntity? quotesDataPoints, LinearChartDataEntity? ordersDataPoints, BudgetEntity? budget, bool isLoading, bool isError, bool isQuotesDataError, bool isOrdersDataError, bool isBudgetError, int currentPage
});




}
/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quotesDataPoints = freezed,Object? ordersDataPoints = freezed,Object? budget = freezed,Object? isLoading = null,Object? isError = null,Object? isQuotesDataError = null,Object? isOrdersDataError = null,Object? isBudgetError = null,Object? currentPage = null,}) {
  return _then(_self.copyWith(
quotesDataPoints: freezed == quotesDataPoints ? _self.quotesDataPoints : quotesDataPoints // ignore: cast_nullable_to_non_nullable
as LinearChartDataEntity?,ordersDataPoints: freezed == ordersDataPoints ? _self.ordersDataPoints : ordersDataPoints // ignore: cast_nullable_to_non_nullable
as LinearChartDataEntity?,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as BudgetEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,isQuotesDataError: null == isQuotesDataError ? _self.isQuotesDataError : isQuotesDataError // ignore: cast_nullable_to_non_nullable
as bool,isOrdersDataError: null == isOrdersDataError ? _self.isOrdersDataError : isOrdersDataError // ignore: cast_nullable_to_non_nullable
as bool,isBudgetError: null == isBudgetError ? _self.isBudgetError : isBudgetError // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _DashboardState extends DashboardState {
  const _DashboardState({this.quotesDataPoints = null, this.ordersDataPoints = null, this.budget = null, this.isLoading = false, this.isError = false, this.isQuotesDataError = false, this.isOrdersDataError = false, this.isBudgetError = false, this.currentPage = 0}): super._();
  

@override@JsonKey() final  LinearChartDataEntity? quotesDataPoints;
@override@JsonKey() final  LinearChartDataEntity? ordersDataPoints;
@override@JsonKey() final  BudgetEntity? budget;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  bool isQuotesDataError;
@override@JsonKey() final  bool isOrdersDataError;
@override@JsonKey() final  bool isBudgetError;
@override@JsonKey() final  int currentPage;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStateCopyWith<_DashboardState> get copyWith => __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardState&&(identical(other.quotesDataPoints, quotesDataPoints) || other.quotesDataPoints == quotesDataPoints)&&(identical(other.ordersDataPoints, ordersDataPoints) || other.ordersDataPoints == ordersDataPoints)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.isQuotesDataError, isQuotesDataError) || other.isQuotesDataError == isQuotesDataError)&&(identical(other.isOrdersDataError, isOrdersDataError) || other.isOrdersDataError == isOrdersDataError)&&(identical(other.isBudgetError, isBudgetError) || other.isBudgetError == isBudgetError)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,quotesDataPoints,ordersDataPoints,budget,isLoading,isError,isQuotesDataError,isOrdersDataError,isBudgetError,currentPage);

@override
String toString() {
  return 'DashboardState(quotesDataPoints: $quotesDataPoints, ordersDataPoints: $ordersDataPoints, budget: $budget, isLoading: $isLoading, isError: $isError, isQuotesDataError: $isQuotesDataError, isOrdersDataError: $isOrdersDataError, isBudgetError: $isBudgetError, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(_DashboardState value, $Res Function(_DashboardState) _then) = __$DashboardStateCopyWithImpl;
@override @useResult
$Res call({
 LinearChartDataEntity? quotesDataPoints, LinearChartDataEntity? ordersDataPoints, BudgetEntity? budget, bool isLoading, bool isError, bool isQuotesDataError, bool isOrdersDataError, bool isBudgetError, int currentPage
});




}
/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quotesDataPoints = freezed,Object? ordersDataPoints = freezed,Object? budget = freezed,Object? isLoading = null,Object? isError = null,Object? isQuotesDataError = null,Object? isOrdersDataError = null,Object? isBudgetError = null,Object? currentPage = null,}) {
  return _then(_DashboardState(
quotesDataPoints: freezed == quotesDataPoints ? _self.quotesDataPoints : quotesDataPoints // ignore: cast_nullable_to_non_nullable
as LinearChartDataEntity?,ordersDataPoints: freezed == ordersDataPoints ? _self.ordersDataPoints : ordersDataPoints // ignore: cast_nullable_to_non_nullable
as LinearChartDataEntity?,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as BudgetEntity?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,isQuotesDataError: null == isQuotesDataError ? _self.isQuotesDataError : isQuotesDataError // ignore: cast_nullable_to_non_nullable
as bool,isOrdersDataError: null == isOrdersDataError ? _self.isOrdersDataError : isOrdersDataError // ignore: cast_nullable_to_non_nullable
as bool,isBudgetError: null == isBudgetError ? _self.isBudgetError : isBudgetError // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
