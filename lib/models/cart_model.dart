import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items for sale
  final List _shopItems = [
    // [itemName,itemPrice,imagePath,color]
    ['Avicadore', '4.00', 'images/avocado.png', Colors.green],
    ['Baanan', '2.50', 'images/bananas.png', Colors.yellow],
    ['Chicken', '12.88', 'images/chicken.png', Colors.brown],
    ['Water', '1.00', 'images/water.png', Colors.blue],
  ];

  // list of cart items
  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
