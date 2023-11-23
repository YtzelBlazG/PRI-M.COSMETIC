import 'package:flutter/material.dart';
import 'package:madamecosmetics/widgets/DetailsWidget.dart';
import '../models/Product.dart' as OriginalProduct;

class ItemsWidget extends StatelessWidget {
  final List<OriginalProduct.Product> products;

  const ItemsWidget({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp(product: products[index])),
            );
          },
          child: Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.yellow[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        products[index].priceOfert / products[index].priceBase < 1
                            ? '-${(100 - products[index].priceOfert / products[index].priceBase * 100).toStringAsFixed(0)}%'
                            : 'N/A',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Image.network(
                      products[index].imageUrl.isNotEmpty
                          ? products[index].imageUrl
                          : 'https://t3.ftcdn.net/jpg/02/48/42/64/240_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg',
                      fit: BoxFit.cover),

                  // asset(
                  //   "lib/img/${index + 1}.jpg",
                  //   height: 200,
                  //   width: 160,
                  //   fit: BoxFit.contain,
                  // ),
                ),
                SizedBox(height: 10),
                Text(
                  products[index].nameProduct,
                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  products[index].description,
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$${products[index].priceBase.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.shopping_cart_checkout,
                      color: Colors.grey[700],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
