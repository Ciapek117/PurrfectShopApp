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

  // Nadpisanie operatora == do porównania produktów po nazwie lub innym polu
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.name == name; // Porównujemy po nazwie produktu
  }

  // Nadpisanie hashCode, aby pasował do operatora ==
  @override
  int get hashCode => name.hashCode; // Używamy `name` do generowania hashCode
}

enum Tags {
  orange,
  white,
  gray,
}
