enum ProductDialogStatus { initial, loading, success, error }

class ProductState {
  final String name;
  final String price;
  final int quantity;
  final String image;
  final String description;
  final String category;
  final double rating;

  final ProductDialogStatus status;
  final String? errorMessage;

  const ProductState({
    this.name = '',
    this.price = '',
    this.quantity = 0,
    this.image = '',
    this.description = '',
    this.category = '',
    this.rating = 0,
    this.status = ProductDialogStatus.initial,
    this.errorMessage,
  });

  ProductState copyWith({
    String? name,
    String? price,
    int? quantity,
    String? image,
    String? description,
    String? category,
    double? rating,
    ProductDialogStatus? status,
    String? errorMessage,
  }) {
    return ProductState(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
      description: description ?? this.description,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
