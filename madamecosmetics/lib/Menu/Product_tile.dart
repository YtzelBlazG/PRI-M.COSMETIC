import 'package:flutter/material.dart';
import 'package:flutter_application_3/Menu/product.dart';

class ProductTile extends StatelessWidget{
  final Product product;
  const ProductTile({
    super.key, 
    required this.product,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 25),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            product.imagePath,
            height: 140,
          ),

          Text(
            product.name,
            style: TextStyle(fontSize: 20),
          ),
        
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$' + product.price, 
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: Colors.grey[700],
                  ),
                ),

                Row(
                  children: [
                    Icon(
                      Icons.star, 
                      color: Colors.yellow[800],
                    ),
                    Text(
                      product.rating, 
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          )     
        ],
      ),
    );
  }
}