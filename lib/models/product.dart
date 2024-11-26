class Product {
  final String name;
  final String imagePath;
  final String price;
  final String description;
  final Tags tags;

  Product({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.tags,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? 'No name',
      price: map['price'] ?? '0.0',
      imagePath: map['imageUrl'] ?? '',
      description: map['description'] ?? 'No description',
      tags: Tags.values.firstWhere(
            (e) => e.toString() == 'Tags.${map['tag']}',
        orElse: () => Tags.orange,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imagePath,
      'description': description,
      'tag': tags.toString().split('.').last,
    };
  }
}

enum Tags {
  orange,
  white,
  gray,
}