import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_practice/providers/products_dummy.dart';
import 'package:shop_practice/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool fav;

  ProductGrid({this.fav});
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsDummy>(context);
    final products = fav ? productsData.favorite : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
      ),
    );
  }
}
