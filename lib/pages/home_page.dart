import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart_pages.dart';
import 'package:food_delivery/provider/cart_provider.dart';

import 'package:food_delivery/widgets/grocery_item_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(Icons.shopping_bag),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CartPage();
                  },
                ),
              );
            }),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 48,
              ),
              Text('Good morning'),
              Text(
                'Let order items for you',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 24,
              ),
              Divider(),
              Text('Fresh Items'),
              Expanded(
                  child: Consumer<CartProvider>(builder: (context, value, child) {
                return GridView.builder(
                    itemCount: value.shopItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1 / 1.5),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addItemToCart(index);
                        },
                      );
                    });
              }))
            ],
          ),
        ));
  }
}
