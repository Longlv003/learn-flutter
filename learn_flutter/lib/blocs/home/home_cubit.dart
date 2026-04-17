import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/home/home_state.dart';
import 'package:learn_flutter/di.dart';
import 'package:learn_flutter/services/product/product_api.dart';
import 'package:logger/logger.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductApi productApi;
  final logger = getIt<Logger>();

  HomeCubit(this.productApi) : super(HomeState());

  Future<void> fetchProducts() async {
    try {
      emit(state.copyWith(status: Status.loading));
      final products = await productApi.getProducts();
      emit(state.copyWith(status: Status.success, products: products));
    } catch (e) {
      logger.e("fetch product failed: $e");
      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> refreshAll() async {
    if (state.isRefreshing) return;

    emit(state.copyWith(isRefreshing: true, status: Status.loading));

    await fetchProducts();

    emit(state.copyWith(isRefreshing: false));
  }

  void scrollToTop() {
    emit(state.copyWith(scrollToTop: true));
  }

  void resetScroll() {
    emit(state.copyWith(scrollToTop: false));
  }

  Future<void> deleteProduct(String id) async {
    try {
      await productApi.deleteProduct(id);
      await fetchProducts();
    } catch (e) {
      logger.e("delete failed: $e");
    }
  }
}
