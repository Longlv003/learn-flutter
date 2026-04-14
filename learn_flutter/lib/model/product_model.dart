class ProductModel {
  final String? id;
  final String name;
  final double price;
  final int quantity;
  final String image;
  final String description;
  final String category;
  final double rating;

  ProductModel({
    this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
    required this.description,
    required this.category,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'] ?? '',
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image,
      'description': description,
      'category': category,
      'rating': rating,
    };
  }
}
