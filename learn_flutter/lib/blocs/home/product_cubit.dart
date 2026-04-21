import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/home/product_state.dart';
import 'package:learn_flutter/di.dart';
import 'package:learn_flutter/model/product_model.dart';
import 'package:learn_flutter/services/product/product_repository.dart';
import 'package:logger/logger.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repo;

  ProductCubit(this.repo) : super(ProductState());

  final logger = getIt<Logger>();

  void onNameChanged(String value) => emit(state.copyWith(name: value));
  void onPriceChanged(String value) => emit(state.copyWith(price: value));
  void onQuantityChanged(int value) => emit(state.copyWith(quantity: value));
  void onImageChanged(String value) => emit(state.copyWith(image: value));
  void onDescriptionChanged(String value) =>
      emit(state.copyWith(description: value));
  void onCategoryChanged(String value) => emit(state.copyWith(category: value));
  void onRatingChanged(double value) => emit(state.copyWith(rating: value));

  void openAdd() {
    emit(const ProductState(mode: ProductDialogMode.add, isValid: true));
  }

  void openEdit(ProductModel product) {
    emit(
      state.copyWith(
        mode: ProductDialogMode.edit,
        id: product.id,
        name: product.name,
        price: product.price.toString(),
        quantity: product.quantity,
        image: product.image,
        description: product.description,
        category: product.category,
        rating: product.rating,
        isValid: true,
      ),
    );
  }

  Future<void> submitProduct() async {
    final price = double.tryParse(state.price.replaceAll(',', '.')) ?? 0;

    final isValid =
        state.name.trim().isNotEmpty && price > 0 && state.quantity > 0;

    if (!isValid) {
      emit(
        state.copyWith(
          status: ProductDialogStatus.error,
          errorMessage: 'Vui lòng điền đầy đủ các trường bắt buộc',
        ),
      );
      // emit(state.copyWith(status: ProductDialogStatus.initial));
      return;
    }

    try {
      emit(state.copyWith(status: ProductDialogStatus.loading));

      final product = ProductModel(
        id: state.id,
        name: state.name.trim(),
        price: price,
        quantity: state.quantity,
        image: state.image,
        description: state.description,
        category: state.category,
        rating: state.rating,
      );

      if (state.mode == ProductDialogMode.add) {
        await repo.createProduct(product);
      } else {
        await repo.putProduct(product);
      }

      emit(state.copyWith(status: ProductDialogStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductDialogStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  // Future<void> deleteProduct(String id) async {
  //   if (id.isEmpty) {
  //     emit(
  //       state.copyWith(
  //         status: ProductDialogStatus.error,
  //         errorMessage: 'Không có sản phẩm để xóa',
  //       ),
  //     );
  //     return;
  //   }

  //   try {
  //     emit(state.copyWith(status: ProductDialogStatus.loading));

  //     await productApi.deleteProduct(id);

  //     emit(state.copyWith(status: ProductDialogStatus.success));
  //   } catch (e) {
  //     logger.e('Delete product failed: $e');
  //     emit(
  //       state.copyWith(
  //         status: ProductDialogStatus.error,
  //         errorMessage: 'Xóa sản phẩm thất bại: $e',
  //       ),
  //     );
  //   }
  // }

  void reset() => emit(const ProductState());
}
