import 'package:flutter/material.dart';
import 'package:flutter_application_3/Loading/SplashScreen.dart'; // Asegúrate de importar la clase LoginPage desde su archivo correspondiente

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
