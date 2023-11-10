import 'package:flutter/widgets.dart';
import 'package:suq_app/models/product.dart';

class Shop extends ChangeNotifier {
  // Product for sale
  final List<Product> _shop = [
    Product(
      productName: 'Product 1',
      description: "Lorem ipsum",
      price: 99.99,
    ),
    Product(
      productName: 'Product 2',
      description: "Lorem ipsum",
      price: 99.99,
    ),
    Product(
      productName: 'Product 3',
      description: "Lorem ipsum",
      price: 99.99,
    ),
    Product(
      productName: 'Product 4',
      description: "Lorem ipsum",
      price: 99.99,
    ),
  ];

  // user Cart
  final List<Product> _cart = [];

  // get Product lists
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add Item to cart
  void addItemToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove Item from cart
  void removeItemFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
