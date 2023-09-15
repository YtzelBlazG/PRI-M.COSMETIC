import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final screens = [
    const Center(child: Text('Home Screen', style: TextStyle(fontSize: 45))),
    const Center(
        child: Text('Settings Screen', style: TextStyle(fontSize: 45))),
    //const Center(child:Text('Search Screen', style: TextStyle(fontSize: 45))),
    const Center(child: Text('Menu Screen', style: TextStyle(fontSize: 45))),
  ];

  final gradient = LinearGradient(
    colors: [Colors.black, Colors.yellow],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  final colors = [Colors.yellow, Colors.yellowAccent];

  final colors2 = [
    Colors.black,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MadameNatural',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colors2,
          )),
        ),
        actions: [
          Row(
            children: [
              Text(
                'Hola! matapepitos3000',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.person_3_rounded),
            color: Colors.white,
            onPressed: () {
              // Agrega la funcionalidad que desees para el icono de persona.
            },
          )
        ],
      ),

      /*body: Stack(
        children: [
          // Fondo de imagen
          Positioned.fill(
            child: Image.asset(
              'assets/images/flor_2.png', // Ruta de la imagen de fondo
              fit: BoxFit.cover, // Ajusta la imagen al tamaño de la pantalla
            ),
          ),
          // Contenido principal
          Center(
            child: screens[_currentIndex],
          ),
        ],
      ),*/
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/flor1.png'), fit: BoxFit.fitWidth),
          ),
          child: screens[_currentIndex]),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 10),
        child: GNav(
          color: Colors.black,

          //tabBackgroundColor: Colors.black,
          tabBackgroundGradient: LinearGradient(colors: colors2),
          selectedIndex: _currentIndex,
          tabBorderRadius: 10,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          onTabChange: (index) => {setState(() => _currentIndex = index)},

          tabs: const [
            GButton(
                icon: Icons.home,
                text: 'Home',
                iconActiveColor: Colors.white,
                textColor: Colors.white),
            GButton(
                icon: Icons.settings,
                text: 'Settings',
                iconActiveColor: Colors.white,
                textColor: Colors.white),
            /*
          GButton(icon: Icons.search,
          text:'Search',
          iconActiveColor: Colors.white,
          textColor: Colors.white
          ),*/

            GButton(
                icon: Icons.menu,
                text: 'Menu',
                iconActiveColor: Colors.white,
                textColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
