import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  static final String routeName = '/details';

  @override
  Widget build(BuildContext context) {
   final id = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('title'),),
    );
  }
}