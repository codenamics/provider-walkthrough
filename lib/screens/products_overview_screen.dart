import 'package:flutter/material.dart';
import 'package:provider_walkthrough/widgets/products_grid.dart';



class ProductsOverviewScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body:  ProductsGrid(),
    );
  }
}


