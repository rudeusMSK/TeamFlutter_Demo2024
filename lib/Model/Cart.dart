import 'package:flutter/material.dart';

class Cart{
  final String id;
  final String name;
  final String imageUrl;
  final String price; 
  int quantity; 

  Cart({required this.id , required this.name, required this.price, required this.imageUrl, this.quantity = 1});
  double get totalPrice => double.parse(price) * quantity;
}


class Cartprovider with ChangeNotifier{
  final List<Cart> _items = [];

  List<Cart> get items => _items;

  void addItem(Cart item) {
    final existingItemIndex = _items.indexWhere((i) => i.id == item.id);
    if (existingItemIndex >= 0) {
      // Nếu sản phẩm đã có trong giỏ hàng, tăng số lượng
      _items[existingItemIndex].quantity += item.quantity;
    } else {
      // Thêm sản phẩm mới vào giỏ hàng
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  double get TotalPrice{
    return _items.fold(
      0.0,
      (previousValue, item) => previousValue + double.parse(item.price) * item.quantity,
    );
  } 

  void increaseQuantity(String id) {
    final itemIndex = _items.indexWhere((item) => item.id == id);
    if (itemIndex >= 0) {
      _items[itemIndex].quantity += 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(String id) {
    final itemIndex = _items.indexWhere((item) => item.id == id);
    if (itemIndex >= 0) {
      if (_items[itemIndex].quantity > 1) {
        _items[itemIndex].quantity -= 1;
      } else {
        _items.removeAt(itemIndex);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}