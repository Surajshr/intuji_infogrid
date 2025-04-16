import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intuji_infogrid/core/imports/ui_imports.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/product_entity.dart';

part 'product_detail_state.dart';

part 'product_detail_cubit.freezed.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(const ProductDetailState());

  final PageController pageController = PageController();

  void setCurrentPage(int page) {
    emit(state.copyWith(currentPage: page));
  }

  void goToNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goToPreviousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void getRemainingBudget({required double remainingBudget}) {
    emit(state.copyWith(remainingBudget: remainingBudget));
  }

  void onColorSelected(Color color, int index) {
    emit(state.copyWith(selectedColorCode: color, selectedColorIndex: index));
  }

  void onSizeSelected(ProductSize size, int index) {
    emit(state.copyWith(selectedSize: size, selectedSizeIndex: index));
  }
}
