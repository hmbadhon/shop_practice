import 'package:flutter/material.dart';
import 'package:shop_practice/providers/cart_item.dart';
import 'package:shop_practice/providers/order_items.dart';
import 'package:shop_practice/providers/products_dummy.dart';
import 'package:shop_practice/screens/cart_screen.dart';
import 'package:shop_practice/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_practice/screens/order_screen.dart';
import 'package:shop_practice/screens/product_add_screen.dart';
import 'package:shop_practice/screens/product_details_screen.dart';
import 'package:shop_practice/screens/product_management_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsDummy(),
        ),
        ChangeNotifierProvider.value(
          value: CartItem(),
        ),
        ChangeNotifierProvider.value(
          value: OrderItems(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          ProductDetails.routeName: (context) => ProductDetails(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          ProductManagement.routeName: (context) => ProductManagement(),
          ProductAddScreen.routeName: (context) => ProductAddScreen(),
        },
      ),
    );
  }
}
