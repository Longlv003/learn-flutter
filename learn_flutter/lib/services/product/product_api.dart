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

  Future<ProductModel?> createProduct(ProductModel product) async {
    try {
      final String path = "/products";
      final res = await api.post(path, product.toJson());

      final data = res.data;
      logger.d("create product: $data");

      return ProductModel.fromJson(data);
    } catch (e) {
      logger.e("Create product error: $e");
      return null;
    }
  }

  Future<ProductModel?> putProduct(ProductModel product) async {
    try {
      if (product.id == null) {
        throw Exception("Product ID is required for update");
      }
      final String path = '/products/${product.id}';
      final res = await api.put(path, product.toJson());

      final data = res.data;
      logger.d("update product: $data");

      return ProductModel.fromJson(data);
    } catch (e) {
      logger.e("Update product error: $e");
      return null;
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      final String path = '/products/$id';
      await api.delete(path);

      logger.d("delete product success: $id");
      return true;
    } catch (e) {
      logger.e("Delete product error: $e");
      return false;
    }
  }
}
