import 'package:learn_flutter/model/product_model.dart';
import 'package:learn_flutter/services/api_service.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ProductApi {
  final ApiService api;

  ProductApi(this.api);

  Future<List<ProductModel>> getProducts() async {
    try {
      final String path = '/products';
      final res = await api.get(path);
      final data = res.data as List;
      logger.d("data: $data");
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      logger.e("Fetch api product error: $e");
      return [];
    }
  }
}
