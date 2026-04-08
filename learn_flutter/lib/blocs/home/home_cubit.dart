import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/home/home_state.dart';
import 'package:learn_flutter/services/api_service.dart';
import 'package:learn_flutter/services/product/product_api.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class HomeCubit extends Cubit<HomeState> {
  final ApiService apiService;

  HomeCubit(this.apiService) : super(HomeState());

  Future<void> fetchProducts() async {
    try {
      emit(state.copyWith(status: Status.loading));
      final productAPi = ProductApi(apiService);
      final products = await productAPi.getProducts();
      await Future.delayed(Duration(seconds: 1));
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

    await Future.delayed(Duration(seconds: 2));

    emit(state.copyWith(isRefreshing: false));
  }

  void scrollToTop() {
    emit(state.copyWith(scrollToTop: true));
  }

  void resetScroll() {
    emit(state.copyWith(scrollToTop: false));
  }
}
