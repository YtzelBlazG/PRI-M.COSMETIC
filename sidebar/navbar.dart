import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Sebas Bueno'),
            accountEmail: const Text('sebasbueno@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/Image/persona3.jpg'),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                image: DecorationImage(
                    image: AssetImage('assets/Image/persona3.jpg'),
                    fit: BoxFit.cover)),
          ),
          AnimatedListTile(
            icon: Icons.local_florist,
            text: 'Catálogo',
            onTap: () => print('Catálogo tapped'),
          ),
          AnimatedListTile(
            icon: Icons.bubble_chart,
            text: 'Nuevos Productos',
            onTap: () => print('Nuevos productos tapped'),
          ),
          AnimatedListTile(
            icon: Icons.local_offer,
            text: 'Promociones',
            onTap: () => print('Promocion tapped'),
          ),
          AnimatedListTile(
            icon: Icons.shopping_cart,
            text: 'Carrito',
            onTap: () => print('Carrito tapped'),
          ),
          AnimatedListTile(
            icon: Icons.info,
            text: 'Nosotros',
            onTap: () => print('Nosotros tapped'),
          ),
          AnimatedListTile(
            icon: Icons.notifications,
            text: 'Notificaciones',
            onTap: () => print('Notificaciones tapped'),
          ),
          Divider(),
          AnimatedListTile(
            icon: Icons.settings,
            text: 'Configuración',
            onTap: () => print('Configuración tapped'),
          ),
          AnimatedListTile(
            icon: Icons.logout,
            text: 'Cerrar Sesión',
            onTap: () => print('Cerrar Sesión tapped'),
          ),
        ],
      ),
    );
  }
}

class AnimatedListTile extends StatefulWidget {
  final IconData icon;
  final String text;
  final Function() onTap;

  const AnimatedListTile(
      {required this.icon, required this.text, required this.onTap});

  @override
  _AnimatedListTileState createState() => _AnimatedListTileState();
}

class _AnimatedListTileState extends State<AnimatedListTile> {
  String _visibleText = '';

  @override
  void initState() {
    super.initState();
    _animateText();
  }

  void _animateText() {
    int delay = 100;
    for (int i = 0; i < widget.text.length; i++) {
      Future.delayed(Duration(milliseconds: delay), () {
        setState(() {
          _visibleText = widget.text.substring(0, i + 1);
        });
      });
      delay += 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.icon),
      title: Text(_visibleText,
          style: TextStyle(color: Colors.black, fontSize: 16.0)),
      onTap: widget.onTap,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: NavBar(),
      ),
    ),
  ));
}
