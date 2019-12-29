import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_walkthrough/providers/auth.dart';
import 'package:provider_walkthrough/screens/auth-screen.dart';

import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            update: (BuildContext context, auth, previousProducts) => Products(
                auth.token,
                previousProducts == null ? [] : previousProducts.items, auth.userId),
            create: (_) {},
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProxyProvider<Auth, Orders>(
            update: (BuildContext context, auth, previousOrders) => Orders(
                auth.token,
                previousOrders == null ? [] : previousOrders.orders, auth.userId),
                  create: (_) {},
          ),
            
        ],
        child: Consumer<Auth>(
            builder: (ctx, auth, _) => MaterialApp(
                    title: 'MyShop',
                    theme: ThemeData(
                      primarySwatch: Colors.purple,
                      accentColor: Colors.deepOrange,
                      fontFamily: 'Lato',
                    ),
                    home: auth.isAuth ? ProductsOverviewScreen() : FutureBuilder(future: auth.tryAutoLog(), builder: (ctx, authStatus) =>authStatus.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator(),) : AuthScreen()) ,
                    routes: {
                      ProductDetailScreen.routeName: (ctx) =>
                          ProductDetailScreen(),
                      CartScreen.routeName: (ctx) => CartScreen(),
                      OrdersScreen.routeName: (ctx) => OrdersScreen(),
                      UserProductsScreen.routeName: (ctx) =>
                          UserProductsScreen(),
                      EditProductScreen.routeName: (ctx) => EditProductScreen(),
                    })));
  }
}
