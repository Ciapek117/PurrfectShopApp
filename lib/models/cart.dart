import 'package:purrfectshop_app/models/product.dart';
import 'package:purrfectshop_app/models/all_products.dart';

class Cart {

  // Lista kotkow na sprzedaz
  final List<Product> catList = AllProducts().getProductList();

  // Lista kotkow w koszyku
  List<Product> userCart = [];

  // pobiera liste butow na sprzedaz
  List<Product> getCatList() {
    return catList;
  }

  // pobierz koszyk
  List<Product> getUserCart() {
    return userCart;
  }

  // dodaj kotka do koszyka
  void addItemToCart(Product cat) {
    userCart.add(cat);
  }

  // usun item
  void removeItemFromCart(Product cat) {
    userCart.remove(cat);
  }

}