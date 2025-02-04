import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<List<dynamic>> _shopItems = [
    ['Avocado', '4.00', "assets/avocado.png", Colors.green],
    ['Banana', '8.00', "assets/banana.png", Colors.yellow],
    ['Orange', '6.00', "assets/orange.png", Colors.orange],
    ['Chocolate', '8.00', "assets/chocolate.png", Colors.brown]
  ];

  List<List<dynamic>> _cartItems = [];

  List<List<dynamic>> get shopItems => _shopItems;
  List<List<dynamic>> get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  // Calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (var item in _cartItems) {
      totalPrice += double.tryParse(item[1]) ?? 0.0;
    }
    return totalPrice.toStringAsFixed(2);
  }
}
