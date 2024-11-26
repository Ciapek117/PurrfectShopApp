import 'product.dart'; // Zakładając, że masz już klasę Product

class AllProducts {
  List<Product> _products = [];

  // Funkcja, która zwraca wszystkie produkty
  List<Product> getProductList() {
    return _products;
  }

  // Funkcja, która pozwala dodać produkty do listy
  void setProducts(List<Product> products) {
    _products = products;
  }

  // Funkcja do pobierania unikalnych tagów
  List<Tags> getUniqueTags() {
    // Możesz dodać logikę do wyciągania unikalnych tagów
    return Tags.values;
  }
}
