import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_walkthrough/providers/cart.dart';
import 'package:provider_walkthrough/providers/product.dart';
import 'package:provider_walkthrough/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return GridTile(
      child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetails.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          )),
      footer: GridTileBar(
        trailing: IconButton(
          icon: Icon(Icons.shopping_basket),
          onPressed: () {
            cart.addItem(product.id, product.price, product.title);
            Scaffold.of(context).showSnackBar(SnackBar(
              action: SnackBarAction(label: 'UNDO', onPressed: (){
                cart.removeItemFromCart(product.id);
              },),
              
              content: Text('Added'),));
          },
        ),
        backgroundColor: Colors.black54,
        leading: Consumer<Product>(
          builder: (ctx, product, _) => IconButton(
            icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              product.toogleFavorite();
            },
          ),
        ),
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
