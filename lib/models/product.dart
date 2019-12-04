class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  Product(
      {this.title,
      this.description,
      this.id,
      this.imageUrl,
      this.price,
      this.isFavorite = false});
}
