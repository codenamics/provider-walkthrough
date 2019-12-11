import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_walkthrough/providers/orders.dart' show Orders;
import 'package:provider_walkthrough/widgets/app_drawer.dart';
import 'package:provider_walkthrough/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders'),),
      drawer: AppDrawer(),
      body: ListView.builder(
        
        itemCount: ordersData.orders.length,
      itemBuilder: (ctx, i) => OrderItems(ordersData.orders[i]),
      
      
      )
    );
  }
}