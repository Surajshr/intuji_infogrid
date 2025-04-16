part of 'product_detail_cubit.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const ProductDetailState._();

  const factory ProductDetailState({
    @Default(0) int currentPage,
    @Default(0) double remainingBudget,
    @Default(0) int selectedColorIndex,
    @Default(0) int selectedSizeIndex,
    @Default(null) Color? selectedColorCode,
    @Default(null) ProductSize? selectedSize,
  }) = _ProductDetailState;

  @override
  int get currentPage => throw UnimplementedError();

  @override
  double get remainingBudget => throw UnimplementedError();

  @override
  Color? get selectedColorCode => throw UnimplementedError();

  @override
  int get selectedColorIndex => throw UnimplementedError();

  @override
  ProductSize? get selectedSize => throw UnimplementedError();

  @override
  int get selectedSizeIndex => throw UnimplementedError();
}
