class ProductEntity {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final double? rating;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.rating,
  });

  @override
  String toString() {
    return 'ProductEntity(id: $id, title: $title, '
        'price: $price,)';
  }
}
