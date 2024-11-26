enum Tags{
  cos1,
  cos2,
  cos3,
  cos4,
  cos5,
}

class Product{
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
    required this.tags
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      price: map['price'] ?? 0.0,
      imagePath: map['imageUrl'],
      description: map['description'],
      tags: map['tag'],
    );
  }

  // Konwersja obiektu Product na mapę (do zapisania w Firestore)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageUrl' : imagePath,
      'description' : description,
      'tag': tags
    };
  }
}