import 'package:purrfectshop_app/models/product.dart';

class AllProducts{
  List<Product> getProductList(){
    return productsList;
  }

  List<Tags> getUniqueTags() {
    return productsList.map((product) => product.tags).toSet().toList();
  }


  List<Product> productsList = [
    Product(
        name: 'Kotek1',
        imagePath: 'images/images_for_tiles/kot1.jpg',
        price: '101',
        description: '',
        tags: Tags.cos1),

    Product(
        name: 'Kotek2',
        imagePath: 'images/images_for_tiles/kot2.jpg',
        price: '102',
        description: '',
        tags: Tags.cos2),

    Product(
        name: 'Kotek3',
        imagePath: 'images/images_for_tiles/kot3.jpg',
        price: '103',
        description: '',
        tags: Tags.cos3),

    Product(
        name: 'Kotek4',
        imagePath: 'images/images_for_tiles/kot4.jpg',
        price: '104',
        description: '',
        tags: Tags.cos4),

    Product(
        name: 'Kotek5',
        imagePath: 'images/images_for_tiles/kot5.jpg',
        price: '105',
        description: '',
        tags: Tags.cos5)
  ];


}