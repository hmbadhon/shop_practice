import 'package:flutter/foundation.dart';

class Cart {
  final String id;
  final String title;
  final int quantity;
  final double price;

  Cart(
      {@required this.title,
      @required this.price,
      @required this.id,
      @required this.quantity});
}
