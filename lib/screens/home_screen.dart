import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_practice/providers/cart_item.dart';
import 'package:shop_practice/screens/cart_screen.dart';
import 'package:shop_practice/widgets/Product_grid.dart';
import 'package:shop_practice/widgets/app_drawer.dart';
import 'package:shop_practice/widgets/badge.dart';

enum filter {
  favorite,
  all,
}

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop app v2'),
        actions: [
          Consumer<CartItem>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (filter sValue) {
              setState(() {
                if (sValue == filter.favorite) {
                  _showFav = true;
                } else {
                  _showFav = false;
                }
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Favorite'),
                value: filter.favorite,
              ),
              PopupMenuItem(
                child: Text('All Products'),
                value: filter.all,
              ),
            ],
            icon: Icon(Icons.more_vert),
          ),
        ],
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: ProductGrid(
        fav: _showFav,
      ),
    );
  }
}
