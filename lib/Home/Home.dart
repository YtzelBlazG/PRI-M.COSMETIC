import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_application_3/Menu/MenuPage.dart';
import 'package:flutter_application_3/Product/ProductEdit.dart';

class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({Key? key, required this.userName}) : super(key: key);
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _showFABs = false; // Variable para mostrar/ocultar los botones flotantes

  final screens = [
    const Center(child: Text('Home Screen', style: TextStyle(fontSize: 45))),
    const Center(
        child: Text('Settings Screen', style: TextStyle(fontSize: 45))),
    const Center(child: Text('Search Screen', style: TextStyle(fontSize: 45))),
    const Center(child: Text('Menu Screen', style: TextStyle(fontSize: 45))),
    const MenuPage(),
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

  // Colores personalizados para los botones flotantes
  final fabBackgroundColor = Colors.black;
  final fabIconColor = Colors.white;

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
                'Hola! ${widget.userName}',
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Image/Flor.png'), fit: BoxFit.fitWidth),
        ),
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 10),
        child: GNav(
          color: Colors.black,
          tabBackgroundGradient: LinearGradient(colors: colors2),
          selectedIndex: _currentIndex,
          tabBorderRadius: 10,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
              _showFABs = (index == 3); // Mostrar botones flotantes solo en la pestaña "Menu"
            });
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.menu,
              text: 'Menu',
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButton: _showFABs
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 16),
                FloatingActionButton(
                  onPressed: _navigateToProductEdit,
                  tooltip: 'Editar Producto',
                  child: const Icon(Icons.edit),
                  backgroundColor: fabBackgroundColor,
                  foregroundColor: fabIconColor,
                ),
              ],
            )
          : null, // Mostrar los botones flotantes solo cuando _showFABs es true
    );
  }
  void _navigateToProductEdit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductEdit(),
      ),
    );
  }
}