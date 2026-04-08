import 'package:learn_flutter/model/product_model.dart';

enum Status { initial, loading, success, error }

class HomeState {
  final Status status;
  final bool isRefreshing;
  final bool scrollToTop;
  final List<ProductModel> products;

  HomeState({
    this.status = Status.initial,
    this.isRefreshing = false,
    this.scrollToTop = false,
    this.products = const [],
  });

  HomeState copyWith({
    Status? status,
    bool? isRefreshing,
    bool? scrollToTop,

    List<ProductModel>? products,
  }) {
    return HomeState(
      status: status ?? this.status,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      scrollToTop: scrollToTop ?? this.scrollToTop,
      products: products ?? this.products,
    );
  }
}
