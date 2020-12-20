import 'package:flutter/foundation.dart';
import 'package:shop_practice/models/cart_model.dart';

class Orders {
  final String id;
  final double amount;
  final List<Cart> products;
  final DateTime dateTime;

  Orders(
      {@required this.id,
      @required this.products,
      @required this.amount,
      @required this.dateTime});
}
