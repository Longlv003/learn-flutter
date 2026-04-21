import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/home/home_state.dart';
import 'package:learn_flutter/di.dart';
import 'package:learn_flutter/services/product/product_repository.dart';
import 'package:logger/logger.dart';

class HomeCubit extends Cubit<HomeState> {
  final logger = getIt<Logger>();

  final ProductRepository repo;

  HomeCubit(this.repo) : super(HomeState());

  Future<void> fetchProducts() async {
    try {
      emit(state.copyWith(status: Status.loading));

      final cached = repo.getCachedProducts();
      if (cached.isNotEmpty) {
        logger.d("cached: ${cached.length}");
        emit(state.copyWith(status: Status.initial, products: cached));
      }

      final products = await repo.getProducts();

      if (products.isEmpty) {
        emit(state.copyWith(status: Status.success));
      } else {
        emit(state.copyWith(status: Status.success, products: products));
      }

      // emit(state.copyWith(status: Status.success, products: products));
    } catch (e) {
      logger.e("fetch product failed: $e");
      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> refreshAll() async {
    if (state.isRefreshing) return;

    emit(state.copyWith(isRefreshing: true));

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
      final updatedList = state.products.where((p) => p.id != id).toList();

      emit(state.copyWith(products: updatedList));

      await repo.deleteProduct(id);
    } catch (e) {
      logger.e("delete failed: $e");
      await fetchProducts();
    }
  }
}
