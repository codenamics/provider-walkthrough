import 'package:flutter/material.dart';
import 'package:provider_walkthrough/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;

  final String title;
  final String imageUrl;

  ProductItem({this.imageUrl, this.id, this.title});
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(ProductDetails.routeName, arguments: id);
        },
        
        child: Image.network(imageUrl, fit: BoxFit.cover,)),
      footer: GridTileBar(
        
        trailing: IconButton(icon: Icon(Icons.shopping_basket),
        
        onPressed: (){},
        ),
        backgroundColor: Colors.black54,
        leading: IconButton(icon: Icon(Icons.favorite),
        
        onPressed: (){},
        ),
        title: Text(title, textAlign: TextAlign.center,),),
    );
  }
}