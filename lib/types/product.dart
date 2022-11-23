class Product {
  final String name;
  final String image;

  const Product({
    required this.name,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String,
      image:
          'https://www.chatelaine.com/wp-content/uploads/2013/05/Curried-chicken-salad.jpg',
    );
  }
}
