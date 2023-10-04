import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/Image/Fondo1.jpg', 
            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset(
              'assets/Image/logo.jpg', 
              width: 200, 
              height: 200, 
            ),
          ),
          // Row de imágenes
          Positioned(
            bottom: 20, // Ajusta la distancia desde la parte inferior
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espacio uniforme entre las imágenes
              children: [
                Image.asset(
                  'assets/Image/facebook.png',
                  width: 100, // Ancho deseado de la imagen
                  height: 100, // Altura deseada de la imagen
                ),
                Image.asset(
                  'assets/Image/insta.png',
                  width: 100,
                  height: 100,
                ),
                Image.asset(
                  'assets/Image/whatsapp logo.png',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
