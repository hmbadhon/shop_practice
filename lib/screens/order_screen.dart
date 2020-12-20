import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_practice/providers/order_items.dart';
import 'package:shop_practice/widgets/app_drawer.dart';
import 'package:shop_practice/widgets/order_page_items.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = 'orders_screen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderItems>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) =>
            OrderPageItems(order: orderData.orders[index]),
      ),
    );
  }
}
