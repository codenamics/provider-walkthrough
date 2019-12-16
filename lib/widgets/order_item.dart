import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../providers/orders.dart' as ord;

class OrderItems extends StatefulWidget {
  final ord.OrderItem order;

  OrderItems(this.order);

  @override
  _OrderItemsState createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle:
                Text(DateFormat('dd MM yyyy').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if(_expanded) Container(
            margin: EdgeInsets.all(10),
            height: min(widget.order.products.length * 20.0, 180),
          
          child: ListView.builder(
            itemBuilder: (ctx, i) => 
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text(widget.order.products[i].title),
              Text('${widget.order.products[i].quantity} x \$${widget.order.products[i].price}')
            ],)
            ,
            itemCount: widget.order.products.length,
          ),
          )
        ],
      ),
    );
  }
}
