enum Tags{
  cos1,
  cos2,
  cos3,
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
}