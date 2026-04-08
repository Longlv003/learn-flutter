import 'package:flutter/material.dart';
import 'package:learn_flutter/model/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductItem({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(blurRadius: 6, color: Colors.black.withAlpha(22)),
          ],
        ),
        child: Row(
          children: [
            // IMAGE
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                product.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    const Icon(Icons.image_not_supported),
              ),
            ),

            const SizedBox(width: 12),

            // INFO
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NAME
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // PRICE
                    Text(
                      "${product.price.toInt()} đ",
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // CATEGORY + RATING
                    Row(
                      children: [
                        Text(
                          product.category,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.star, size: 14, color: Colors.orange),
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // QUANTITY
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                "x${product.quantity}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
