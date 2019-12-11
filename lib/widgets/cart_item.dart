import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_walkthrough/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem({this.productId,this.id, this.price, this.title, this.quantity, });
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        cart.removeItem(productId);
      },
      background: Container(

        margin: EdgeInsets.all(10),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 10),
        color: Colors.red, child: Icon(Icons.delete, size: 40,),),
          child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(child: Text('\$$price')),
              
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
