import 'package:flutter/material.dart';
import 'package:provider_walkthrough/providers/cart.dart';
import 'package:provider_walkthrough/screens/cart_screen.dart';
import 'package:provider_walkthrough/screens/product_detail_screen.dart';
import 'package:provider_walkthrough/screens/products_overview_screen.dart';
import './providers/products_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductsOverviewScreen(),
        routes: {ProductDetails.routeName: (ctx) => ProductDetails(),
        CartScreen.routeName: (ctx) => CartScreen()
        
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: Center(
        child: Text('Let\'s build a shop!'),
      ),
    );
  }
}
