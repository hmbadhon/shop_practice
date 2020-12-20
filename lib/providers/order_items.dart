import 'package:flutter/foundation.dart';
import 'package:shop_practice/models/cart_model.dart';
import 'package:shop_practice/models/order_model.dart';

class OrderItems with ChangeNotifier {
  List<Orders> _orders = [];

  List<Orders> get orders {
    return [..._orders];
  }

  void addOrder(List<Cart> cartProducts, double total) {
    _orders.insert(
      0,
      Orders(
        id: DateTime.now().toString(),
        products: cartProducts,
        amount: total,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
