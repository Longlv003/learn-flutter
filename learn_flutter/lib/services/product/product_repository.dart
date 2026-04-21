import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_flutter/di.dart';
import 'package:learn_flutter/model/product_model.dart';
import 'package:learn_flutter/services/product/product_api.dart';
import 'package:logger/logger.dart';

class ProductRepository {
  final ProductApi api;
  final Box<ProductModel> box;

  ProductRepository(this.api, this.box);

  final logger = getIt<Logger>();

  Future<List<ProductModel>> getProducts() async {
    try {
      final products = await api.getProducts();

      logger.d("API products length: ${products.length}");

      await box.putAll({for (var p in products) p.id: p});

      logger.d("Cache length: ${box.values.length}");

      return products;
    } catch (e) {
      logger.e("Repository error: $e");

      final cached = box.values.toList();
      logger.d("Fallback cache length: ${cached.length}");

      return cached;
    }
  }

  List<ProductModel> getCachedProducts() {
    return box.values.toList();
  }

  Future<ProductModel?> createProduct(ProductModel product) async {
    try {
      final newProduct = await api.createProduct(product);

      if (newProduct != null) {
        await box.put(newProduct.id, newProduct);
        logger.d("Cached new product: ${newProduct.id}");
      }

      return newProduct;
    } catch (e) {
      logger.e("Repository create error: $e");
      return null;
    }
  }

  Future<ProductModel?> putProduct(ProductModel product) async {
    try {
      final updatedProduct = await api.putProduct(product);

      if (updatedProduct != null) {
        await box.put(updatedProduct.id, updatedProduct);
        logger.d("Updated cache product: ${updatedProduct.id}");
      }

      return updatedProduct;
    } catch (e) {
      logger.e("Repository update error: $e");
      return null;
    }
  }

  Future<void> deleteProduct(String id) async {
    await api.deleteProduct(id);

    // update cache luôn (tránh phải fetch lại)
    await box.delete(id);
  }
}
