import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_walkthrough/providers/cart.dart' show Cart;
import 'package:provider_walkthrough/providers/orders.dart';
import 'package:provider_walkthrough/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
        ),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title.color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  RaisedButton(
                    child: Text('Order Now'),
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrders(
                          cart.items.values.toList(), cart.totalAmount);
                          cart.clear();
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cart.itemCount,
            itemBuilder: (ctx, index) => CartItem(
              productId: cart.items.keys.toList()[index],
              id: cart.items.values.toList()[index].id,
              title: cart.items.values.toList()[index].title,
              quantity: cart.items.values.toList()[index].quantity,
              price: cart.items.values.toList()[index].price,
            ),
          ))
        ],
      ),
    );
  }
}
