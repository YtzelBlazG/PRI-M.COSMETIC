import 'package:flutter/material.dart';
import 'package:flutter_application_3/Menu/button.dart';
import 'package:flutter_application_3/Menu/colors.dart';
import 'package:flutter_application_3/Menu/product.dart';
import 'package:flutter_application_3/Menu/Product_tile.dart';

class MenuPage extends StatefulWidget{
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>{

  //Products Menu
  List productMenu = [
    Product(
      name: "Producto 1", 
      price: "21.00", 
      imagePath: "lib/img/1.jpg", 
      rating: "4.9",
      ),
    
    Product(
        name: "Producto 2", 
        price: "25.00", 
        imagePath: "lib/img/2.jpg", 
        rating: "4.3",
        ),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'Madame Natural',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          Container(
            decoration: BoxDecoration(color: primaryColor, 
              borderRadius: BorderRadius.circular(20)
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Get 32% Promo', style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),),

                    const SizedBox(height: 20),

                    MyButton(
                      text: "Canjear", 
                      onTap: () {},
                    ),
                  ],
                ),
              
                Image.asset(
                  'lib/img/madame.png', 
                  height: 100,
                ),

              ]),
          ),
        
          const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(                 
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Buscar...",
                ),
            ),
          ),

            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Lista Productos", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 18,
                  ),
                ),
            ),
            
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productMenu.length,
                itemBuilder: (context, index) => ProductTile(
                  product: productMenu[index],
                ),
              ),
          ),

          const SizedBox(height: 25),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
              margin: const EdgeInsets.only(left: 25, right: 35, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/img/3.jpg',
                        height: 60,
                      ),
                    
                      const SizedBox(width: 20),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Producto 3", 
                            style: TextStyle(fontSize: 18),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            '\$21.00',
                            style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),

                const Icon(
                  Icons.favorite_outline, 
                  color: Colors.grey,
                  size: 28,
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}