import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_walkthrough/providers/products_provider.dart';

class ProductDetails extends StatelessWidget {
  static final String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10,),
            Text(loadedProduct.price.toString()),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(loadedProduct.description, textAlign: TextAlign.center, softWrap: true,))
          ],
        ),
      ),
    );
  }
}
