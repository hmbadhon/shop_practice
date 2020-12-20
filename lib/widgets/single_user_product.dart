import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_practice/providers/products_dummy.dart';
import 'package:shop_practice/screens/product_add_screen.dart';

class SingleUserProduct extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;

  SingleUserProduct({this.imageUrl, this.price, this.id, this.title});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(price.toString()),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(ProductAddScreen.routeName, arguments: id);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Are You Sure?'),
                      content: Text('This action will delete your product!'),
                      actions: [
                        FlatButton(
                          child: Text('YES'),
                          onPressed: () {
                            Provider.of<ProductsDummy>(context, listen: false)
                                .removeProduct(id);
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('NO'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
