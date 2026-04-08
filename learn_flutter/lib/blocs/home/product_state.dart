enum ProductDialogStatus { initial, loading, success, error }

enum ProductDialogMode { view, edit, add }

class ProductState {
  final String? id;
  final String name;
  final String price;
  final int quantity;
  final String image;
  final String description;
  final String category;
  final double rating;

  final ProductDialogStatus status;
  final String? errorMessage;

  final ProductDialogMode mode;

  const ProductState({
    this.id = '',
    this.name = '',
    this.price = '',
    this.quantity = 0,
    this.image = '',
    this.description = '',
    this.category = '',
    this.rating = 0,
    this.status = ProductDialogStatus.initial,
    this.mode = ProductDialogMode.add,
    this.errorMessage,
  });

  ProductState copyWith({
    String? id,
    String? name,
    String? price,
    int? quantity,
    String? image,
    String? description,
    String? category,
    double? rating,
    ProductDialogStatus? status,
    ProductDialogMode? mode,
    String? errorMessage,
  }) {
    return ProductState(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
      description: description ?? this.description,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      status: status ?? this.status,
      mode: mode ?? this.mode,
      errorMessage: errorMessage,
    );
  }
}
