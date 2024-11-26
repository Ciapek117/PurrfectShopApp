import 'package:purrfectshop_app/models/product.dart';

class AllProducts{
  List<Product> getProductList(){
    return productsList;
  }

  List<Tags> getUniqueTags() {
    return productsList.map((product) => product.tags).toSet().toList();
  }

  void addToProductList(Product product){
    productsList.add(product);
  }



  List<Product> productsList = [
    // Product(
    //     name: 'Kotek1',
    //     imagePath: 'images/images_for_tiles/kot1.jpg',
    //     price: '101',
    //     description: 'Kot wyleguje się na parapecie, wchłaniając promienie słoneczne.',
    //     tags: Tags.cos1),
    //
    // Product(
    //     name: 'Kotek2',
    //     imagePath: 'images/images_for_tiles/kot2.jpg',
    //     price: '102',
    //     description: 'Zwinny jak cień, kot skacze z mebla na mebel w kilka sekund.',
    //     tags: Tags.cos2),
    //
    // Product(
    //     name: 'Kotek3',
    //     imagePath: 'images/images_for_tiles/kot3.jpg',
    //     price: '103',
    //     description: 'Mruży oczy, wskazując na swój spokój i pewność siebie.',
    //     tags: Tags.cos3),
    //
    // Product(
    //     name: 'Kotek4',
    //     imagePath: 'images/images_for_tiles/kot4.jpg',
    //     price: '104',
    //     description: 'Jego futro jest miękkie jak jedwab, a oczy jak złote perły.',
    //     tags: Tags.cos4),
    //
    // Product(
    //     name: 'Kotek5',
    //     imagePath: 'images/images_for_tiles/kot5.jpg',
    //     price: '105',
    //     description: 'Głaszczesz go, a on mruczy jak silnik, zadowolony do granic możliwości.',
    //     tags: Tags.cos5)


  ];


}