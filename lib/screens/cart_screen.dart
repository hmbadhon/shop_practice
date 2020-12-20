import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_practice/providers/cart_item.dart';
import 'package:shop_practice/providers/order_items.dart';
import 'package:shop_practice/widgets/cart_single_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<CartItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartItem.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('ORDER NOW'),
                    onPressed: () {
                      Provider.of<OrderItems>(context, listen: false).addOrder(
                        cartItem.items.values.toList(),
                        cartItem.totalAmount,
                      );
                      cartItem.clear();
                    },
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cartItem.items.length,
              itemBuilder: (context, i) => CartSingleItem(
                productId: cartItem.items.keys.toList()[i],
                id: cartItem.items.values.toList()[i].id,
                price: cartItem.items.values.toList()[i].price,
                quantity: cartItem.items.values.toList()[i].quantity,
                title: cartItem.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
