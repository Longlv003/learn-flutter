import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/home/product_state.dart';
import 'package:learn_flutter/model/product_model.dart';
import 'package:learn_flutter/services/api_service.dart';
import 'package:learn_flutter/services/product/product_api.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ProductCubit extends Cubit<ProductState> {
  final ApiService apiService;

  ProductCubit(this.apiService) : super(ProductState());

  void onNameChanged(String value) => emit(state.copyWith(name: value));
  void onPriceChanged(String value) => emit(state.copyWith(price: value));
  void onQuantityChanged(int value) => emit(state.copyWith(quantity: value));
  void onImageChanged(String value) => emit(state.copyWith(image: value));
  void onDescriptionChanged(String value) =>
      emit(state.copyWith(description: value));
  void onCategoryChanged(String value) => emit(state.copyWith(category: value));
  void onRatingChanged(double value) => emit(state.copyWith(rating: value));

  void openAdd() {
    emit(const ProductState(mode: ProductDialogMode.add));
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
      ),
    );
  }

  bool _isValid() {
    final double parsedPrice =
        double.tryParse(state.price.replaceAll(',', '.')) ?? 0;
    return state.name.trim().isNotEmpty &&
        parsedPrice > 0 &&
        state.quantity > 0;
  }

  Future<void> submitProduct() async {
    if (!_isValid()) {
      emit(
        state.copyWith(
          status: ProductDialogStatus.error,
          errorMessage: 'Vui lòng điền đầy đủ các trường bắt buộc',
        ),
      );
      return;
    }

    final double parsedPrice =
        double.tryParse(state.price.replaceAll(',', '.')) ?? 0;

    try {
      emit(state.copyWith(status: ProductDialogStatus.loading));

      final productApi = ProductApi(apiService);

      final product = ProductModel(
        id: state.id,
        name: state.name.trim(),
        price: parsedPrice,
        quantity: state.quantity,
        image: state.image,
        description: state.description,
        category: state.category,
        rating: state.rating,
      );

      // final res = await productApi.createProduct(product);
      final res = state.mode == ProductDialogMode.add
          ? await productApi.createProduct(product)
          : await productApi.putProduct(product);

      if (res == null) {
        throw Exception("Create product failed");
      }

      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(status: ProductDialogStatus.success));
    } catch (e) {
      logger.e('Create product failed: $e');
      emit(
        state.copyWith(
          status: ProductDialogStatus.error,
          errorMessage: 'Tạo sản phẩm thất bại: $e',
        ),
      );
    }
  }

  Future<void> deleteProduct(String id) async {
    if (id.isEmpty) {
      emit(
        state.copyWith(
          status: ProductDialogStatus.error,
          errorMessage: 'Không có sản phẩm để xóa',
        ),
      );
      return;
    }

    try {
      emit(state.copyWith(status: ProductDialogStatus.loading));

      final productApi = ProductApi(apiService);
      await productApi.deleteProduct(id);

      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(status: ProductDialogStatus.success));
    } catch (e) {
      logger.e('Delete product failed: $e');
      emit(
        state.copyWith(
          status: ProductDialogStatus.error,
          errorMessage: 'Xóa sản phẩm thất bại: $e',
        ),
      );
    }
  }

  void reset() => emit(const ProductState());
}
