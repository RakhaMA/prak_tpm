class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;
  final Map<String, dynamic> rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.rating,
  });


  factory Product.fromJson(Map<String, dynamic> json) {
    final ratingJson = json['rating'];
    final rating = {
      'count': ratingJson['count'],
      'rate': ratingJson['rate'].toDouble(),
    };
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      image: json['image'],
      category: json['category'],
      rating: rating,
    );
  }
}
