import 'package:flutter/material.dart';
import 'package:madamecosmetics/models/CartItem.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> cartItems = [];

  void add(CartItem cartItem) {
    cartItems.add(cartItem);
    notifyListeners();
  }

  void remove(CartItem cartItem) {
    cartItems.remove(cartItem);
    notifyListeners();
  }

  void removeAll() {
    cartItems.clear();
    notifyListeners();
  }

  double get total {
    double total = 0;
    for (var cartItem in cartItems) {
      total += cartItem.price * cartItem.quantity;
    }
    return total;
  }
}
