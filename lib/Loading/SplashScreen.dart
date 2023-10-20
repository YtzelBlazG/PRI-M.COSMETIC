import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(-1.0, 0.0), // Comienza a la izquierda
    end: const Offset(0.0, 0.0), // Termina en el centro
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut, // Usar elasticOut para un efecto de rebote
  ));

  bool _animationStarted = false; // Variable de control

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Verifica si la animación aún no ha comenzado
    if (!_animationStarted) {
      _controller.forward(); // Inicia la animación
      _animationStarted = true; // Actualiza la variable de control
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Image/Fondo1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/Image/logo.jpg',
                width: 200,
                height: 200,
              ),
            ),
            // Row de imágenes
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Alinea al centro
              children: [
                SlideTransition(
                  position: _offsetAnimation,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/Image/facebook.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                SlideTransition(
                  position: _offsetAnimation,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/Image/insta.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                SlideTransition(
                  position: _offsetAnimation,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/Image/whatsapp logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
