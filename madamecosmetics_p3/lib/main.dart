import 'package:flutter/material.dart';
import 'package:madamecosmetics/pages/CartPage.dart';
import 'package:madamecosmetics/pages/login_screen.dart';
import 'package:madamecosmetics/provider/cart_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        routes: {
          "/": (context) => LoginScreen(),
          "cartPage": (context) => CartPage(),
        },
      ),
    );
  }
}
