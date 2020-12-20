import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_practice/models/product_model.dart';
import 'package:shop_practice/providers/cart_item.dart';
import 'package:shop_practice/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);
    final cartItem = Provider.of<CartItem>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        header: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black87,
              ),
              child: IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  product.checkFavStats();
                },
              ),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            //navigate
            Navigator.pushNamed(context, ProductDetails.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Center(
            child: Text(
              product.title,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              cartItem.addProduct(product.id, product.price, product.title);
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
