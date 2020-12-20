import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_practice/providers/products_dummy.dart';
import 'package:shop_practice/screens/product_add_screen.dart';
import 'package:shop_practice/widgets/app_drawer.dart';
import 'package:shop_practice/widgets/single_user_product.dart';

class ProductManagement extends StatelessWidget {
  static const routeName = 'product_management';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsDummy>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Management'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.pushNamed(context, ProductAddScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: productsData.items.length,
        itemBuilder: (context, index) => Column(
          children: [
            SingleUserProduct(
              id: productsData.items[index].id,
              title: productsData.items[index].title,
              price: productsData.items[index].price,
              imageUrl: productsData.items[index].imageUrl,
            ),
          ],
        ),
      ),
    );
  }
}
