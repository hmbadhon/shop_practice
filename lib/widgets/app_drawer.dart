import 'package:flutter/material.dart';
import 'package:shop_practice/screens/home_screen.dart';
import 'package:shop_practice/screens/order_screen.dart';
import 'package:shop_practice/screens/product_management_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Product Management'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductManagement.routeName);
            },
          ),
        ],
      ),
    );
  }
}
